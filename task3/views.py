'''
Views for the task 1
'''

from django.http import JsonResponse
from django.views.decorators.http import require_http_methods
import logging
from utils.fetch_query_sql import fetch_query
from utils.list_to_dict import columns_to_dict
logger = logging.getLogger(__name__)

@require_http_methods(["GET"])
def task3(request):
    """
    Task 1 :- Hospital Resource Utilization
    """
    try:
        # Extract date input variables from query parameters
        start_date = request.GET.get('start_date')
        end_date = request.GET.get('end_date')
        
        # Validate start_date is provided
        if not start_date:
            return JsonResponse({
                'success': False,
                'error': 'start_date parameter is required'
            }, status=400)
        
        # If end_date is not provided, use current date
        if not end_date:
            from datetime import date
            end_date = date.today().strftime('%Y-%m-%d')
        
        # Optional: Validate date format
        try:
            from datetime import datetime
            datetime.strptime(start_date, '%Y-%m-%d')
            datetime.strptime(end_date, '%Y-%m-%d')
        except ValueError:
            return JsonResponse({
                'success': False,
                'error': 'Invalid date format. Please use YYYY-MM-DD format'
            }, status=400)
        
        logger.info(f"Processing request with start_date: {start_date}, end_date: {end_date}")
        
        query = f"""
            with admDays as (
            select DATEDIFF(COALESCE(pat.discharged_date),pat.admitted_date ) as days, pat.id from patients as pat 
            )
            select 
                    dep.name as departmentName,
                    count(distinct pat.id) as totalPatients,
                    count(dep.name) as appointmentsCount,
                    dep.id as departmentId,
                    count(distinct doc.id) as totalDoctors,
                    round(avg(days.days),1) as avgStayDays,
                    round(count(distinct pat.id)/count(distinct doc.id),1) as doctorPatientRatio
            from appointments as app
            join doctors as doc on doc.id=app.doctor_id and doc.is_active=1
            join departments as dep on dep.id=doc.dept_id and dep.is_active=1
            join patients as pat on app.patient_id=pat.id 
            join admDays as days on days.id =pat.id
            where pat.admitted_date between date('{start_date}') and date('{end_date}')
            group by dep.name
            ;
        """
        
        # Hit the query
        rows, columns = fetch_query(query, logger)
        # Convert to list of dictionaries
        results = columns_to_dict(rows, columns, logger)
        # return the Response 
        return JsonResponse({
            'success': True,
            'data': results,
            'count': len(results),
            'start_date': start_date,
            'end_date': end_date
        })
        
    except Exception as e:
        logger.error(f"Error Occured: {str(e)}")
        return JsonResponse({
            'success': False,
            'error': f"{str(e)}"
        }, status=500)
