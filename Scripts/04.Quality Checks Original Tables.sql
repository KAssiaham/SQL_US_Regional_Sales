/*
===============================================================================
Quality Checks - original tables
===============================================================================
Script Purpose:
    This script performs various quality checks for data consistency, accuracy, 
    and standardization across the 'original' tables. It includes checks for:
    - Null or duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data standardization and consistency.
    - Invalid date ranges and orders.
    - Data consistency between related fields.

Usage Notes:
    - Run these checks before data loading cleaned tables.
    - Investigate and resolve any discrepancies found during the checks.
===============================================================================
*/
-- ====================================================================
-- Checking 'original.Orders'
-- ====================================================================
-- Check for NULLs or Duplicates in Primary Key in original.Orders table
SELECT *
FROM original.Orders
WHERE OrderNumber IN (
    SELECT OrderNumber
    FROM original.Orders
    GROUP BY OrderNumber
    HAVING COUNT(*) > 1
)

-- Check for invalid date in original.Orders table
SELECT ProcuredDate  FROM original.Orders
WHERE ProcuredDate IS NULL
    OR ProcuredDate < '1900-01-01'
    OR ProcuredDate > CAST(GETDATE() AS DATE)
    OR DATEDIFF(YEAR, ProcuredDate, GETDATE()) NOT BETWEEN 3 AND 120;

SELECT OrderDate  FROM original.Orders
WHERE OrderDate IS NULL
    OR OrderDate < '1900-01-01'
    OR OrderDate > CAST(GETDATE() AS DATE)
    OR DATEDIFF(YEAR, OrderDate, GETDATE()) NOT BETWEEN 3 AND 120;

SELECT ShipDate  FROM original.Orders
WHERE ShipDate IS NULL
    OR ShipDate < '1900-01-01'
    OR ShipDate > CAST(GETDATE() AS DATE)
    OR DATEDIFF(YEAR, ShipDate, GETDATE()) NOT BETWEEN 3 AND 120;


SELECT DeliveryDate  FROM original.Orders
WHERE DeliveryDate IS NULL
    OR DeliveryDate < '1900-01-01'
    OR DeliveryDate > CAST(GETDATE() AS DATE)
    OR DATEDIFF(YEAR, DeliveryDate, GETDATE()) NOT BETWEEN 3 AND 120;

-- Check for duplicate rows in the original.Orders table
 WITH OrdertDuplicates AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY OrderNumber, SalesChannel,WarehouseCode, ProcuredDate, OrderDate, ShipDate, 
               DeliveryDate, CurrencyCode, SalesTeamID, CustomerID, StoreID, ProductID, OrderQuantity,
               DiscountApplied, UnitPrice, UnitCost
               ORDER BY (SELECT NULL)
           ) AS rn
    FROM original.Orders
)
SELECT *
FROM OrdertDuplicates
WHERE rn > 1;


-- ====================================================================
-- Checking 'original.Customers'
-- ====================================================================
-- Check for NULLs or Duplicates in Primary Key in original.Customers table
SELECT *
FROM original.Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM original.Customers
    GROUP BY CustomerID
    HAVING COUNT(*) > 1
)
 -- Check for duplicate rows in the original.Customers table
 WITH CustomerDuplicates AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY CustomerID, CustomerName
               ORDER BY (SELECT NULL)) AS rn
    FROM original.Customers
)
SELECT *
FROM CustomerDuplicates
WHERE rn  > 1;



-- ====================================================================
-- Checking 'original.Products'
-- ====================================================================
-- Check for NULLs or Duplicates in Primary Key in original.Products table
SELECT *
FROM original.Products
WHERE ProductID IN (
    SELECT ProductID
    FROM original.Products
    GROUP BY ProductID
    HAVING COUNT(*) > 1
)
 -- Check for duplicate rows in the original.Products table
 WITH ProductDuplicates AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY ProductID, ProductName
               ORDER BY (SELECT NULL)) AS rn
    FROM original.Products
)
SELECT *
FROM ProductDuplicates
WHERE rn  > 1;


-- ====================================================================
-- Checking 'original.StoreLocation'
-- ====================================================================
-- Check for NULLs or Duplicates in Primary Key in original.StoreLocation table
SELECT *
FROM original.StoreLocation
WHERE StoreID IN (
    SELECT StoreID
    FROM original.StoreLocation
    GROUP BY StoreID
    HAVING COUNT(*) > 1
)
 -- Check for duplicate rows in the original.StoreLocation table
 WITH StoreDuplicates AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY StoreID, CityName,County,StateCode, State, Type,Latitude, Longitude,
               AreaCode, Population,HouseholdIncome,MedianIncome,LandArea,WaterArea,TimeZone
               ORDER BY (SELECT NULL)) AS rn
    FROM original.StoreLocation
)
SELECT *
FROM StoreDuplicates
WHERE rn  > 1;


-- ====================================================================
-- Checking 'original.SalesTeam'
-- ====================================================================
-- Check for NULLs or Duplicates in Primary Key in original.SalesTeam table
SELECT *
FROM original.SalesTeam
WHERE SalesTeamID IN (
    SELECT SalesTeamID
    FROM original.SalesTeam
    GROUP BY SalesTeamID
    HAVING COUNT(*) > 1
)
 -- Check for duplicate rows in the original.SalesTeam table
 WITH SalesTeamDuplicates AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY SalesTeamID, SalesTeamName, Region
               ORDER BY (SELECT NULL)) AS rn
    FROM original.SalesTeam
)
SELECT *
FROM SalesTeamDuplicates
WHERE rn  > 1;


-- ====================================================================
-- Checking 'original.Regions'
-- ====================================================================
-- Check for NULLs or Duplicates in Primary Key in original.Regions table
SELECT *
FROM original.Regions
WHERE StateCode IN (
    SELECT StateCode
    FROM original.Regions
    GROUP BY StateCode
    HAVING COUNT(*) > 1
)
 -- Check for duplicate rows in the original.Regions table
 WITH StoreDuplicates AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY StateCode, State, Region
               ORDER BY (SELECT NULL)) AS rn
    FROM original.Regions
)
SELECT *
FROM StoreDuplicates
WHERE rn  > 1;