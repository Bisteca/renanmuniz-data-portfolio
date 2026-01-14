-- ======================================
-- GROWTH ANALYSIS
-- ======================================


-- =============================================
-- 1. How has monthly revenue evolved over time?
-- =============================================

SELECT 
    date_trunc('month', o.order_purchase_timestamp) order_month, 
    SUM(op.payment_value) monthly_revenue
FROM order_payments op

JOIN orders o
ON op.order_id = o.order_id

WHERE o.order_status != 'canceled'
GROUP BY order_month
ORDER BY order_month DESC

-- =====================================================
-- 2. What is the month-over-month (MoM) revenue growth?
-- =====================================================

WITH receita_mensal AS ( 
SELECT
date_trunc('month', o.order_purchase_timestamp) order_month,
SUM(p.payment_value) monthly_revenue
FROM order_payments p

JOIN orders o
ON o.order_id = p.order_id

WHERE o.order_status != 'canceled'

GROUP BY order_month
ORDER BY order_month DESC
)
SELECT 
order_month, 
monthly_revenue,
(monthly_revenue - LAG(monthly_revenue) OVER (ORDER BY order_month)) / LAG(monthly_revenue) OVER (ORDER BY order_month) AS mom_growth_rate

FROM receita_mensal



-- =========================================================
-- 3. How does current revenue compare year-over-year (YoY)?
-- =========================================================

WITH receita_mensal AS ( 
SELECT
date_trunc('month', o.order_purchase_timestamp) order_month,
SUM(p.payment_value) monthly_revenue
FROM order_payments p

JOIN orders o
ON o.order_id = p.order_id

WHERE o.order_status != 'canceled'

GROUP BY order_month
ORDER BY order_month DESC
)

SELECT 
order_month, 
monthly_revenue,
(monthly_revenue - LAG(monthly_revenue, 12) OVER (ORDER BY order_month)) / LAG(monthly_revenue, 12) OVER (ORDER BY order_month) AS yoy_growth_rate

FROM receita_mensal

ORDER BY order_month DESC



-- ===========================================================
-- 4. How many unique customers purchase per month on average?
-- ===========================================================

WITH monthly_customers AS (

SELECT 
date_trunc('month', o.order_purchase_timestamp) months_purchase_order,
COUNT(DISTINCT c.customer_unique_id) customers

FROM public.customers c

JOIN orders o
ON o.customer_id = c.customer_id

WHERE o.order_status != 'canceled'

GROUP BY months_purchase_order 
ORDER BY months_purchase_order DESC
)

SELECT AVG(customers) average_customers_per_month

FROM monthly_customers











