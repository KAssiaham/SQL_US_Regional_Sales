/*
===============================================================================
Stored Procedure: Load original tables 
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'original' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

===============================================================================
*/
CREATE OR ALTER PROCEDURE original.LoadOriginal AS
BEGIN
	BEGIN TRY
		PRINT '-----------------------------------------------';
		PRINT 'Loading Original Tables';
		PRINT '-----------------------------------------------';

		-- Loading original.Orders
		TRUNCATE TABLE original.Orders;
		PRINT '>> Inserting Data Into: original.Orders';
		BULK INSERT original.Orders
		FROM 'C:\Users\gfide\Documents\my_projects\my_sql_projects\US_Regional_Sales_Data\Orders.csv' 
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		PRINT '--------------------------------------';
	
		-- Loading original.Customers
		TRUNCATE TABLE original.Customers;
		PRINT '>> Inserting Data Into: original.Customers';
		BULK INSERT original.Customers
		FROM 'C:\Users\gfide\Documents\my_projects\my_sql_projects\US_Regional_Sales_Data\Customers.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		PRINT '--------------------------------------';

		-- Loading original.Products
		TRUNCATE TABLE original.Products;
		PRINT '>> Inserting Data Into: original.Products';
		BULK INSERT original.Products
		FROM 'C:\Users\gfide\Documents\my_projects\my_sql_projects\US_Regional_Sales_Data\Products.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		PRINT '--------------------------------------';

		-- Loading original.StoreLocation
		TRUNCATE TABLE original.StoreLocation;
		PRINT '>> Inserting Data Into: original.StoreLocation';
		BULK INSERT original.StoreLocation
		FROM 'C:\Users\gfide\Documents\my_projects\my_sql_projects\US_Regional_Sales_Data\StoreLocation.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		PRINT '--------------------------------------';

		-- Loading original.SalesTeam
		TRUNCATE TABLE original.SalesTeam;
		PRINT '>> Inserting Data Into: original.SalesTeam';
		BULK INSERT original.SalesTeam
		FROM 'C:\Users\gfide\Documents\my_projects\my_sql_projects\US_Regional_Sales_Data\SalesTeam.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		PRINT '--------------------------------------';

		-- Loading original.Regions
		TRUNCATE TABLE original.Regions;
		PRINT '>> Inserting Data Into: original.Regions';
		BULK INSERT original.Regions
		FROM 'C:\Users\gfide\Documents\my_projects\my_sql_projects\US_Regional_Sales_Data\Regions.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
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

-- Execute LoadOriginal procedure
  EXEC original.LoadOriginal;