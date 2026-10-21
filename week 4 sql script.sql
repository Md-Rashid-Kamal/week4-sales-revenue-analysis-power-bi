USE week4_sales;

CREATE TABLE IF NOT EXISTS sales (
    OrderID VARCHAR(10) PRIMARY KEY,
    OrderDate DATE NOT NULL,
    Region VARCHAR(20) NOT NULL,
    City VARCHAR(40) NOT NULL,
    SalesChannel VARCHAR(20) NOT NULL,
    Product VARCHAR(50) NOT NULL,
    Category VARCHAR(30) NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(12,2) NOT NULL,
    DiscountPct DECIMAL(5,2) NOT NULL,
    Revenue DECIMAL(14,2) NOT NULL,
    Cost DECIMAL(14,2) NOT NULL,
    Profit DECIMAL(14,2) NOT NULL
);
select COUNT(*) AS total_rows from sales; 
USE week4_sales;


SELECT
    Region,
    ROUND(SUM(Revenue), 2) AS Revenue,
    ROUND(SUM(Profit), 2) AS Profit
FROM sales
GROUP BY Region
ORDER BY Revenue DESC;

SELECT
    DATE_FORMAT(OrderDate, '%Y-%m') AS Month,
    ROUND(SUM(Revenue), 2) AS Revenue
FROM sales
GROUP BY DATE_FORMAT(OrderDate, '%Y-%m')
ORDER BY Month;

SELECT
    ROUND(SUM(Revenue), 2) AS TotalRevenue,
    ROUND(SUM(Cost), 2) AS TotalCost,
    ROUND(SUM(Profit), 2) AS TotalProfit
FROM sales;

SELECT
    Region,
    ROUND(SUM(Revenue), 2) AS Revenue,
    ROUND(SUM(Profit), 2) AS Profit
FROM sales
GROUP BY Region
ORDER BY Revenue DESC;

SELECT
    Product,
    SUM(Quantity) AS UnitsSold,
    ROUND(SUM(Revenue), 2) AS Revenue
FROM sales
GROUP BY Product
ORDER BY UnitsSold DESC;