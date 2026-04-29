/*
========================================================================
  create database and schemas
========================================================================
script purpose 
this script create a new database name data warehouse after chacking if it already exists.
if the database exists it is dropped and recreate additionally the scripts
sets up threee schemas within the database  bronze , silver and gold.

warning 
running this cripts will drop the entire datawarehousedatabase if it exists.
all data in the database will be permanently deleted .proced with caution
and ensure yu have proper backups before running this script.
*/
---create dataset Datawarehouse 
USE master;
GO 

---drop and recreate the data warehouse database
IF EXISTS(SELECT 1 FROM sys.databases WHERE name ='DataWarehouse ')
BEGIN 
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

CREATE DATABASE DataWarehouse;

USE DataWarehouse; 
GO
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO 
CREATE SCHEMA gold;
GO
