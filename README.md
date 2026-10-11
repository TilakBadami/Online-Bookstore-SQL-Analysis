# Online Bookstore SQL Analysis

## Project Overview
The Online Bookstore SQL Analysis project uses Oracle SQL to analyze bookstore transactions, customer purchasing behavior, book sales, and monthly revenue. The project demonstrates practical SQL skills through joins, aggregate functions, views, indexing, execution plans, and data validation.

## Objectives
- Analyze customer orders and purchasing patterns.
- Identify best-selling books and calculate book-wise revenue.
- Summarize monthly sales performance.
- Evaluate customer spending and order history.
- Validate stored order totals against calculated totals.
- Explore database indexes and query execution plans.

## Tools and Technologies
- **Database:** Oracle Database
- **SQL Tool:** Oracle SQL Developer
- **Language:** SQL

## Database Tables
The project uses six tables:

| Table | Description |
|---|---|
| `AUTHORS` | Stores author information |
| `BOOKS` | Stores book details, prices, authors, and genres |
| `GENRES` | Stores book genre information |
| `CUSTOMERS` | Stores customer details |
| `ORDERS` | Stores order dates, customer references, and order totals |
| `ORDER_DETAILS` | Stores books and quantities associated with each order |

## SQL Concepts Demonstrated
- DDL and DML statements
- Primary keys and foreign keys
- INNER JOIN and LEFT JOIN
- Aggregate functions: `COUNT()`, `SUM()`, and `AVG()`
- `GROUP BY`, `HAVING`, and `ORDER BY`
- Subqueries and calculated columns
- Views for reusable analysis
- Index creation and verification
- `EXPLAIN PLAN` and `DBMS_XPLAN`
- Data validation and consistency checks

## Key Analysis

### 1. Order Details Analysis
Combines orders, customers, books, and order details to display customer information, purchased books, quantities, prices, line totals, and order totals.

![Order Details Analysis](screenshots/order_details_analysis.png)

### 2. Customer Spending Analysis
Summarizes total orders, total book units purchased, and total spending for each customer.

![Customer Spending Analysis](screenshots/customer_spending_analysis.png)

### 3. Monthly Sales Analysis
Summarizes monthly order volume, units sold, and total sales revenue.

![Monthly Sales Analysis](screenshots/monthly_sales_analysis.png)

## Key Findings
Based on the current sample data:
- **Total orders:** 6
- **Total customers who placed orders:** 5
- **Total book units sold:** 13
- **Total sales revenue:** 4,896
- **Highest-spending customer:** Rahul Sharma, with total spending of 1,698
- **Highest-selling books by units:** Multiple books are tied at 2 units each.

*Note: These findings reflect the current sample dataset, not a complete real-world bookstore.*

## Data Validation
The project includes checks to compare stored order totals with calculated totals from order-detail records. The validation results show matching totals for the six existing orders.

Additional checks examine table row counts, primary and foreign key constraints, and potential orphaned records.

## Indexing and Query Performance
The project explores indexes on selected columns and uses Oracle execution plans to inspect how queries access tables and indexes. Execution plans help understand query execution strategies; they do not by themselves prove a performance improvement.

## Project Structure

```text
Online-Bookstore-SQL-Analysis/
├── 01_Table_Creation_and_Sample_Data.sql
├── 02_Views.sql
├── 03_Indexes_and_Execution_Plans.sql
├── 04_Basic_Joins_and_Order_Queries.sql
├── 05_Sales_and_Customer_Analysis.sql
├── 06_Data_Validation.sql
├── screenshots/
│   ├── order_details_analysis.png
│   ├── customer_spending_analysis.png
│   └── monthly_sales_analysis.png
└── README.md
```

## How to Run the Project
1. Install or access an Oracle Database environment and open Oracle SQL Developer.
2. Connect using a database account with the required permissions.
3. Run the table creation and sample-data script first.
4. Execute the remaining SQL scripts in the appropriate order.
5. Review the query results, validation checks, and execution plans.

**Important:** Run the scripts in a suitable test schema. Review any `DROP`, `DELETE`, or `UPDATE` statements before executing them.

## Skills Demonstrated
Oracle SQL | Database Management | Data Analysis | SQL Joins | Aggregations | Data Validation | Indexing | Query Execution Plans | Business Reporting

## Conclusion
This project demonstrates how SQL can transform relational bookstore data into useful information about sales, customers, and purchasing trends while checking data consistency and exploring database query performance.

