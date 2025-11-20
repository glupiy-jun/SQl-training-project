SELECT 
    COUNT(DISTINCT order_id) as total_order,
    COUNT(DISTINCT customer_id) as unique_customer,
    SUM(total_amount) as total_revenue,
    AVG(total_amount) as averege_order,
    MAX(total_amount) as max_order
FROM orders 
WHERE status = 'completed';
