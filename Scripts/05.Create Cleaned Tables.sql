/*
------------------------------------------------------------------------------
DDL Script: Create Cleaned Tables
------------------------------------------------------------------------------
Script Purpose:
    This script creates tables in the 'cleaned' schema, dropping existing tables 
    if they already exist.
	Run this script to redefine the DDL structure of 'original' Tables
------------------------------------------------------------------------------
*/

IF OBJECT_ID('cleaned.Orders', 'U') IS NOT NULL
    DROP TABLE cleaned.Orders;
GO

CREATE TABLE cleaned.Orders (
    OrderID         NVARCHAR(20),
    SalesChannel    NVARCHAR(20),
    WarehouseCode   NVARCHAR(20),
    ProcuredDate    DATE,
    OrderDate       DATE,
    ShipDate        DATE,
    DeliveryDate    DATE,
    CurrencyCode    CHAR(3),
    SalesTeamID     NVARCHAR(20),
    CustomerID      NVARCHAR(20),
    StoreID         NVARCHAR(20),
    ProductID       NVARCHAR(20),
    OrderQuantity   INT,
    DiscountApplied FLOAT,
    UnitPrice       FLOAT,
    UnitCost        FLOAT,
    DiscountedPrice FLOAT,
    UnitProfit      FLOAT,
    Discount        FLOAT,
	Sales           FLOAT,
	Cost       FLOAT,
	Profit     FLOAT,
);
GO

IF OBJECT_ID('cleaned.Customers', 'U') IS NOT NULL
    DROP TABLE cleaned.Customers;
GO

CREATE TABLE cleaned.Customers (
    CustomerID      NVARCHAR(20),
    CustomerName    NVARCHAR(50)
);
GO

IF OBJECT_ID('cleaned.Products', 'U') IS NOT NULL
    DROP TABLE cleaned.Products;
GO

CREATE TABLE cleaned.Products (
    ProductID       NVARCHAR(20),
    ProductName     NVARCHAR(50)
);
GO

IF OBJECT_ID('cleaned.StoreLocation', 'U') IS NOT NULL
    DROP TABLE cleaned.StoreLocation;
GO

CREATE TABLE cleaned.StoreLocation (
    StoreID         NVARCHAR(20),
    CityName        NVARCHAR(50),
    County          NVARCHAR(100),
    StateCode       NVARCHAR(20),
    State           NVARCHAR (25),
    Region          NVARCHAR (50),
    Type            NVARCHAR (50),
    Latitude        FLOAT,
    Longitude       FLOAT,
    AreaCode        INT,
    Population      INT,
    HouseholdIncome INT,
    MedianIncome    INT,
    LandArea        INT,
    WaterArea       INT,
    TimeZone        NVARCHAR (50)
);
GO

IF OBJECT_ID('cleaned.SalesTeam', 'U') IS NOT NULL
    DROP TABLE cleaned.SalesTeam;
GO

CREATE TABLE cleaned.SalesTeam (
    SalesTeamID     NVARCHAR(20),
    SalesTeamName   NVARCHAR(50),
    Region          NVARCHAR(50)
);
GO
