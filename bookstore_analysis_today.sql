SELECT index_name, table_name
FROM user_indexes
WHERE table_name IN (
    'BOOKS',
    'ORDERS',
    'ORDER_DETAILS',
    'CUSTOMERS'
)
ORDER BY table_name, index_name;

CREATE INDEX idx_books_author
ON Books(author_id);

CREATE INDEX idx_books_genre
ON Books(genre_id);

CREATE INDEX idx_orders_customer
ON Orders(customer_id);

CREATE INDEX idx_orderdetails_book
ON Order_Details(book_id);


SELECT index_name, table_name
FROM user_indexes
WHERE table_name IN (
    'BOOKS',
    'ORDERS',
    'ORDER_DETAILS',
    'CUSTOMERS'
)
ORDER BY table_name, index_name;


EXPLAIN PLAN FOR
SELECT
    b.book_id,
    b.title,
    a.name AS author_name,
    g.name AS genre_name,
    b.price
FROM Books b
JOIN Authors a
    ON b.author_id = a.author_id
JOIN Genres g
    ON b.genre_id = g.genre_id
WHERE b.author_id = 2;


SELECT PLAN_TABLE_OUTPUT
FROM TABLE(DBMS_XPLAN.DISPLAY);


EXPLAIN PLAN FOR
SELECT /*+ FULL(b) */
    b.book_id,
    b.title,
    a.name AS author_name,
    g.name AS genre_name,
    b.price
FROM Books b
JOIN Authors a
    ON b.author_id = a.author_id
JOIN Genres g
    ON b.genre_id = g.genre_id
WHERE b.author_id = 2;

SELECT PLAN_TABLE_OUTPUT
FROM TABLE(DBMS_XPLAN.DISPLAY);

SELECT view_name
FROM user_views
WHERE view_name IN (
    'VW_BOOKS_BY_AUTHOR',
    'VW_BOOK_SALES',
    'VW_CUSTOMER_ORDER_HISTORY'
)
ORDER BY view_name;


EXPLAIN PLAN FOR
SELECT /*+ FULL(b) */
    b.book_id,
    b.title,
    a.name AS author_name,
    g.name AS genre_name,
    b.price
FROM Books b
JOIN Authors a
    ON b.author_id = a.author_id
JOIN Genres g
    ON b.genre_id = g.genre_id
WHERE b.author_id = 2;

SELECT PLAN_TABLE_OUTPUT
FROM TABLE(DBMS_XPLAN.DISPLAY);



SELECT 'AUTHORS' AS table_name, COUNT(*) AS total FROM Authors
UNION ALL
SELECT 'GENRES', COUNT(*) FROM Genres
UNION ALL
SELECT 'CUSTOMERS', COUNT(*) FROM Customers
UNION ALL
SELECT 'BOOKS', COUNT(*) FROM Books
UNION ALL
SELECT 'ORDERS', COUNT(*) FROM Orders
UNION ALL
SELECT 'ORDER_DETAILS', COUNT(*) FROM Order_Details;

SELECT
    c.table_name,
    c.constraint_name,
    c.constraint_type,
    c.status
FROM user_constraints c
WHERE c.table_name IN (
    'AUTHORS',
    'GENRES',
    'CUSTOMERS',
    'BOOKS',
    'ORDERS',
    'ORDER_DETAILS'
)
AND c.constraint_type IN ('P', 'R')
ORDER BY c.table_name, c.constraint_type;



SELECT
    o.order_id,
    c.name AS customer_name,
    o.order_date,
    COUNT(od.book_id) AS different_books,
    SUM(od.quantity) AS total_units,
    SUM(od.quantity * b.price) AS calculated_total,
    o.total AS stored_total
FROM Orders o
JOIN Customers c
    ON o.customer_id = c.customer_id
JOIN Order_Details od
    ON o.order_id = od.order_id
JOIN Books b
    ON od.book_id = b.book_id
GROUP BY
    o.order_id,
    c.name,
    o.order_date,
    o.total
ORDER BY o.order_id;



SELECT
    b.book_id,
    b.title,
    SUM(od.quantity) AS units_sold,
    SUM(od.quantity * b.price) AS total_sales
FROM Books b
JOIN Order_Details od
    ON b.book_id = od.book_id
GROUP BY
    b.book_id,
    b.title
ORDER BY
    units_sold DESC,
    total_sales DESC;
    
    
SELECT
    c.customer_id,
    c.name AS customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(od.quantity) AS total_books_purchased,
    SUM(od.quantity * b.price) AS total_spent
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
JOIN Order_Details od
    ON o.order_id = od.order_id
JOIN Books b
    ON od.book_id = b.book_id
GROUP BY
    c.customer_id,
    c.name
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
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT o.customer_id) AS total_customers,
    SUM(od.quantity) AS total_units_sold,
    SUM(od.quantity * b.price) AS total_revenue,
    ROUND(AVG(o.total), 2) AS average_order_value
FROM Orders o
JOIN Order_Details od
    ON o.order_id = od.order_id
JOIN Books b
    ON od.book_id = b.book_id;