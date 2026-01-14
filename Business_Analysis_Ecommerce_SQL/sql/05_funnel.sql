-- ======================================
-- FUNNEL ANALYSIS
-- ======================================


-- ================================
-- 1. How many orders were created?
-- ================================


SELECT 
COUNT(order_id) orders_created 
FROM orders


-- ==========================================
-- 2. How many orders were successfully paid?
-- ==========================================


SELECT 
COUNT(DISTINCT o.order_id)
FROM orders o
JOIN order_payments p
ON o.order_id = p.order_id
WHERE o.order_status != 'canceled'


-- ==============================================================
-- 3. What is the conversion rate from order creation to payment?
-- ==============================================================

WITH orders_paid AS (
SELECT 
COUNT(DISTINCT o.order_id) paid
FROM orders o
JOIN order_payments p
ON o.order_id = p.order_id
WHERE o.order_status != 'canceled'
),
orders_created AS (
SELECT
COUNT(DISTINCT order_id) created
FROM orders

)

SELECT 
ROUND((paid::numeric / created) * 100, 2) AS conversion_rate_creation_to_payment
FROM orders_created
CROSS JOIN orders_paid

















