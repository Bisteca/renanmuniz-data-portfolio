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




-- =========================================================
-- 3. How does current revenue compare year-over-year (YoY)?
-- =========================================================




-- ===========================================================
-- 4. How many unique customers purchase per month on average?
-- ===========================================================











