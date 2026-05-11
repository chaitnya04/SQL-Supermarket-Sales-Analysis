use sales
SELECT*FROM SuperMarket_Sales_Data

--1.How many total records are in the dataset?--
SELECT COUNT(*) 
FROM SuperMarket_Sales_Data

--2.How many unique customers are there?--
SELECT COUNT(DISTINCT Invoice_ID) AS Total_Customers
FROM SuperMarket_Sales_Data; 

--3.How many branches are present?--
SELECT COUNT(DISTINCT Branch) as Unique_Branch
FROM SuperMarket_Sales_Data

--4.What are the different product lines?--
SELECT COUNT(DISTINCT Product_line) as Unique_Product
FROM SuperMarket_Sales_Data

--5.What is the date range of sales data?--
SELECT MIN(Date) as Start_date,
MAX(Date) as End_date
FROM SuperMarket_Sales_Data

--6.List all columns in the dataset.--
SELECT*
FROM SuperMarket_Sales_Data

--7.Find all distinct payment methods used.--
SELECT DISTINCT Payment as Unique_payment
FROM SuperMarket_Sales_Data

--8.What is the total revenue (total sales)?--
SELECT SUM(Total) as Total_Revenue
FROM SuperMarket_Sales_Data

--9.What is the average sale per transaction?--
SELECT AVG(Total) as Avg_sales
FROM SuperMarket_Sales_Data

--10.What is total quantity sold?--
SELECT SUM(Quantity) AS Total_Quantity
FROM SuperMarket_Sales_Data;

--11.What is total tax collected?--
SELECT SUM(Tax_5) as Total_Tax_Collect
FROM SuperMarket_Sales_Data

--12.Which branch generated the highest revenue?--
-- Insight:
-- Branch C generated the highest revenue,
-- indicating stronger customer demand and better sales performance.
SELECT Branch,
SUM(Total) as Revenue
FROM SuperMarket_Sales_Data
GROUP BY Branch
ORDER BY Revenue desc;

--13.Which city has the highest total sales?--
-- Insight:
-- The top-performing city contributed the largest share of revenue,
-- making it a strong candidate for future business expansion.
SELECT City,
SUM(Total) as Revenue
FROM SuperMarket_Sales_Data
GROUP BY City
ORDER BY Revenue desc;

--14.What is monthly total sales?--
-- Insight:
-- Monthly sales trends revealed fluctuations in revenue,
-- helping identify peak and low-performing periods.
SELECT 
    FORMAT(date, 'yyyy-MM') AS month,
    SUM(total) AS total_sales
FROM SuperMarket_Sales_Data
GROUP BY FORMAT(date, 'yyyy-MM')
ORDER BY month;

--15.Which day of the week has highest sales?--
-- Insight:
-- Certain weekdays consistently generated higher sales,
-- helping optimize staffing and operational planning.
SELECT 
DAY(Date) as Day,
SUM(Total) as Total_sales
FROM SuperMarket_Sales_Data
GROUP BY DAY(Date)
ORDER BY Total_sales desc;

--16.Which product line has highest sales?--
-- Insight:
-- Food and beverages emerged as the highest-selling category,
-- showing strong customer demand for daily-use products.
SELECT Product_line,
SUM(Total) as Total_sales
FROM SuperMarket_Sales_Data
GROUP BY Product_line
ORDER BY Total_sales desc;

--17.Which product line generates the most revenue?--
SELECT Product_line,
SUM(Total) as Revenue
FROM SuperMarket_Sales_Data
GROUP BY Product_line
ORDER BY Revenue desc; 

--18.Which product line has highest quantity sold?--
-- Insight:
-- Product categories with higher quantities sold indicate
-- consistent customer demand and faster inventory movement.
SELECT Product_line,
SUM(Quantity) AS Total_Quantity
FROM SuperMarket_Sales_Data
GROUP BY Product_line
ORDER BY Total_Quantity DESC;

