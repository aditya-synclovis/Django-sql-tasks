from django.db.models import Count, Sum, F, FloatField, ExpressionWrapper
from django.db.models.functions import TruncMonth, Round, Extract, Concat
from django.db.models import Value, CharField

from task1.models import OrderItem

# Alternative query using TruncMonth
sales_report = (
    OrderItem.objects
    .filter(
        order__is_active=True,
        product__is_active=True
    )
    .annotate(
        month_truncated=TruncMonth('order__order_date')
    )
    .annotate(
        category=F('product__category'),
        month=Concat(
            Extract('month_truncated', 'year'),
            Value('-'),
            Extract('month_truncated', 'month'),
            output_field=CharField()
        )
    )
    .values('category', 'month')
    .annotate(
        totalOrders=Count('id'),
        uniqueCustomers=Count('order__customer', distinct=True),
        totalQuantity=Sum('quantity'),
        totalRevenue=Sum(
            F('product__price') * F('quantity')
        )
    )
    .annotate(
        avgOrderValue=Round(
            F('totalRevenue') / F('totalOrders'), 2
        )
    )
    .order_by('category', 'month')
)
