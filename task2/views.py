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
def task2_view(request):
    """
    Task 1 :- E-Commerce Order Analysis
    """
    try:
        query = """
            with stu_att as(
                select  stu.id AS student_id,
                        stu.class_id,
                        (count(case when att.status='P' then 1 End) * 100)/count(*) as att_per
                from students as stu
                join attendance as att on stu.id=att.student_id and att.is_active=1 
                where stu.is_active=1
                group by stu.id , stu.class_id
            ), 
            PaymentStatus as (
                select
                    stu.id as student_id,
                    ft.id as fee_type_id,
                    case when sum(fc.amount_paid) > 0 then true else false end as paid
                from students stu
                join fee_types ft
                left join fee_collections fc on stu.id = fc.student_id and ft.id = fc.fee_type_id and fc.is_active = TRUE
                where stu.is_active = true
                group by stu.id, ft.id

            )
            select
                cls.id as classId,
                cls.name as className,
                ft.name as feeType,
                COUNT(DISTINCT CASE WHEN sa.att_per > 75 AND fs.paid = FALSE THEN sa.student_id END) as highAttendanceUnpaid,
                COUNT(DISTINCT CASE WHEN sa.att_per < 50 AND fs.paid = TRUE THEN sa.student_id END) as lowAttendancePaid
            FROM classes as cls
            JOIN students as stu ON cls.id = stu.class_id AND stu.is_active = TRUE
            JOIN fee_types as ft ON ft.is_active = TRUE
            LEFT JOIN stu_att sa ON sa.student_id = stu.id
            LEFT JOIN PaymentStatus fs ON fs.student_id = stu.id AND fs.fee_type_id = ft.id
            WHERE cls.is_active = TRUE
            GROUP BY cls.id, cls.name, ft.name
            ORDER BY cls.id, ft.name;

        """
        # Hit the query
        rows, columns = fetch_query(query, logger)
        # Convert to list of dictionaries
        results = columns_to_dict(rows, columns, logger)
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