--19.Which product line has lowest sales?--
-- Insight:
-- Lower-performing product lines may require promotional campaigns
-- or pricing adjustments to improve sales performance.
SELECT TOP 1 Product_line,
SUM(total) as Total_sales
FROM SuperMarket_Sales_Data
GROUP BY  Product_line
ORDER BY Total_sales asc;

--20.What is average price per product line?--
SELECT Product_line,
AVG(Unit_price) as Avg_UnitPrice
FROM SuperMarket_Sales_Data
GROUP BY Product_line ;

--21.Which product line has highest rating?--
-- Insight:
-- Higher-rated product lines generally produced stronger revenue,
-- suggesting customer satisfaction positively impacts sales.
SELECT Product_line,
AVG(Rating) as Rating
FROM SuperMarket_Sales_Data
GROUP BY Product_line;

--22.Who are the top 10 customers by total spending?--
SELECT TOP 10 Invoice_ID,
SUM(Total) as Total_sales
FROM SuperMarket_Sales_Data
GROUP BY Invoice_ID 
ORDER BY Total_sales desc;

--23.Which customer type spends more (Member vs Normal)?--
-- Insight:
-- Member customers contributed more revenue than normal customers,
-- indicating the effectiveness of loyalty programs.
SELECT Customer_type,
SUM(Total) as Total_sales
FROM SuperMarket_Sales_Data
GROUP BY Customer_type
ORDER BY Total_sales desc;

--24.What is average purchase value per customer type?--
SELECT Customer_type,
AVG(Total) 
FROM SuperMarket_Sales_Data
GROUP BY Customer_type ;

--25.Which gender spends more overall?--
-- Insight:
-- Female customers contributed slightly higher overall spending,
-- indicating stronger purchasing activity.
SELECT Gender,
SUM(Total) as Total_spending
FROM SuperMarket_Sales_Data
GROUP BY Gender
ORDER BY  Total_spending desc;

--26.What is average rating given by male vs female customers?--
SELECT Gender,
AVG(Rating) as  Rating
FROM SuperMarket_Sales_Data
GROUP BY  Gender ;

--27.Which payment method is most used?--
-- Insight:
-- E-wallet and digital payment methods showed strong usage,
-- reflecting changing customer payment preferences.
SELECT payment ,
COUNT(*) AS Used_payment
FROM SuperMarket_Sales_Data
GROUP BY Payment
ORDER BY  Used_payment desc;

--28.Which payment method generates highest revenue?--
-- Insight:
-- The highest-revenue payment method indicates the preferred transaction choice among customers.
SELECT Payment,
SUM(Total) as Total_sales
FROM SuperMarket_Sales_Data
GROUP BY Payment
ORDER BY Total_sales desc;

--29.Do cash payments generate more sales than card/e-wallet?--
SELECT Payment,
SUM(Total) as total_sales
FROM SuperMarket_Sales_Data
GROUP BY Payment ;

--30.What are monthly sales trends?--
-- Insight:
-- Monthly sales trends helped identify revenue growth patterns
-- and seasonal business performance.
SELECT 
    FORMAT(date, 'yyyy-MM') AS month,
    SUM(total) AS total_sales
FROM SuperMarket_Sales_Data
GROUP BY FORMAT(date, 'yyyy-MM')
ORDER BY month;

--31.Which month has highest sales?--
-- Insight:
-- The highest-sales month indicates seasonal demand peaks,
-- useful for future inventory and staffing planning.
SELECT TOP 1 FORMAT(date,'yyyy-mm') AS month,
SUM(total)
FROM SuperMarket_Sales_Data
GROUP BY FORMAT(date,'yyyy-mm')
ORDER BY SUM(total) desc ;

