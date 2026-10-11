SELECT
    b.book_id,
    b.title,
    a.name AS author_name,
    g.name AS genre_name,
    b.price,
    b.publication_date
FROM Books b
JOIN Authors a
    ON b.author_id = a.author_id
JOIN Genres g
    ON b.genre_id = g.genre_id
ORDER BY b.title;