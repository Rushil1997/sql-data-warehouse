CREATE OR ALTER PROCEDURE bronze.load_bronze AS
DECLARE @start_process DATETIME,@end_process DATETIME

SET @start_process = GETDATE();
BEGIN
	DECLARE @start_time DATETIME,@end_time DATETIME;
	BEGIN TRY 
		PRINT'================================================';
		PRINT 'Loading Bronze Layer';
		PRINT'================================================';

		PRINT'================================================';
		PRINT 'Loading CRM Tables'
		PRINT'================================================';

		SET @start_time = GETDATE();
		PRINT '>>>Truncating Table:bronze.crm_cst_info';
		TRUNCATE TABLE bronze.crm_cst_info
		PRINT '>>>Inserting into Table: bronze.crm_cst_info';
		BULK INSERT bronze.crm_cst_info
		FROM 'INSERT CSV FILE PATH HERE '

		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> load Duration:' + CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR) + 'seconds';
		PRINT '----------------------------------------------------------'

		SET @start_time = GETDATE();
		PRINT '>>>Truncating Table: bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info
		PRINT '>>>Inserting into Table: bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'INSERT CSV FILE PATH HERE '

		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration:' + CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR) +'seconds';
		PRINT '----------------------------------------------------------'
		SET @start_time = GETDATE();
		PRINT '>>>Truncating Table: bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details
		PRINT '>>>Inserting into Table: bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'INSERT CSV FILE PATH HERE '

		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration:'+ CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR) + 'seconds';
		PRINT'================================================';
		PRINT 'Loading ERP Tables';
		PRINT'================================================';

		SET @start_time = GETDATE();
		PRINT '>>>Truncating Table:bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12
		PRINT '>>>Inserting into Table: bronze.erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM 'INSERT CSV FILE PATH HERE '
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ','

		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration:'+ CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR) + 'seconds';
		PRINT '----------------------------------------------------------'
		SET @start_time = GETDATE();
		PRINT '>>>Truncating Table: bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101
		PRINT '>>>Inserting into Table: bronze.erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
		FROM 'INSERT CSV FILE PATH HERE '

		WITH(

			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK

		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration:'+ CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR) + 'seconds';
		PRINT '----------------------------------------------------------'
		SET @start_time = GETDATE();
		PRINT '>>>Truncating Table: erp_px_cat_g1v2';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2
		PRINT '>>>Inserting into Table: erp_px_cat_g1v2';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'INSERT CSV FILE PATH HERE '

		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK

		);
		PRINT 'Load Duration:'+ CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR) + 'seconds';
		PRINT '----------------------------------------------------------'
	END TRY 
	BEGIN CATCH 
		PRINT '============================================================';
		PRINT 'EEROR OCCURED DURING LOADING BRONZE LAYER';
		PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
		PRINT 'ERROR MESSAGE' +  CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'ERROR MESSAGE' +  CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '============================================================';
		END CATCH 
END
SET @end_process = GETDATE()
PRINT 'Process Duration: '+ CAST(DATEDIFF(second,@start_process,@end_process)AS NVARCHAR) + 'seconds';
