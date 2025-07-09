Exec bronze.load_bronze
Create or Alter procedure bronze.load_bronze AS
Begin
    Declare @start_time Datetime,@end_time Datetime,@batch_start_time Datetime,@batch_end_time Datetime;
    Begin TRY
    print '=============================================================';
    print'Loading Bronze Layer';
    print '=============================================================';

    print'---------------------------------------------------------------';
    print'Loading Crm Tables';
    print'---------------------------------------------------------------';

    set @start_time =GETDATE();
    print'Truncate Table :bronze.crm_cust_info';
    Truncate Table bronze.crm_cust_info;
    print'Insert Data Into: bronze.crm_cust_info';
    Bulk insert bronze.crm_cust_info
     from 'E:\DATA-WAREHOUSE PROJECT\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
     With(
     FirstRow = 2,
     fieldterminator = ',',
     Tablock
     );
     set @end_time =GETDATE();
     print '>>Load Duration' + CAST(Datediff(second,@start_time,@end_time)AS nvarchar) + 'seconds';
     print'---------------------------';

     set @start_time =GETDATE();
     print'Truncate Table :bronze.crm_prd_info';
     Truncate Table bronze.crm_prd_info;
     print'Insert Data Into: bronze.crm_prd_info';
     Bulk insert bronze.crm_prd_info
     from 'E:\DATA-WAREHOUSE PROJECT\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
     With(
     FirstRow = 2,
     fieldterminator = ',',
     Tablock
     );
     set @end_time =GETDATE();
     print '>>Load Duration' + CAST(Datediff(second,@start_time,@end_time)AS nvarchar) + 'seconds';
     print'---------------------------';

     set @start_time =GETDATE();
     print'Truncate Table :bronze.crm_sls_info';
     Truncate Table bronze.crm_sls_info;
     print'Insert Data Into: bronze.crm_sls_info';
     Bulk insert bronze.crm_sls_info
     from 'E:\DATA-WAREHOUSE PROJECT\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
     With(
     FirstRow = 2,
     fieldterminator = ',',
     Tablock
     );
     set @end_time =GETDATE();
     print '>>Load Duration' + CAST(Datediff(second,@start_time,@end_time)AS nvarchar) + 'seconds';
     print'---------------------------';

    print'---------------------------------------------------------------';
    print'Loading Erp Tables';
    print'---------------------------------------------------------------';

     set @start_time =GETDATE();
    print'Truncate Table :bronze.erp_cust_az12';
      Truncate Table bronze.erp_cust_az12;
      print'Insert Data Into: bronze.erp_cust_az12';
    Bulk insert bronze.erp_cust_az12
     from 'E:\DATA-WAREHOUSE PROJECT\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
     With(
     FirstRow = 2,
     fieldterminator = ',',
     Tablock
     );
     set @end_time =GETDATE();
     print '>>Load Duration' + CAST(Datediff(second,@start_time,@end_time)AS nvarchar) + 'seconds';
     print'---------------------------';

      set @start_time =GETDATE();
     print'Truncate Table :bronze.erp_loc_a101';
       Truncate Table bronze.erp_loc_a101;
       print'Insert Data Into: bronze.erp_loc_a101';
    Bulk insert bronze.erp_loc_a101
     from 'E:\DATA-WAREHOUSE PROJECT\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
     With(
     FirstRow = 2,
     fieldterminator = ',',
     Tablock
     );
     set @end_time =GETDATE();
     print '>>Load Duration' + CAST(Datediff(second,@start_time,@end_time)AS nvarchar) + 'seconds';
     print'---------------------------';

    set @start_time =GETDATE();
    print'Truncate Table :bronze.erp_px_cat_g1v2';
    Truncate Table bronze.erp_px_cat_g1v2;
    print'Insert Data Into: bronze.erp_px_cat_g1v2';
    Bulk insert bronze.erp_px_cat_g1v2
      from 'E:\DATA-WAREHOUSE PROJECT\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
        With(
        FirstRow = 2,
        fieldterminator = ',',
        Tablock
     );
     set @end_time =GETDATE();
     print '>>Load Duration' + CAST(Datediff(second,@start_time,@end_time)AS nvarchar) + 'seconds';
     print'---------------------------';
     
     
     set @batch_end_time =GETDATE();
     print '>>Total Load Duration' + CAST(Datediff(second,@batch_start_time,@batch_end_time)AS nvarchar) + 'seconds';
     print'---------------------------';
     
     
     
     END TRY 




     Begin catch
     Print '===============================================================';
     Print 'Error occured During loading Bronze Layer';
     Print 'Error Message'+ Error_Message();
     Print 'Error Message'+ CAST(Error_Number() as nvarchar);
     Print 'Error Message'+ CAST(Error_State() as nvarchar);
     Print '===============================================================';
     End catch
 END
  
