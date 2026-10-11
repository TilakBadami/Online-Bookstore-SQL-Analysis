CREATE OR REPLACE VIEW vw_books_by_author AS
SELECT
    a.author_id,
    a.name AS author_name,
    b.book_id,
    b.title,
    b.price,
    b.publication_date
FROM Authors a
JOIN Books b
    ON a.author_id = b.author_id;
    
SELECT *
FROM vw_books_by_author
WHERE author_name = 'George Orwell';