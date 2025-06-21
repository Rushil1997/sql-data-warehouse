/* 
Purpose:
	This script will create the database called DataWarehouse and the schemas.
	This script will create three schems 'broze', 'silver' and 'gold'.

Warning:
	    Running this script will drop the entire 'DataWarehouse' database if it exists. 
		All data in the database will be permanently deleted. Proceed with caution 
		and ensure you have proper backups before running this script.

*/
-- Ensure you are creating the database in the master database.
USE master;
GO

IF EXISTS (SELECT 1 FROM sys.databases WHERE name ='DataWarehouse')
BEGIN 
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		DROP DATABASE DataWarehouse;
END;
GO
-- Create the Database

CREATE DATABASE DataWarehouse;

-- Now that you have create the database. You will create the schemas in the DataWarehouse
USE DataWarehouse;

-- Create the schemas
GO
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
