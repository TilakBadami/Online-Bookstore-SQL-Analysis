SELECT
    b.book_id,
    b.title,
    SUM(od.quantity) AS units_sold
FROM Books b
JOIN Order_Details od
    ON b.book_id = od.book_id
GROUP BY b.book_id, b.title
ORDER BY units_sold DESC, b.title
FETCH FIRST 5 ROWS ONLY;