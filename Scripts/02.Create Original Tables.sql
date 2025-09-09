/*
------------------------------------------------------------------------------
DDL Script: Create Original Tables
------------------------------------------------------------------------------
Script Purpose:
    This script creates tables in the 'original' schema, dropping existing tables 
    if they already exist.
	Run this script to redefine the DDL structure of 'original' Tables
------------------------------------------------------------------------------
*/

IF OBJECT_ID('original.Orders', 'U') IS NOT NULL
    DROP TABLE original.Orders;
GO

CREATE TABLE original.Orders (
    OrderNumber     NVARCHAR(50),
    SalesChannel    NVARCHAR(50),
    WarehouseCode   NVARCHAR(50),
    ProcuredDate    DATE,
    OrderDate       DATE,
    ShipDate        DATE,
    DeliveryDate    DATE,
    CurrencyCode    NVARCHAR(20),
    SalesTeamID     NVARCHAR(20),
    CustomerID      NVARCHAR(20),
    StoreID         NVARCHAR(20),
    ProductID       NVARCHAR(20),
    OrderQuantity   INT,
    DiscountApplied FLOAT,
    UnitPrice       FLOAT,
    UnitCost        FLOAT
);
GO

IF OBJECT_ID('original.Customers', 'U') IS NOT NULL
    DROP TABLE original.Customers;
GO

CREATE TABLE original.Customers (
    CustomerID      NVARCHAR(20),
    CustomerName    NVARCHAR(50)
);
GO

IF OBJECT_ID('original.Products', 'U') IS NOT NULL
    DROP TABLE original.Products;
GO

CREATE TABLE original.Products (
    ProductID       NVARCHAR(20),
    ProductName     NVARCHAR(50)
);
GO

IF OBJECT_ID('original.StoreLocation', 'U') IS NOT NULL
    DROP TABLE original.StoreLocation;
GO

CREATE TABLE original.StoreLocation (
    StoreID         NVARCHAR(20),
    CityName        NVARCHAR(50),
    County          NVARCHAR(100),
    StateCode       NVARCHAR(20),
    State           NVARCHAR (25),
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

IF OBJECT_ID('original.SalesTeam', 'U') IS NOT NULL
    DROP TABLE original.SalesTeam;
GO

CREATE TABLE original.SalesTeam (
    SalesTeamID     NVARCHAR(20),
    SalesTeamName   NVARCHAR(50),
    Region          NVARCHAR(50)
);
GO


IF OBJECT_ID('original.Regions', 'U') IS NOT NULL
    DROP TABLE original.Regions;
GO
CREATE TABLE original.Regions (
    StateCode       NVARCHAR(20),
    State           NVARCHAR (25),
    Region          NVARCHAR (50)
);
GO

