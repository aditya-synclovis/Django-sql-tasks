'''
Views for the task 1
'''

from django.http import JsonResponse
from django.views.decorators.http import require_http_methods
import logging
from utils.fetch_query_sql import fetch_query
from utils.list_to_dict import columns_to_dict
from task1.orm_query import sales_report
logger = logging.getLogger(__name__)

@require_http_methods(["GET"])
def task1(request):
    """
    Task 1 :- E-Commerce Order Analysis
    """
    try:
        conf_query="""
                        SET SESSION sql_mode = 'NO_ENGINE_SUBSTITUTION';
                        SET GLOBAL sql_mode = 'NO_ENGINE_SUBSTITUTION';
                        SELECT @@sql_mode;
                        """
        # Hit the query
        fetch_query(conf_query,logger)
        query = """
            select p.category AS category,
                DATE_FORMAT(o.order_date, '%Y-%m') AS month,
                count(p.category) AS totalOrders,
                count(distinct o.customer_id ) as uniqueCustomers,
                Sum(o_i.quantity) as totalQuantity,
                Sum(p.price*o_i.quantity) as totalRevenue,
                round(Sum(p.price*o_i.quantity)/count(p.category),2) as avgOrderValue
            from order_items as o_i
            join products as p on p.id=o_i.product_id and p.is_active=1
            join orders as o on o.id=o_i.order_id and p.is_active=1
            group by p.category, YEAR(o.order_date), MONTH(o.order_date) ;

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

@require_http_methods(["GET"])
def task1_orm(request):
    results = list(sales_report)
    return JsonResponse(results, safe=False)