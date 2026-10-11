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


SELECT
    o.order_id,
    c.name AS customer_name,
    NVL(o.total, 0) AS stored_total,
    NVL(SUM(od.quantity * b.price), 0) AS calculated_total,
    CASE
        WHEN NVL(o.total, 0) =
             NVL(SUM(od.quantity * b.price), 0)
        THEN 'MATCH'
        ELSE 'CHECK'
    END AS validation_status
FROM Orders o
JOIN Customers c
    ON o.customer_id = c.customer_id
LEFT JOIN Order_Details od
    ON o.order_id = od.order_id
LEFT JOIN Books b
    ON od.book_id = b.book_id
GROUP BY
    o.order_id,
    c.name,
    o.total
ORDER BY o.order_id;


SELECT
    COUNT(*) AS total_orders,
    SUM(total) AS total_revenue,
    ROUND(AVG(total), 2) AS average_order_value
FROM Orders;



SELECT
    b.book_id,
    b.title,
    NVL(SUM(od.quantity), 0) AS units_sold,
    NVL(SUM(od.quantity * b.price), 0) AS total_sales
FROM Books b
LEFT JOIN Order_Details od
    ON b.book_id = od.book_id
GROUP BY b.book_id, b.title
ORDER BY b.book_id;


SELECT
    c.customer_id,
    c.name AS customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(od.quantity) AS total_units_purchased,
    SUM(od.quantity * b.price) AS total_spent
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
JOIN Order_Details od
    ON o.order_id = od.order_id
JOIN Books b
    ON od.book_id = b.book_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC;



SELECT
    TO_CHAR(o.order_date, 'YYYY-MM') AS sales_month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(od.quantity) AS units_sold,
    SUM(od.quantity * b.price) AS total_sales
FROM Orders o
JOIN Order_Details od
    ON o.order_id = od.order_id
JOIN Books b
    ON od.book_id = b.book_id
GROUP BY TO_CHAR(o.order_date, 'YYYY-MM')
ORDER BY sales_month;



SELECT
    od.order_id,
    od.book_id,
    od.quantity
FROM Order_Details od
LEFT JOIN Orders o
    ON od.order_id = o.order_id
LEFT JOIN Books b
    ON od.book_id = b.book_id
WHERE o.order_id IS NULL
   OR b.book_id IS NULL;
