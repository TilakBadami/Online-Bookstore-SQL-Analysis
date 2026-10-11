CREATE TABLE Authors (
    author_id NUMBER PRIMARY KEY,
    name      VARCHAR2(100) NOT NULL,
    bio       VARCHAR2(500)
);
CREATE TABLE Genres (
genre_id NUMBER PRIMARY KEY,
name VARCHAR2(50) NOT NULL UNIQUE
);

CREATE TABLE Customers (
customer_id NUMBER PRIMARY KEY,
name VARCHAR2(100) NOT NULL,
email VARCHAR2(100) UNIQUE,
phone VARCHAR2(15)
);
CREATE TABLE Books (
book_id NUMBER PRIMARY KEY,
title VARCHAR2(200) NOT NULL,
author_id NUMBER NOT NULL,
price NUMBER(10,2) CHECK (price >= 0),
publication_date DATE,
genre_id NUMBER NOT NULL,
CONSTRAINT fk_books_author
FOREIGN KEY (author_id)
REFERENCES Authors(author_id),
CONSTRAINT fk_books_genre
FOREIGN KEY (genre_id)
REFERENCES Genres(genre_id)
);

CREATE TABLE Orders (
order_id NUMBER PRIMARY KEY,
customer_id NUMBER NOT NULL,
order_date DATE DEFAULT SYSDATE,
total NUMBER(10,2) CHECK (total >= 0),
CONSTRAINT fk_orders_customer
FOREIGN KEY (customer_id)
REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Details (
order_id NUMBER,
book_id NUMBER,
quantity NUMBER NOT NULL CHECK (quantity > 0),
CONSTRAINT pk_order_details
PRIMARY KEY (order_id, book_id),
CONSTRAINT fk_details_order
FOREIGN KEY (order_id)
REFERENCES Orders(order_id),
CONSTRAINT fk_details_book
FOREIGN KEY (book_id)
REFERENCES Books(book_id)
);

SELECT table_name
FROM user_tables
WHERE table_name IN (
    'AUTHORS',
    'GENRES',
    'CUSTOMERS',
    'BOOKS',
    'ORDERS',
    'ORDER_DETAILS'
)
ORDER BY table_name;

INSERT INTO Authors VALUES
(1, 'J.K. Rowling', 'British fantasy author');

INSERT INTO Authors VALUES
(2, 'George Orwell', 'Author of dystopian fiction');

INSERT INTO Authors VALUES
(3, 'Paulo Coelho', 'Brazilian novelist');

INSERT INTO Authors VALUES
(4, 'R.K. Narayan', 'Indian literary author');

INSERT INTO Authors VALUES
(5, 'Stephen Hawking', 'Theoretical physicist and author');

COMMIT;

INSERT INTO Genres VALUES (1, 'Fantasy');
INSERT INTO Genres VALUES (2, 'Dystopian Fiction');
INSERT INTO Genres VALUES (3, 'Philosophical Fiction');
INSERT INTO Genres VALUES (4, 'Literary Fiction');
INSERT INTO Genres VALUES (5, 'Science');

COMMIT;
INSERT INTO Customers VALUES
(1, 'Rahul Sharma', 'rahul@gmail.com', '9876500001');

INSERT INTO Customers VALUES
(2, 'Priya Rao', 'priya@gmail.com', '9876500002');

INSERT INTO Customers VALUES
(3, 'Amit Kumar', 'amit@gmail.com', '9876500003');

INSERT INTO Customers VALUES
(4, 'Sneha Patel', 'sneha@gmail.com', '9876500004');

INSERT INTO Customers VALUES
(5, 'Arjun Reddy', 'arjun@gmail.com', '9876500005');

COMMIT;

INSERT INTO Books VALUES
(101, 'Harry Potter and the Philosopher''s Stone',
 1, 499, DATE '1997-06-26', 1);

INSERT INTO Books VALUES
(102, '1984', 2, 299, DATE '1949-06-08', 2);

INSERT INTO Books VALUES
(103, 'The Alchemist', 3, 350, DATE '1988-01-01', 3);

INSERT INTO Books VALUES
(104, 'Malgudi Days', 4, 275, DATE '1943-01-01', 4);

INSERT INTO Books VALUES
(105, 'A Brief History of Time',
 5, 450, DATE '1988-04-01', 5);

INSERT INTO Books VALUES
(106, 'Animal Farm', 2, 250, DATE '1945-08-17', 2);

INSERT INTO Books VALUES
(107, 'Harry Potter and the Chamber of Secrets',
 1, 550, DATE '1998-07-02', 1);

COMMIT;

INSERT INTO Orders VALUES
(1001, 1, DATE '2026-09-01', 0);

INSERT INTO Orders VALUES
(1002, 2, DATE '2026-09-02', 0);

INSERT INTO Orders VALUES
(1003, 3, DATE '2026-09-03', 0);

INSERT INTO Orders VALUES
(1004, 4, DATE '2026-09-04', 0);

INSERT INTO Orders VALUES
(1005, 5, DATE '2026-09-05', 0);

INSERT INTO Orders VALUES
(1006, 1, DATE '2026-09-06', 0);

COMMIT;

INSERT INTO Order_Details VALUES (1001, 101, 1);
INSERT INTO Order_Details VALUES (1001, 102, 1);

INSERT INTO Order_Details VALUES (1002, 103, 1);
INSERT INTO Order_Details VALUES (1002, 104, 1);

INSERT INTO Order_Details VALUES (1003, 105, 1);
INSERT INTO Order_Details VALUES (1003, 101, 1);
INSERT INTO Order_Details VALUES (1003, 106, 1);

INSERT INTO Order_Details VALUES (1004, 107, 1);

INSERT INTO Order_Details VALUES (1005, 102, 1);
INSERT INTO Order_Details VALUES (1005, 104, 1);
INSERT INTO Order_Details VALUES (1005, 106, 1);

INSERT INTO Order_Details VALUES (1006, 107, 1);
INSERT INTO Order_Details VALUES (1006, 103, 1);

COMMIT;

SELECT 'AUTHORS' AS table_name, COUNT(*) AS total
FROM Authors
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