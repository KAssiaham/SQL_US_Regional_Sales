/*
===============================================================================
Stored Procedure: Load cleaned tables 
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'cleaned' schema from the original schema. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from original to cleaned tables.

===============================================================================
*/
CREATE OR ALTER PROCEDURE cleaned.LoadCleaned AS
BEGIN
	BEGIN TRY
		PRINT '-----------------------------------------------';
		PRINT 'Loading Cleaned Tables';
		PRINT '-----------------------------------------------';


		-- Loading cleaned.Orders
		TRUNCATE TABLE cleaned.Orders;
		PRINT '>> Inserting Data Into: cleaned.Orders';
		INSERT INTO cleaned.Orders (
			OrderID,
			SalesChannel,
			WarehouseCode,
			ProcuredDate,
			OrderDate,
			ShipDate,
			DeliveryDate,
			CurrencyCode,
			SalesTeamID,
			CustomerID,
			StoreID,
			ProductID,
			OrderQuantity,
			DiscountApplied,
			UnitPrice,
			UnitCost,
			DiscountedPrice,
			UnitProfit,
			Discount,
			Sales,
			Cost,
			Profit
		)
		SELECT
			TRIM(OrderNumber) AS OrderID,
			TRIM(SalesChannel)AS SalesChannel,
			TRIM(WarehouseCode) AS WarehouseCode,
			ProcuredDate,
			OrderDate,
			ShipDate,
			DeliveryDate,
			TRIM(CurrencyCode) AS CurrencyCode,
			TRIM(SalesTeamID) AS SalesTeamID,
			TRIM(CustomerID) AS CustomerID,
			TRIM(StoreID) AS StoreID,
			TRIM(ProductID) AS ProductID,
			OrderQuantity,
			DiscountApplied,
			UnitPrice,
			ROUND(UnitCost, 2) AS UnitCost,
			ROUND((UnitPrice * (1 - DiscountApplied)), 2) AS DiscountedPrice,
			ROUND(((UnitPrice * (1 - DiscountApplied)) - UnitCost), 2)  AS UnitProfit,
			ROUND(DiscountApplied * UnitPrice * OrderQuantity, 2) AS Discount,
			ROUND(((UnitPrice * (1 - DiscountApplied))* OrderQuantity), 2) AS Sales,
			ROUND((UnitCost * OrderQuantity),2)  AS Cost,
			ROUND(((UnitPrice * (1 - DiscountApplied))* OrderQuantity) - (UnitCost * OrderQuantity), 2) AS Profit
		FROM original.Orders;

		PRINT '--------------------------------------';	
		
		
		-- Loading cleaned.Customers
		TRUNCATE TABLE cleaned.Customers;
		PRINT '>> Inserting Data Into: cleaned.Customers';
		INSERT INTO cleaned.Customers (
			CustomerID,
			CustomerName 
		)
		SELECT
			TRIM(CustomerID) AS CustomerID,
			Replace(TRIM(CustomerName), '"', '') AS CustomerName
		FROM original.Customers;

		PRINT '--------------------------------------';


		-- Loading cleaned.Products
		TRUNCATE TABLE cleaned.Products;
		PRINT '>> Inserting Data Into: cleaned.Products';
		INSERT INTO cleaned.Products(
			ProductID,
			ProductName
		)
		SELECT
			TRIM(ProductID) AS ProductID,
			TRIM(ProductName) AS ProductName
		FROM original.Products;

		PRINT '--------------------------------------';

		-- Loading cleaned.StoreLocation
		TRUNCATE TABLE cleaned.StoreLocation;
		PRINT '>> Inserting Data Into: cleaned.StoreLocation';
		INSERT INTO cleaned.StoreLocation(
			StoreID,
			CityName,
			County,
			StateCode,
			State,
			Region,
			Type,
			Latitude,
			Longitude,
			AreaCode,
			Population,
			HouseholdIncome,
			MedianIncome,
			LandArea,
			WaterArea,
			TimeZone
		)
		SELECT
			TRIM(sl.StoreID) AS StoreID,
			TRIM(sl.CityName) AS CityName,
			TRIM(sl.County) AS County,
			TRIM(sl.StateCode) AS StateCode,
			TRIM(sl.State) AS State,
			r.region AS Region,
			TRIM(sl.Type),
			sl.Latitude AS Latitude,
			sl.Longitude AS Longitude,
			sl.AreaCode AS AreaCode,
			sl.Population AS Population,
			sl.HouseholdIncome AS HouseholdIncome,
			sl.MedianIncome AS MedianIncome,
			sl.LandArea AS LandArea,
			sl.WaterArea AS WaterArea,
			TRIM(sl.TimeZone) AS TimeZone
		FROM original.StoreLocation AS sl
		LEFT JOIN original.Regions AS r
		ON sl.StateCode = r.StateCode ;
		
		PRINT '--------------------------------------';


		-- Loading cleaned.SalesTeam
		TRUNCATE TABLE cleaned.SalesTeam;
		PRINT '>> Inserting Data Into: cleaned.SalesTeam';
		INSERT INTO cleaned.SalesTeam(
			SalesTeamID,
			SalesTeamName,
			Region
		)
		SELECT
			TRIM(SalesTeamID) AS SalesTeamID,
			TRIM(SalesTeamName) AS SalesTeamName,
			TRIM(Region) AS Region
		FROM original.SalesTeam;
		
		PRINT '--------------------------------------';
	END TRY 

	BEGIN CATCH
		PRINT  '-----------------------------------------------'
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT  '-----------------------------------------------'
	END CATCH
END

-- Execute LoadCleaned procedure
  EXEC cleaned.LoadCleaned;
