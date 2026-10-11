CREATE OR REPLACE VIEW vw_book_sales AS
SELECT
    b.book_id,
    b.title,
    NVL(SUM(od.quantity), 0) AS units_sold,
    NVL(SUM(od.quantity * b.price), 0) AS total_sales
FROM Books b
LEFT JOIN Order_Details od
    ON b.book_id = od.book_id
GROUP BY b.book_id, b.title;

SELECT *
FROM vw_book_sales
ORDER BY total_sales DESC;