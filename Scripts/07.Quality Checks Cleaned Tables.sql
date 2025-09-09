/*
===============================================================================
Quality Checks - Cleaned tables
===============================================================================
Script Purpose:
    This script performs various quality checks for data consistency, accuracy, 
    and standardization across the Cleaned tables. It includes checks for:
    - Null or duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data standardization and consistency.
    - Invalid date ranges and orders.
    - Data consistency between related fields.

Usage Notes:
    - Run these checks after data loading Cleaned Tables.
    - Investigate and resolve any discrepancies found during the checks.
===============================================================================
*/
-- ====================================================================
-- Checking 'cleaned.Orders'
-- ====================================================================
-- Check for NULLs or Duplicates in Primary Key
-- Expectation: No Results
SELECT *
FROM cleaned.Orders
WHERE OrderID IN (
    SELECT OrderID, COUNT(*)
    FROM cleaned.Orders
    GROUP BY OrderID
    HAVING COUNT(*) > 1 OR OrderID IS NULL
)
-- Data Standardization & Consistency
SELECT DISTINCT 
  WarehouseCode 
FROM cleaned.Orders;

SELECT DISTINCT 
  SalesChannel 
FROM cleaned.Orders;


-- Check for invalid date in cleaned.Orders table
-- Expectation: No Invalid Date
SELECT ProcuredDate  FROM cleaned.Orders
WHERE ProcuredDate IS NULL
    OR ProcuredDate < '1900-01-01'
    OR ProcuredDate > CAST(GETDATE() AS DATE)
    OR DATEDIFF(YEAR, ProcuredDate, GETDATE()) NOT BETWEEN 3 AND 120;

SELECT OrderDate  FROM cleaned.Orders
WHERE OrderDate IS NULL
    OR OrderDate < '1900-01-01'
    OR OrderDate > CAST(GETDATE() AS DATE)
    OR DATEDIFF(YEAR, OrderDate, GETDATE()) NOT BETWEEN 3 AND 120;

SELECT ShipDate  FROM cleaned.Orders
WHERE ShipDate IS NULL
    OR ShipDate < '1900-01-01'
    OR ShipDate > CAST(GETDATE() AS DATE)
    OR DATEDIFF(YEAR, ShipDate, GETDATE()) NOT BETWEEN 3 AND 120;


SELECT DeliveryDate  FROM cleaned.Orders
WHERE DeliveryDate IS NULL
    OR DeliveryDate < '1900-01-01'
    OR DeliveryDate > CAST(GETDATE() AS DATE)
    OR DATEDIFF(YEAR, DeliveryDate, GETDATE()) NOT BETWEEN 3 AND 120;

-- Check for NULLs or Negative Values in unitPrice,UnitCost, quantity
-- Expectation: No Results
SELECT 
    UnitPrice 
FROM cleaned.Orders
WHERE UnitPrice < 0 OR UnitPrice IS NULL;

SELECT 
    UnitCost 
FROM cleaned.Orders
WHERE UnitCost < 0 OR UnitCost IS NULL;

SELECT 
    OrderQuantity 
FROM cleaned.Orders
WHERE OrderQuantity < 0 OR OrderQuantity IS NULL;


-- Check for Invalid Date Orders (OrderDate  > ShipDate)
-- Expectation: No Results
SELECT 
    * 
FROM cleaned.Orders
WHERE   OrderDate < ProcuredDate
        OR  ShipDate < OrderDate
        OR  DeliveryDate < ShipDate;



-- Check for NULLs or Duplicates in the cleaned.Orders table
-- Expectation: No Results
 WITH OrdertDuplicates AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY OrderID, SalesChannel,WarehouseCode, ProcuredDate, OrderDate, ShipDate, 
               DeliveryDate, CurrencyCode, SalesTeamID, CustomerID, StoreID, ProductID, OrderQuantity,
               DiscountApplied, UnitPrice, UnitCost
               ORDER BY (SELECT NULL)
           ) AS rn
    FROM cleaned.Orders
)
SELECT *
FROM OrdertDuplicates
WHERE rn > 1;



-- ====================================================================
-- Checking 'cleaned.Customers'
-- ====================================================================
-- Check for NULLs or Duplicates in Primary Key in cleaned.Customers table
-- Expectation: No Results
SELECT *
FROM cleaned.Customers
WHERE CustomerID IN (
    SELECT CustomerID, COUNT(*)
    FROM cleaned.Customers
    GROUP BY CustomerID
    HAVING COUNT(*) > 1 OR CustomerID IS NULL
)
 -- Check for duplicate rows in the cleaned.Customers table
 -- Expectation: No Results
 WITH CustomerDuplicates AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY CustomerID, CustomerName
               ORDER BY (SELECT NULL)) AS rn
    FROM cleaned.Customers
)
SELECT *
FROM CustomerDuplicates
WHERE rn  > 1;



-- ====================================================================
-- Checking 'cleaned.Products'
-- ====================================================================
-- Check for NULLs or Duplicates in Primary Key in cleaned.Products table
-- Expectation: No Results
SELECT *
FROM cleaned.Products
WHERE ProductID IN (
    SELECT ProductID, COUNT(*)
    FROM cleaned.Products
    GROUP BY ProductID
    HAVING COUNT(*) > 1 OR ProductsID IS NULL
)
 -- Check for duplicate rows in the cleaned.Products table
 -- Expectation: No Results
 WITH ProductDuplicates AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY ProductID, ProductName
               ORDER BY (SELECT NULL)) AS rn
    FROM cleaned.Products
)
SELECT *
FROM ProductDuplicates
WHERE rn  > 1;


-- ====================================================================
-- Checking 'cleaned.StoreLocation'
-- ====================================================================
-- Check for NULLs or Duplicates in Primary Key in cleaned.StoreLocation table
-- Expectation: No Results
SELECT *
FROM cleaned.StoreLocation
WHERE StoreID IN (
    SELECT StoreID, COUNT(*)
    FROM cleaned.StoreLocation
    GROUP BY StoreID
    HAVING COUNT(*) > 1 OR StoreID IS NULL
)
 -- Check for duplicate rows in the cleaned.StoreLocation table
 -- Expectation: No Results
 WITH StoreDuplicates AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY StoreID, CityName,County,StateCode, State, Type,Latitude, Longitude,
               AreaCode, Population,HouseholdIncome,MedianIncome,LandArea,WaterArea,TimeZone
               ORDER BY (SELECT NULL)) AS rn
    FROM cleaned.StoreLocation
)
SELECT *
FROM StoreDuplicates
WHERE rn  > 1;


-- ====================================================================
-- Checking 'cleaned.SalesTeam'
-- ====================================================================
-- Check for NULLs or Duplicates in Primary Key in cleaned.SalesTeam table
-- Expectation: No Results
SELECT *
FROM cleaned.SalesTeam
WHERE SalesTeamID IN (
    SELECT SalesTeamID, COUNT(*)
    FROM cleaned.SalesTeam
    GROUP BY SalesTeamID
    HAVING COUNT(*) > 1 OR SalesTeamID IS NULL
)
 -- Check for duplicate rows in the cleaned.SalesTeam table
 -- Expectation: No Results
 WITH SalesTeamDuplicates AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY SalesTeamID, SalesTeamName, Region
               ORDER BY (SELECT NULL)) AS rn
    FROM cleaned.SalesTeam
)
SELECT *
FROM SalesTeamDuplicates
WHERE rn  > 1;