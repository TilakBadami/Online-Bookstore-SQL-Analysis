SELECT
    o.order_id,
    o.order_date,
    c.name AS customer_name,
    c.email,
    b.title AS book_title,
    od.quantity,
    b.price,
    od.quantity * b.price AS line_total,
    o.total AS order_total
FROM Orders o
JOIN Customers c
    ON o.customer_id = c.customer_id
JOIN Order_Details od
    ON o.order_id = od.order_id
JOIN Books b
    ON od.book_id = b.book_id
ORDER BY o.order_id, b.title;