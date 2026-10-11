# Online Bookstore SQL Analysis

## Project Overview
The Online Bookstore SQL Analysis project uses Oracle SQL to analyze bookstore sales, customer purchasing behavior, order details, and revenue. It demonstrates practical SQL skills, including joins, aggregate functions, views, indexing, query execution plans, and data validation.

## Objectives
- Analyze customer orders and purchasing patterns.
- Identify best-selling books and calculate sales revenue.
- Analyze monthly sales performance.
- Calculate customer spending and order summaries.
- Validate stored order totals against calculated totals.
- Explore database indexing and query execution plans.

## Tools and Technologies
- **Database:** Oracle Database
- **SQL Environment:** Oracle SQL Developer
- **Query Language:** SQL

## Database Schema
The project contains six tables:

| Table Name | Description |
|---|---|
| AUTHORS | Stores author information |
| BOOKS | Stores book details, prices, and author and genre references |
| GENRES | Stores book genre information |
| CUSTOMERS | Stores customer details |
| ORDERS | Stores order dates, customer references, and order totals |
| ORDER_DETAILS | Stores books and quantities associated with each order |

## Project Modules

### 1. Table Creation and Database Setup
Creates the bookstore tables and establishes relationships using primary keys and foreign keys.

### 2. SQL Queries and Joins
Uses INNER JOIN and LEFT JOIN to combine customer, order, and book information.

### 3. Sales and Customer Analysis
Uses aggregate functions such as `COUNT()`, `SUM()`, and `AVG()` with `GROUP BY` and `ORDER BY` to analyze sales and customer spending.

### 4. Data Validation
Compares stored order totals with calculated totals derived from order details to verify data consistency.

### 5. Indexing and Query Performance
Explores database indexes and uses `EXPLAIN PLAN` and `DBMS_XPLAN` to examine query execution strategies.

### 6. Views
Creates reusable views for book sales, books by author, and customer order history.

## Analysis Screenshots

### Order Details Analysis
Displays order IDs, order dates, customer names, email addresses, book titles, quantities, prices, line totals, and order totals.

![Order Details Analysis](screenshots/order_details_analysis.png)

### Customer Spending Analysis
Summarizes the number of orders, total book units purchased, and total spending for each customer.

![Customer Spending Analysis](screenshots/customer_spending_analysis.png)

### Monthly Sales Analysis
Displays monthly order counts, units sold, and total sales revenue.

![Monthly Sales Analysis](screenshots/monthly_sales_analysis.png)

## Key Findings
Based on the current sample dataset:

- **Total Orders:** 6
- **Total Customers with Orders:** 5
- **Total Units Sold:** 13
- **Total Sales Revenue:** 4,896
- **Highest-Spending Customer:** Rahul Sharma, with spending of 1,698
- **Most-Sold Books:** Several books are tied at 2 units sold each.

*These results represent the current sample data and are not real-world business statistics.*

## SQL Concepts Demonstrated
- DDL and DML
- Primary keys and foreign keys
- INNER JOIN and LEFT JOIN
- Aggregate functions
- GROUP BY and HAVING
- ORDER BY
- Subqueries and calculated columns



