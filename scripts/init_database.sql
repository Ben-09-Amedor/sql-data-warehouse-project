/*
=====================================================================
Create Database  and Schemas 
=====================================================================

Script Purpose:
This scripts create a database named "Datawarehouse. It has three schemas; bronze, silver and gold.
It checks if the database already exists. If it exists, it drops and recreate.


Warning: 
Running this scripts will  drop 'datawarehouse and permanently delete all data in the database.
Proceed with caution and ensure you data is backed up before running this scripts.

*/

USE master;
GO

-- Drop and Create database, 'DataWarehouse'
IF EXISTS ( SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN 
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;

END;
GO

CREATE DATABASE DataWarehouse;

USE DataWarehouse;


-- Create Schema

CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
