SELECT 
    prd.category,
    COUNT(DISTINCT ord.order_id) as orders_count,
    SUM(ord_it.quantity) as items_sold,
    SUM(ord_it.line_total) as category_revenue,
    ROUND(SUM(ord_it.line_total) / (SELECT SUM(total_amount) FROM orders WHERE status = 'completed') * 100, 2) as category_share
FROM order_items ord_it
JOIN products prd ON ord_it.product_id = prd.product_id
JOIN orders ord ON ord_it.order_id = ord.order_id
WHERE ord.status = 'completed'
GROUP BY prd.category
ORDER BY category_revenue DESC;
