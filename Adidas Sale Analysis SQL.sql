CREATE DATABASE AdidasSalesDB;
GO

USE AdidasSalesDB;
GO

CREATE TABLE AdidasSales (
    Retailer            VARCHAR(100),
    Retailer_ID         INT,
    Invoice_Date        DATE,
    Region              VARCHAR(100),
    State_Name          VARCHAR(100),
    City                VARCHAR(100),
    Product             VARCHAR(150),
    Price_per_Unit      DECIMAL(10,2),
    Units_Sold          INT,
    Total_Sales         DECIMAL(12,2),
    Operating_Profit    DECIMAL(12,2),
    Operating_Margin    DECIMAL(5,2),
    Sales_Method        VARCHAR(100)
);

DROP TABLE AdidasSales;

DROP TABLE Adidas;



--MY ANALYSIS

SELECT TOP 10 *
FROM AdidasSales;

SELECT COUNT(*) AS Total_Rows
FROM AdidasSales;

--Total Revenue
SELECT SUM(Total_Sales) AS Total_Revenue
FROM AdidasSales;

--Total Units Sold
SELECT SUM(Units_Sold) AS Total_Units
FROM AdidasSales;

--Average Order Value
SELECT 
    SUM(Total_Sales) * 1.0 / SUM(Units_Sold) AS Avg_Price_Per_Unit
FROM AdidasSales;

--Sales Trend Over Time
SELECT 
    YEAR(Invoice_Date) AS Year,
    MONTH(Invoice_Date) AS Month,
    SUM(Total_Sales) AS Revenue
FROM AdidasSales
GROUP BY YEAR(Invoice_Date), MONTH(Invoice_Date)
ORDER BY Year, Month;

--Top 5 Retailers by Revenue
SELECT TOP 5
    Retailer,
    SUM(Total_Sales) AS Revenue
FROM AdidasSales
GROUP BY Retailer
ORDER BY Revenue DESC;

--Retailer Profitability
SELECT 
    Retailer,
    SUM(Total_Sales) AS Revenue,
    SUM(Operating_Profit) AS Profit,
    SUM(Operating_Profit) * 1.0 / SUM(Total_Sales) AS Profit_Margin
FROM AdidasSales
GROUP BY Retailer
ORDER BY Profit DESC;

--Best Selling Products
SELECT TOP 10
    Product,
    SUM(Units_Sold) AS Units_Sold,
    SUM(Total_Sales) AS Revenue
FROM AdidasSales
GROUP BY Product
ORDER BY Revenue DESC;

--Most Profitable Products
SELECT 
    Product,
    SUM(Operating_Profit) AS Profit
FROM AdidasSales
GROUP BY Product
ORDER BY Profit DESC;

--Sales by Region
SELECT 
    Region,
    SUM(Total_Sales) AS Revenue
FROM AdidasSales
GROUP BY Region
ORDER BY Revenue DESC;

--Top Cities
SELECT TOP 10
    City,
    SUM(Total_Sales) AS Revenue
FROM AdidasSales
GROUP BY City
ORDER BY Revenue DESC;

--Profit Margin by Region
SELECT 
    Region,
    SUM(Operating_Profit) AS Profit,
    SUM(Total_Sales) AS Sales,
    SUM(Operating_Profit) * 1.0 / SUM(Total_Sales) AS Profit_Margin
FROM AdidasSales
GROUP BY Region
ORDER BY Profit_Margin DESC;

--Sales Method Performance
SELECT 
    Sales_Method,
    SUM(Total_Sales) AS Revenue,
    SUM(Operating_Profit) AS Profit
FROM AdidasSales
GROUP BY Sales_Method
ORDER BY Revenue DESC;

-- High-Level KPI Summary
SELECT 
    SUM(Total_Sales) AS Total_Revenue,
    SUM(Units_Sold) AS Total_Units,
    SUM(Operating_Profit) AS Total_Profit,
    SUM(Operating_Profit) * 1.0 / SUM(Total_Sales) AS Overall_Profit_Margin
FROM AdidasSales;