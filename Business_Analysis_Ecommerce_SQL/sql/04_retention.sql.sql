-- ======================================
-- RETENTION ANALYSIS
-- ======================================


-- ========================================================
-- 1. How many unique customers made at least one purchase?
-- ========================================================


SELECT 
    COUNT(DISTINCT customer_id) AS unique_customers_with_purchase
FROM orders
WHERE order_status != 'canceled';



-- =======================================================
-- 2. What percentage of customers make only one purchase?
-- =======================================================

WITH unique_customers AS (
	SELECT 
		c.customer_unique_id, 
		COUNT(o.order_id) total_orders
	FROM customers c
	JOIN orders o
		ON c.customer_id = o.customer_id
	WHERE o.order_status != 'canceled'
	GROUP BY c.customer_unique_id
)

SELECT 
	COUNT(*) AS total_customers,
	SUM(CASE WHEN total_orders = 1 THEN 1 ELSE 0 END) AS one_time_customers,
ROUND(
	SUM(CASE WHEN total_orders = 1 THEN 1 ELSE 0 END)::numeric / COUNT(*) * 100
	, 2) one_time_customer_percentage
FROM unique_customers




-- ========================================================
-- 3. What percentage of customers are recurring customers?
-- ========================================================



WITH unique_customers AS (
	SELECT 
		c.customer_unique_id, 
		COUNT(o.order_id) total_orders
	FROM customers c
	JOIN orders o
		ON c.customer_id = o.customer_id
	WHERE o.order_status != 'canceled'
	GROUP BY c.customer_unique_id
)

SELECT 
	COUNT(*) AS total_customers,
	SUM(CASE WHEN total_orders > 1 THEN 1 ELSE 0 END) AS recurring_customers,
ROUND(
	SUM(CASE WHEN total_orders > 1 THEN 1 ELSE 0 END)::numeric / COUNT(*) * 100
	, 2) recurring_customers_percentage
FROM unique_customers



-- ==============================================================
-- 4. What is the average time between first and second purchase?
-- ==============================================================

WITH unique_customers AS (
	SELECT 
		c.customer_unique_id ,
		date_trunc('day', o.order_purchase_timestamp) order_date,
		ROW_NUMBER() OVER ( PARTITION BY c.customer_unique_id ORDER BY o.order_purchase_timestamp ASC) AS purchase_number
	FROM customers c
	JOIN orders o
		ON c.customer_id = o.customer_id
	WHERE o.order_status != 'canceled'
),
customers_orders AS (
SELECT 
	customer_unique_id, 
	MAX(CASE 
		WHEN purchase_number = 1 THEN order_date
	END) AS first_order,
	MAX(CASE
		WHEN purchase_number = 2 THEN order_date
	END) AS second_order
FROM unique_customers
GROUP BY customer_unique_id
)
	
SELECT 
	AVG(second_order - first_order)
FROM customers_orders

WHERE second_order IS NOT NULL















