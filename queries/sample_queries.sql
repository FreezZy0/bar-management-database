-- List ingredients that have never been used, ordered by stock
SELECT DISTINCT(i.name) AS ingredient_name, get_ingredient_stock(i.id) AS stock
FROM ingredients i
WHERE NOT EXISTS (
   SELECT 1
   FROM order_item_products oip
   JOIN ingredient_products ip ON oip.product_id = ip.product_id
   WHERE ip.ingredient_id = i.id
)
ORDER BY stock DESC;

-- Find the most popular product in each category
SELECT categories.name AS category, p.name AS product, MAX(total_ordered) AS times_ordered
FROM products p
JOIN (
	SELECT oip.product_id AS pId, SUM(oip.quantity) AS total_ordered
	FROM order_item_products oip
	GROUP BY oip.product_id
) AS sum_by_product
ON p.id = sum_by_product.pId
JOIN categories ON p.category_id = categories.id
GROUP BY p.category_id;

-- List the 5 orders with the highest amount among those below the average order amount
SELECT *, get_order_total_amount(id) AS total
FROM orders
WHERE get_order_total_amount(orders.id) < (
	SELECT AVG(get_order_total_amount(o1.id))
	FROM orders o1
)
ORDER BY total DESC
LIMIT 5;

-- Calculate total earnings for each month of 2024 where earnings were at least 15000€
SELECT MONTHNAME(o.order_date) AS month, SUM(get_order_total_amount(o.id)) AS earnings
FROM orders o
WHERE YEAR(o.order_date) = 2024
GROUP BY month
HAVING earnings >= 15000
ORDER BY o.order_date;
