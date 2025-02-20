# Retail Sales Analysis Project

## Introduction
#This project focuses on analyzing retail sales data to derive valuable business insights. The main objective is to understand the sales trends, 
#identify the most profitable products, and analyze sales performance across different categories and time periods.

CREATE DATABASE retail_sales_db;
USE retail_sales_db;
SELECT COUNT(*) FROM retail_sales;

 
#Preview the dataset
SELECT * FROM retail_sales LIMIT 10;

#Check total records in the dataset
SELECT COUNT(*) FROM retail_sales;

# Q1.Finding the Top 10 Highest Sales Transactions
SELECT * 
FROM retail_sales 
ORDER BY Sales DESC 
LIMIT 10;

#Total Sales per Category in a Specific Time Period
# Q2. Write a query to display total sales per category between '2023-06-01' and '2023-12-31'.
SELECT Category, SUM(Sales) AS Total_Sales, Order_Date
FROM retail_sales
WHERE Order_Date BETWEEN '2023-06-01' AND '2023-12-31'
GROUP BY Category , Order_Date
ORDER BY Total_Sales DESC;


#Using HAVING for Filtering Grouped Data
# Q3. Write a query to display categories with total sales above ₹50,000.
SELECT Category, sum(Sales) AS Total_Sales
FROM retail_sales
group by Category
having Total_sales >50000;


# PRODUCT TABLE 
SELECT * FROM product;

# JOIN – INNER JOIN ORACLE SYNTAX
# Q4. Write a query to calculate the total sales for each product by joining the retail_sales table with the product table.
 SELECT Product_name, sum(sales) as Total_sales
 from retail_sales,product
 where retail_sales.Category=product.Category
 GROUP BY Product_Name;


#JOIN-LEFT JOIN ORACLE SYNTAX
# Q5.  Display all products along with their selling price and the total revenue generated BETWEEN 800 AND 5000.
SELECT Product_ID, Product_Name,Price, Sales AS Total_Revenue  
FROM product LEFT JOIN  retail_sales  
ON product.Category= retail_sales.Category
AND Sales BETWEEN 800 AND 5000  OR sales IS NULL ; 

#Single-Row SUBQUERY
# Q6. Write a query to find the most profitable product.
SELECT Product, Profit 
FROM retail_sales 
WHERE Profit = (SELECT MAX(Profit) FROM retail_sales);

#Multi-Row NESTED SUBQUERY
# Q7. Write a query to find customer-ID  who have spent more than the average sales Top 20.
SELECT Customer_ID, SUM(Sales) AS Total_Spending 
FROM retail_sales 
GROUP BY Customer_ID
HAVING Total_Spending > (SELECT AVG(Sales) FROM retail_sales) 
ORDER BY Total_Spending DESC
limit 20;

#Using CASE (Conditional Logic in Queries)
# Q9. Write a query to classify products into High, Moderate, and Low Profit.
SELECT Product, Profit,
    CASE 
        WHEN Profit > 100 THEN 'High Profit'
        WHEN Profit BETWEEN 50 AND 100 THEN 'Moderate Profit'
        ELSE 'Low Profit'
    END AS Profit_Category
FROM retail_sales;

#using IN operator
#10. Finding Customers Who Purchased Either 'Electronics' or 'Furniture' (Using IN Operator)
SELECT DISTINCT Customer_ID,Category
FROM retail_sales
WHERE Category IN ('Electronics', 'Furniture');


#Using < Operator
# 10. Finding Orders Placed Before '2024-01-01' (Using < Operator)
SELECT Order_Date, Category
FROM retail_sales
WHERE Order_Date < '2024-01-01';

#using > operator with date 
# 11. Finding Orders Placed After '2023-07-01' (Using > Operator)
SELECT Order_Date, Category
FROM retail_sales
WHERE Order_Date > '2023-07-01';

#Using BETWEEN#
# 12. Finding Sales Between a Specific Range (Using BETWEEN)
SELECT * 
FROM retail_sales 
WHERE Sales BETWEEN 950 AND 1000;

#using like function
# 13. Finding Category  which  ends with 'S' (Using LIKE)
SELECT * 
FROM retail_sales
WHERE Category LIKE '%S';

#using and operator
# 14. Filtering PRODUCT from SpecIFIC CATEGORY.
SELECT * 
FROM retail_sales 
WHERE product='Tennis Racket' and Category='Sports';

##Conclusion
#This analysis provides insights into product sales performance and helps businesses make data-driven decisions. By using SQL queries,
#we were able to filter and aggregate data to answer various business questions.
 
##Thank You:
#Thank you for taking the time to review this project. I am excited to have the opportunity to demonstrate my skills in SQL and data analysis,
#and I look forward to any questions or feedback.