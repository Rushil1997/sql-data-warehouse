/* 
Purpose:
	This script will create the tables for the Bronze layer.
	A total of six tables will be created.
	There are three tables for crm.
	There are three tables for erp.
	This script will drop the tables if they alcready exsist.


NOTE:
	All datatype used to create the tables are based on the records from the relavent CSV files. 
*/




-- Create the crm customer informstion table.
-- cst = customer

-- Checking if table exsists. If the table exists, the table is dropped.
IF OBJECT_ID('bronze.crm_cst_info', 'U') IS NOT NULL
	DROP TABLE	bronze.crm_cst_info;

CREATE TABLE bronze.crm_cst_info(
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_marital_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE
);

GO
-- Create crm product information table.
-- prd =product

-- Checking if table exsists. If the table exists, the table is dropped.
IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
	DROP TABLE bronze.crm_cst_info;

CREATE TABLE bronze.crm_prd_info(
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost INT,
	prd_line NVARCHAR(50),
	prd_start_dt DATETIME,
	prd_end_dt DATETIME

);

GO 
-- Create crm sales details table.
-- sls = Sales 
-- ord = Order
-- num = number
-- cust = customer
-- prd = Product

-- Checking if table exsists. If the table exists, the table is dropped.
IF OBJECT_id('bronze.crm_sales_details','U') IS NOT NULL
	DROP TABLE bronze.crm_sales_details;

CREATE TABLE bronze.crm_sales_details(
	sls_ord_num NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order INT,
	sls_ship_dt INT,
	SLS_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
);

GO 
-- Create erp cust_az12 table.
-- bdate = Birth date 
-- gen = Gender

-- Checking if table exsists. If the table exists, the table is dropped.
IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL 
	DROP TABLE bronze.erp_cust_az12;

-- Checking if table exsists. If the table exists, the table is dropped.
CREATE TABLE bronze.erp_cust_az12(
	cid NVARCHAR(50),
	bdate DATE,
	gen NVARCHAR(50)
);

GO 
-- Create erp loc_a101 table.

-- Checking if table exsists. If the table exists, the table is dropped.
IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
	DROP TABLE bronze.erp_loc_a101;


CREATE TABLE bronze.erp_loc_a101(
	cid NVARCHAR(50),
	cntry VARCHAR(50)
);

GO 
--  Create erp px_cat_g v2 table.

-- Checking if table exsists. If the table exists, the table is dropped.
IF OBJECT_ID('bronze.erp_px_cat_g1v2','U') IS NOT NULL
	DROP TABLE bronze.erp_px_cat_g1v2;

CREATE TABLE bronze.erp_px_cat_g1v2(
id NVARCHAR(50),
cat NVARCHAR(50),
subcat NVARCHAR(50),
maintenance NVARCHAR(50)
);
