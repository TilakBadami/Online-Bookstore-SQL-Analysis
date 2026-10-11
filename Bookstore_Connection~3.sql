CREATE OR REPLACE VIEW vw_customer_order_history AS
SELECT
    c.customer_id,
    c.name AS customer_name,
    c.email,
    o.order_id,
    o.order_date,
    o.total
FROM Customers c
LEFT JOIN Orders o
    ON c.customer_id = o.customer_id;
    
SELECT *
FROM vw_customer_order_history
ORDER BY customer_id, order_date;