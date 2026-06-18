-- ============================================================
-- DecodeLabs Data Analytics Internship — Batch 2026
-- Project 3: SQL Data Analysis
-- Dataset: EcommerceOrders (1,200 rows | Microsoft SQL Server)
-- Prepared by: Gloria Okoli | June 2026
-- ============================================================

-- Query 1: View All Data (SELECT *)
-- Objective: Retrieve all records to confirm successful data import

SELECT *
FROM EcommerceOrders;


-- Query 2: Filter by Order Status (WHERE)
-- Objective: Isolate orders with a Shipped status

SELECT OrderID, Date, Product, TotalPrice, OrderStatus
FROM EcommerceOrders
WHERE OrderStatus = 'Shipped';


-- Query 3: Sort Orders by Total Price (ORDER BY DESC)
-- Objective: Rank all orders from highest to lowest value

SELECT OrderID, Date, Product, Quantity, TotalPrice
FROM EcommerceOrders
ORDER BY TotalPrice DESC;


-- Query 4: Count Orders by Product (GROUP BY + COUNT)
-- Objective: Determine which product category receives the highest number of orders

SELECT Product, COUNT(*) AS TotalOrders
FROM EcommerceOrders
GROUP BY Product
ORDER BY TotalOrders DESC;


-- Query 5: Total Revenue by Product (GROUP BY + SUM)
-- Objective: Identify which product category generates the most total revenue

SELECT Product, SUM(TotalPrice) AS TotalRevenue
FROM EcommerceOrders
GROUP BY Product
ORDER BY TotalRevenue DESC;


-- Query 6: Average Order Value by Payment Method (GROUP BY + AVG)
-- Objective: Determine which payment method is associated with the highest average spend

SELECT PaymentMethod, AVG(TotalPrice) AS AvgOrderValue
FROM EcommerceOrders
GROUP BY PaymentMethod
HAVING AVG(TotalPrice) > 1050
ORDER BY AvgOrderValue DESC;


-- Query 7: Top 10 Spending Customers (GROUP BY + SUM + TOP)
-- Objective: Identify the highest value customers by cumulative total spend

SELECT TOP 10 CustomerID, SUM(TotalPrice) AS TotalSpent
FROM EcommerceOrders
GROUP BY CustomerID
ORDER BY TotalSpent DESC;


-- Query 8: Filter Orders by Date Range (WHERE + AND)
-- Objective: Extract all orders placed within the 2024 calendar year

SELECT OrderID, Date, Product, TotalPrice, OrderStatus
FROM EcommerceOrders
WHERE Date >= '2024-01-01' AND Date <= '2024-12-31'
ORDER BY Date ASC;


-- Query 9: Orders Above Average Value (WHERE + Subquery)
-- Objective: Identify all orders exceeding the dataset's overall average order value

SELECT OrderID, Date, Product, TotalPrice
FROM EcommerceOrders
WHERE TotalPrice > (SELECT AVG(TotalPrice) FROM EcommerceOrders)
ORDER BY TotalPrice DESC;


-- Query 10: Products with More Than 170 Orders (GROUP BY + HAVING + COUNT)
-- Objective: Filter product categories to show only those with high order volume

SELECT Product, COUNT(*) AS TotalOrders
FROM EcommerceOrders
GROUP BY Product
HAVING COUNT(*) > 170
ORDER BY TotalOrders DESC;


-- Query 11: Payment Methods with Average Order Value Above 1,050 (GROUP BY + HAVING + AVG)
-- Objective: Isolate payment methods associated with above-threshold average spending

SELECT PaymentMethod, AVG(TotalPrice) AS AvgOrderValue
FROM EcommerceOrders
GROUP BY PaymentMethod
HAVING AVG(TotalPrice) > 1050
ORDER BY AvgOrderValue DESC;
