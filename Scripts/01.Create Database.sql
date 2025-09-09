/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'USRegionalSales' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up two schemas 
    within the database: 'original', and 'cleaned'.
	
WARNING:
    Running this script will drop the entire 'USRegionalSales' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/

USE master;
GO

-- Drop the 'USRegionalSales' database if it exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'USRegionalSales')
BEGIN
    ALTER DATABASE USRegionalSales SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE USRegionalSales;
END;
GO

-- Create the 'USRegionalSales' database
CREATE DATABASE USRegionalSales;
GO

 USE USRegionalSales;
GO

-- Create Schemas
CREATE SCHEMA original;
GO

CREATE SCHEMA cleaned;
GO
