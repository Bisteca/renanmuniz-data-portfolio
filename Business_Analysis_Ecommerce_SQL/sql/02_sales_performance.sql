-- ======================================
-- SALES PERFORMANCE ANALYSIS
-- ======================================


-- =======================================
-- 1. What is the total revenue generated?
-- =======================================

WITH valid_payment AS (
    SELECT 
        p.payment_value
    FROM order_payments p
    JOIN orders o 
        ON p.order_id = o.order_id
    WHERE o.order_status != 'canceled'
)
SELECT
    SUM(payment_value) AS total_revenue
FROM valid_payment


-- ===================================
-- 2. What is the average order value?
-- ===================================

WITH valid_payment AS (
    SELECT 
        SUM(p.payment_value) AS total_revenue
    FROM order_payments p
    JOIN orders o 
        ON p.order_id = o.order_id
    WHERE o.order_status != 'canceled'
),
total_orders AS (
	SELECT 
		COUNT(DISTINCT p.order_id) as  total_valid_orders
	FROM order_payments p
    JOIN orders o 
        ON p.order_id = o.order_id
    WHERE o.order_status != 'canceled'
)

SELECT
	ROUND((total_revenue::numeric / total_valid_orders),2) as aov
FROM valid_payment
CROSS JOIN total_orders

-- ========================================
-- 3. How many orders were placed in total?
-- ========================================


SELECT COUNT(order_id) as total_orders 
FROM orders



-- ===============================================
-- 4. Which products generate the highest revenue?
-- ===============================================


SELECT 
	p.product_id, p.product_category_name,
	SUM(i.price) total_revenue
FROM products p

JOIN order_items i
	ON p.product_id = i.product_id
JOIN orders o
	ON i.order_id = o.order_id

WHERE o.order_status != 'canceled'
GROUP BY p.product_id, p.product_category_name
ORDER BY total_revenue DESC


-- ======================================================
-- 5. Which product categories generate the most revenue?
-- ======================================================

SELECT 
	product_category_name, 
	SUM(i.price) total_revenue
FROM products p

JOIN order_items i
	ON p.product_id = i.product_id
JOIN orders o
	ON i.order_id = o.order_id

WHERE o.order_status != 'canceled'
GROUP BY product_category_name
ORDER BY total_revenue DESC





