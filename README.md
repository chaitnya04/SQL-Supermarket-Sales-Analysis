# 📊 SQL Supermarket Sales Analysis

## 📌 Project Overview

This project focuses on analyzing supermarket sales data using SQL to uncover valuable business insights related to sales performance, customer behavior, product demand, and revenue trends.

The analysis includes basic SQL queries, aggregations, window functions, Common Table Expressions (CTEs), ranking functions, and business-focused analytical queries.

---

# 🎯 Objectives

* Analyze overall sales performance
* Identify top-performing branches and product lines
* Understand customer purchasing behavior
* Evaluate payment method preferences
* Track monthly sales trends and growth
* Generate business insights using SQL

---

# 🛠️ Tools & Technologies Used

* SQL Server
* SQL
* GitHub
* Supermarket Sales Dataset

---

# 📂 Dataset Information

The dataset contains supermarket transactional sales data including:

* Branch
* City
* Customer Type
* Gender
* Product Line
* Unit Price
* Quantity
* Tax
* Total Sales
* Date
* Payment Method
* Rating

---

# 🧠 SQL Concepts Used

This project includes:

* SELECT Statements
* Aggregate Functions
* GROUP BY
* ORDER BY
* DISTINCT
* Window Functions
* RANK()
* LAG()
* Running Totals
* Common Table Expressions (CTEs)
* Business Analysis Queries

---

# 📊 Business Questions Solved

## Sales Analysis

* Total revenue generated
* Average sales per transaction
* Monthly sales trends
* Highest revenue branch
* Highest sales city
* Daily sales analysis

## Product Analysis

* Best-selling product lines
* Highest revenue product category
* Lowest-performing products
* Product ratings analysis

## Customer Analysis

* Most valuable customer segment
* Gender-based spending analysis
* Customer purchase behavior

## Payment Analysis

* Most used payment method
* Highest revenue payment method
* Digital vs cash payment analysis

## Advanced SQL Analysis

* Running total calculations
* Month-over-month growth
* Branch ranking by revenue
* Top products per branch
* Cumulative sales analysis

---

# 📈 Key Business Insights

* Branch C generated the highest revenue, indicating stronger sales performance.
* Food and beverages emerged as the top-performing product category.
* Member customers contributed more revenue than normal customers.
* Digital payment methods showed strong customer adoption.
* Monthly sales trends revealed fluctuations in business performance.
* Higher-rated products generally produced stronger sales.
* Different branches showed different product preferences.

---

# 🚀 Sample Advanced SQL Queries

## Rank Branches by Revenue

```sql
SELECT branch,
SUM(total) AS revenue,
RANK() OVER (ORDER BY SUM(total) DESC) AS rnk
FROM SuperMarket_Sales_Data
GROUP BY branch;
```

## Month-over-Month Growth

```sql
WITH monthly AS (
    SELECT FORMAT(date,'yyyy-MM') AS month,
           SUM(total) AS sales
    FROM SuperMarket_Sales_Data
    GROUP BY FORMAT(date,'yyyy-MM')
)
SELECT month,
       sales,
       LAG(sales) OVER (ORDER BY month) AS prev_month,
       (sales - LAG(sales) OVER (ORDER BY month)) AS growth
FROM monthly;
```

---

# 📌 Conclusion

This project helped strengthen SQL and data analysis skills by solving real-world business problems using sales data.

The project demonstrates the ability to:

* Write analytical SQL queries
* Generate business insights from raw data
* Use advanced SQL concepts for analysis
* Present meaningful findings for decision-making

---

# 🔗 GitHub Repository

Repository: SQL-Supermarket-Sales-Analysis
