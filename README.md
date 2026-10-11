# Online Bookstore SQL Analysis

## Project Overview

The **Online Bookstore SQL Analysis** project uses Oracle SQL to analyze bookstore operations, customer purchasing behavior, order details, and sales performance. The project demonstrates SQL querying, data aggregation, table relationships, indexing, query validation, and business reporting.

The database contains six tables: `AUTHORS`, `GENRES`, `BOOKS`, `CUSTOMERS`, `ORDERS`, and `ORDER_DETAILS`.

## Objectives

- Analyze customer orders and purchasing patterns.
- Calculate total revenue, units sold, and average order value.
- Identify top-selling books and high-value customers.
- Generate monthly sales summaries.
- Validate stored order totals against calculated totals.
- Explore indexes, constraints, and query execution plans.

## Tools and Technologies

- **Database:** Oracle Database
- **SQL Environment:** Oracle SQL Developer
- **Query Language:** SQL
- **Concepts:** Joins, aggregate functions, subqueries, `GROUP BY`, `ORDER BY`, views, indexes, constraints, and data validation.

## Database Structure

| Table | Description |
|---|---|
| AUTHORS | Stores author information |
| GENRES | Stores book genre information |
| BOOKS | Stores book details and prices |
| CUSTOMERS | Stores customer details |
| ORDERS | Stores order dates, customer references, and stored order totals |
| ORDER_DETAILS | Stores books and quantities associated with each order |

## SQL Analysis Performed

### 1. Order Details Analysis

Combines orders, customers, order details, and books to display order IDs, dates, customer names, email addresses, book titles, quantities, prices, line totals, and stored order totals.

### 2. Customer Spending Analysis

Calculates the number of orders, total book units purchased, and total spending for each customer. Results are sorted by spending to identify high-value customers.

### 3. Monthly Sales Analysis

Groups sales by month and calculates the total number of orders, units sold, and sales revenue.

### 4. Top-Selling Books Analysis

Calculates units sold and total sales for each book to identify the best-performing titles.

### 5. Revenue and Business Metrics

Uses aggregate functions such as `COUNT()`, `SUM()`, and `AVG()` to calculate order counts, revenue, and average order value.

### 6. Data Validation

Compares the stored order total with the calculated total from book prices and quantities. A validation status identifies whether the values match.

### 7. Indexing and Query Execution Plans

Examines existing indexes and uses Oracle's execution plan facilities to understand how queries access tables and indexes.

### 8. Constraints




