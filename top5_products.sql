SELECT 
    prd.product_name,
    prd.category,
    SUM(ord_it.quantity) as total_sold,
    SUM(ord_it.line_total) as total_revenue,
    ROUND(SUM(ord_it.line_total) / (SELECT SUM(total_amount) FROM orders WHERE status = 'completed') * 100, 2) as revenue_percentage
FROM order_items ord_it
JOIN products prd ON ord_it.product_id = prd.product_id
JOIN orders ord ON ord_it.order_id = ord.order_id
WHERE ord.status = 'completed'
GROUP BY prd.product_id, prd.product_name, prd.category
ORDER BY total_revenue DESC
LIMIT 5;
