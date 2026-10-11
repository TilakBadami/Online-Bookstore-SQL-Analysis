# Online Bookstore Management and Sales Analysis using Oracle SQL

## Project Overview

This project uses Oracle SQL to manage bookstore data and analyze book sales, customer purchases, and order transactions. It demonstrates relational database design, SQL querying, reporting, and data validation.

## Objectives

- Organize bookstore information using relational tables.
- Establish relationships using primary and foreign keys.
- Retrieve related information using SQL JOINs.
- Analyze book-wise sales and customer purchasing behavior.
- Generate monthly sales and revenue reports.
- Validate order totals and check data integrity.

## Database Tables

The project contains six tables:

- **AUTHORS** – Author information.
- **GENRES** – Book genre information.
- **BOOKS** – Book titles, prices, and related details.
- **CUSTOMERS** – Customer information.
- **ORDERS** – Customer order records.
- **ORDER_DETAILS** – Books and quantities included in each order.

## SQL Concepts Used

- SELECT, WHERE, ORDER BY
- INNER JOIN and LEFT JOIN
- GROUP BY and aggregate functions
- Subqueries
- Views
- Primary keys and foreign keys
- Indexes and execution plans
- Data validation queries

## Key Results

The sample dataset produced the following results:

| Metric | Result |
|---|---:|
| Total books | 7 |
| Total customers | 5 |
| Total orders | 6 |
| Units sold | 13 |
| Total sales revenue | 4,896 |
| Average order value | 816 |

The validation queries confirmed that stored order totals matched calculated totals and that no orphaned order-detail records were found in the tested dataset.

## Tools Used

- Oracle SQL Developer
- Oracle Database
- SQL

## How to Run

1. Open Oracle SQL Developer and connect to the database.
2. Execute the table creation scripts.
3. Execute the sample data insertion scripts.
4. Run the scripts for views, indexes, reports, and validation.
5. Review the query results in SQL Developer.

Run the scripts in the correct dependency order and ensure that the database connection and required objects are available.

## Author

Tilak S Badami

Electronics and Communication Engineering graduate | Aspiring Data Analyst

GitHub: https://github.com/TilakBadami
