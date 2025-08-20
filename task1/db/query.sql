-- SELECT  
-- 		YEAR(order_date) AS Year,
-- 		MONTH(order_date) AS Month,
--        COUNT(*) AS Count
-- FROM orders
-- GROUP BY YEAR(order_date), MONTH(order_date);

-- month → Month of the order (YYYY-MM)
-- category → Product category
-- totalOrders → Number of distinct orders in that category for the month
-- uniqueCustomers → Count of distinct customers who placed orders in that category for the month
-- totalQuantity → Total quantity of products sold
-- totalRevenue → SUM(quantity × price)
-- avgOrderValue → totalRevenue ÷ totalOrders

-- select * from products;
-- select * from order_items as o_i
-- join products as p on p.id=o_i.product_id and p.is_active=1
-- join orders as o on o.id=o_i.order_id and p.is_active=1 ;

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