--32.Which month has lowest sales?--
-- Insight:
-- Lower-performing months may require additional marketing campaigns
-- or promotional offers to increase sales.
SELECT TOP 1 FORMAT(date,'yyyy-MM') AS month, 
SUM(total)
FROM SuperMarket_Sales_Data
GROUP BY FORMAT(date,'yyyy-MM')
ORDER BY SUM(total) asc;

--33.What is daily sales trend?--
SELECT date, SUM(total)
FROM SuperMarket_Sales_Data
GROUP BY date;

--34.What is average sales per month?--
SELECT AVG(monthly_sales)
FROM (
    SELECT FORMAT(date,'yyyy-MM') AS month, 
	SUM(total) AS monthly_sales
    FROM SuperMarket_Sales_Data
    GROUP BY FORMAT(date,'yyyy-MM') 
) t;

--35.Rank branches by total sales--
-- Insight:
-- Revenue ranking highlighted the strongest-performing branches
-- and identified locations needing improvement.
SELECT branch,
SUM(total) AS revenue,
RANK() OVER (ORDER BY SUM(total) DESC) AS rnk
FROM SuperMarket_Sales_Data
GROUP BY branch;

--36.Rank product lines by revenue--
-- Insight:
-- Top-ranked product lines consistently generated strong revenue,
-- making them key business drivers.
SELECT product_line,
SUM(total),
RANK() OVER (ORDER BY SUM(total) DESC)
FROM SuperMarket_Sales_Data
GROUP BY product_line;

--37.Find running total of sales over time--
-- Insight:
-- Running total analysis showed steady business growth over time.
SELECT date,
SUM(total) AS daily_sales,
SUM(SUM(total)) OVER (ORDER BY date) AS running_total
FROM SuperMarket_Sales_Data
GROUP BY date;

--38.Find month-over-month growth--
-- Insight:
-- Month-over-month growth analysis identified periods of rapid growth
-- and potential sales slowdowns.
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

--39.Find top 3 products per branch--
-- Insight:
-- Different branches showed different product preferences,
-- indicating regional differences in customer buying behavior.
SELECT *
FROM (
    SELECT branch, product_line, SUM(total) AS sales,
           RANK() OVER (PARTITION BY branch ORDER BY SUM(total) DESC) AS rnk
    FROM SuperMarket_Sales_Data
    GROUP BY branch, product_line
) t
WHERE rnk <= 3;

--40.Calculate cumulative revenue by month--
SELECT date,
SUM(total) AS daily_sales,
SUM(SUM(total)) OVER (ORDER BY date) AS cumulative_sales
FROM SuperMarket_Sales_Data
GROUP BY date;

--41.Which branch is underperforming and why?--
-- Insight:
-- The lowest-performing branch may require better marketing,
-- promotional offers, or inventory optimization.
SELECT branch, SUM(total)
FROM SuperMarket_Sales_Data
GROUP BY branch
ORDER BY SUM(total) ASC; 

--42.Which product line should supermarket promote?--
-- Recommendation:
-- High-performing product lines should receive additional promotions
-- to maximize revenue growth.
SELECT product_line, SUM(total)
FROM SuperMarket_Sales_Data
GROUP BY product_line
ORDER BY SUM(total) DESC;

--43.Which customer segment is most valuable?--
-- Insight:
-- Loyal member customers generated higher revenue,
-- making them the most valuable customer segment.
SELECT customer_type, SUM(total)
FROM SuperMarket_Sales_Data
GROUP BY customer_type
ORDER BY SUM(total) DESC;

--44.What factors influence high sales?--
-- Insight:
-- Products with higher customer ratings generally achieved better sales,
-- suggesting customer satisfaction influences purchasing behavior.
SELECT rating, AVG(total)
FROM SuperMarket_Sales_Data
GROUP BY rating;

--45.Which payment method should be encouraged?--
-- Recommendation:
-- Digital payment methods can be encouraged through cashback offers
-- and promotional discounts to improve customer convenience.
SELECT payment, SUM(total)
FROM SuperMarket_Sales_Data
GROUP BY payment;
