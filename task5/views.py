'''
Veiws for handling XML file uploads in a Django REST Framework application.
'''
from rest_framework.views import APIView
from django.http import JsonResponse
import logging
from utils.fetch_query_sql import fetch_query
from utils.list_to_dict import columns_to_dict
logger = logging.getLogger(__name__)


class task5(APIView):
    '''
    Employee Timesheet & Project Billing
    '''    
    def get(self, request):
        try:
            conf_query="""
                        SET SESSION sql_mode = 'NO_ENGINE_SUBSTITUTION';
                        SET GLOBAL sql_mode = 'NO_ENGINE_SUBSTITUTION';
                        SELECT @@sql_mode;
                        """
            # Hit the query
            fetch_query(conf_query,logger)

            query = """
                with top_emp as(
                select 
                    ts.emp_id,
                    ts.project_id,
                    row_number() over (partition by ts.project_id order by ts.hours desc) as rn
                from timesheets as ts),
                emp_det as (
                select 
                        ts.project_id , 
                        sum(ts.hours) as tot_hrs, 
                        count(distinct ts.emp_id)  as tot_emp
                from timesheets as ts
                group by ts.project_id)
                select 
                        pro.id as projectId,
                        pro.name as projectName,
                        dep.name as departmentName,
                        emp_det.tot_emp as totalEmployees,
                        emp_det.tot_hrs as totalHours,
                        emp_det.tot_hrs*pro.billing_rate as billedAmount,
                        round(emp_det.tot_hrs/emp_det.tot_emp,1) as avgUtilization,
                        emp.name as topEmployee
                from projects as pro
                join departments as dep on dep.id=pro.dept_id and dep.is_active=1
                join top_emp on top_emp.project_id=pro.id and top_emp.rn=1
                join emp_det on emp_det.project_id=pro.id
                join employees as emp on top_emp.emp_id=emp.id
                group by pro.id,dep.name,emp_det.tot_emp,emp_det.tot_hrs ;
            """
            # Hit the query
            rows,columns=fetch_query(query,logger)
            # Convert to list of dictionaries
            results=columns_to_dict(rows,columns,logger)
            # return the Response 
            return JsonResponse({
                'success': True,
                'data': results,
                'count': len(results)
            })
            
        except Exception as e:
            logger.error(f"Error Occured: {str(e)}")
            return JsonResponse({
                'success': False,
                'error': f"{str(e)}"
            }, status=500)
