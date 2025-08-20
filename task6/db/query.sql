
with MonthlyData as (select
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
)
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
    GROUP BY supplierId, supplierName, month;

select * from purchases;

-- supplierId → ID of the supplier
-- supplierName → Name of the supplier
-- month → YYYY-MM
-- productCount → Number of distinct products supplied
-- totalPurchased → Total purchased quantity
-- totalCost → Total purchase cost
-- totalSold → Total sales quantity
-- totalRevenue → Total sales revenue
-- profit → totalRevenue – totalCost
-- bestProduct → Product with maximum sales quantity

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
