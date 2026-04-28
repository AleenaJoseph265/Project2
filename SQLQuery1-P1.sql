USE RETAILSALES

--DATA CLEANING & SORTING--
SELECT * FROM retailsales_data
ALTER TABLE retailsales_data ALTER COLUMN price DECIMAL(10,2);
SELECT * FROM retailsales_data WHERE quantity IS  NULL  OR
gender IS  NULL OR age IS  NULL OR category IS  NULL OR price IS  NULL OR payment_method IS  NULL OR shopping_mall IS  NULL 
SELECT CAST(SUM(price) AS DECIMAL(10,2)) AS Total_price FROM retailsales_data
ALTER TABLE retailsales_data ADD Total_Amount FLOAT;
UPDATE retailsales_data SET Total_Amount = price*quantity
ALTER TABLE retailsales_data ALTER COLUMN Total_Amount DECIMAL(10,2)

--DATA AGGREGATION--
SELECT * FROM retailsales_data
SELECT SUM(Total_Amount) AS Total_Revenue FROM retailsales_data
SELECT SUM(quantity) AS Total_Quantity FROM retailsales_data
SELECT TOP 5 category, SUM(Total_Amount) AS Total_Revenue, SUM(quantity) AS no_of_items FROM retailsales_data GROUP BY category ORDER BY Total_Revenue DESC
SELECT TOP 2 shopping_mall, SUM(Total_Amount) AS Total_Revenue, COUNT(DISTINCT customer_id) AS no_of_Customers ,  SUM(quantity) AS No_of_items FROM retailsales_data GROUP BY shopping_mall ORDER BY Total_Revenue DESC
SELECT category, SUM(Total_Amount) AS Total_Revenue FROM retailsales_data GROUP BY category
SELECT AVG(Total_Amount) AS Average_Sales FROM retailsales_data
SELECT category, AVG(Total_Amount) AS Average_Sales FROM retailsales_data GROUP BY category
SELECT payment_method, COUNT(*) AS No_of_payments FROM retailsales_data GROUP BY payment_method
SELECT category,COUNT(CASE WHEN YEAR(invoice_date)=2023 THEN 1 END) AS no_of_sales_2023,COUNT(CASE WHEN YEAR(invoice_date)=2022 THEN 2 END) AS no_of_sales_2022, COUNT(CASE WHEN YEAR(invoice_date)=2021 THEN 3 END) AS no_of_sales_2021 FROM retailsales_data GROUP BY category


 --DATA TREND ANALYSIS--
 SELECT 
  YEAR(invoice_date) AS year,
  MONTH(invoice_date) AS month,
  SUM(Total_Amount) AS revenue
FROM retailsales_data
GROUP BY YEAR(invoice_date), MONTH(invoice_date)
ORDER BY year, month
SELECT 
  category,
  YEAR(invoice_date) AS year,
  MONTH(invoice_date) AS month,
  SUM(Total_Amount) AS revenue
FROM retailsales_data
GROUP BY category, YEAR(invoice_date), MONTH(invoice_date)
ORDER BY  year, month ASC