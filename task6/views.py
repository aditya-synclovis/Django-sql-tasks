'''
Veiws for handling XML file uploads in a Django REST Framework application.
'''
from rest_framework.views import APIView
from django.http import JsonResponse
import logging
from utils.fetch_query_sql import fetch_query
from utils.list_to_dict import columns_to_dict
logger = logging.getLogger(__name__)


class task6(APIView):
    '''
    Inventory & Supplier Performance Analysis
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
                with MonthlyData as (
                        select
                            s.id as supplierId,
                            s.name as supplierName,
                            date_format(pur.purchase_date, '%Y-%m') as month,
                            pro.id as productId,
                            pro.name as productName,
                            sum(pur.quantity) as totalPurchased,
                            sum(pur.cost) as totalCost,
                            sum(sa.quantity) as totalSold,
                            sum(sa.revenue) as totalRevenue
                        from suppliers as s
                        join products as pro on pro.supplier_id = s.id and pro.is_active = 1
                        left join purchases as pur on pur.product_id = pro.id and pur.is_active = 1
                        left join sales sa on sa.product_id = pro.id and sa.is_active = 1
                            and date_format(sa.sale_date, '%Y-%m') = date_format(pur.purchase_date, '%Y-%m')
                        where s.is_active = 1
                        group by s.id, s.name, month, pro.id, pro.name
                ),
                MonthlySummary as (
                    select
                        supplierId,
                        supplierName,
                        month,
                        count(distinct productId) AS productCount,
                        sum(totalPurchased) AS totalPurchased,
                        sum(totalCost) AS totalCost,
                        sum(totalSold) AS totalSold,
                        sum(totalRevenue) AS totalRevenue
                    from MonthlyData
                    group by supplierId, supplierName, month
                ),
                BestPro AS (
                    SELECT
                        supplierId,
                        month,
                        productName AS bestProduct,
                        row_number() over (partition by supplierId, month order by totalSold DESC) as rn
                    from MonthlyData
                )
                select
                    ms.supplierId,
                    ms.supplierName,
                    ms.month,
                    ms.productCount,
                    ms.totalPurchased,
                    ms.totalCost,
                    ms.totalSold,
                    ms.totalRevenue,
                    (ms.totalRevenue - ms.totalCost) AS profit,
                    bp.bestProduct
                from MonthlySummary ms
                join BestPro bp on ms.supplierId = bp.supplierId and ms.month = bp.month and bp.rn = 1
                order by ms.supplierId, ms.month;

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
