SELECT 
    YEAR(order_date) as year,
    MONTH(order_date) as month,
    COUNT(*) as order_count,
    SUM(total_amount) as month_revenue,
    AVG(total_amount) as average_order
FROM orders 
WHERE status = 'completed'
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;
