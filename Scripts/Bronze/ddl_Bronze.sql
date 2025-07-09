IF Object_id ('bronze.crm_cust_info','U') IS NOT NULL 
 Drop Table bronze.crm_cust_info;

 GO

Create Table bronze.crm_cust_info(
 cst_id int,
 cst_key nvarchar(50),
 cst_firstname nvarchar(50),
 cst_lastname nvarchar(50),
 cst_material_status nvarchar(50),
 cst_gndr nvarchar(50),
 cst_create_date DATE
);
Go

IF Object_id ('bronze.crm_prd_info','U') IS NOT NULL 
 Drop Table bronze.crm_prd_info;

 GO

Create Table bronze.crm_prd_info(
 prd_id int,
 prd_key nvarchar(50),
 prd_nm nvarchar(50),
 prd_cost INT,
 prd_line nvarchar(50),
 prd_start_dt DATE,
 prd_end_dt DATE
);

GO

IF Object_id ('bronze.crm_sls_info','U') IS NOT NULL 
 Drop Table bronze.crm_sls_info;

 GO

Create Table bronze.crm_sls_info(
 sls_ord_num nvarchar(50),
 sls_prd_key nvarchar(50),
 sls_cust_id INT,
 sls_order_dt INT,
 sls_ship_dt INT,
 sls_due_dt INT,
 sls_sales INT,
 sls_quantity INT,
 sls_price INT
);

GO

IF Object_id ('bronze.erp_loc_a101','U') IS NOT NULL 
 Drop Table bronze.erp_loc_a101;
Create Table bronze.erp_loc_a101(
 
  cid nvarchar(50),
  cntry nvarchar(50)
);

GO

IF Object_id ('bronze.erp_cust_az12','U') IS NOT NULL 
 Drop Table bronze.erp_cust_az12;
Create Table bronze.erp_cust_az12(
 
  cid nvarchar(50),
  bdate Date,
  gen nvarchar(50)
);

GO

IF Object_id ('bronze.erp_px_cat_g1v2','U') IS NOT NULL 
 Drop Table bronze.erp_px_cat_g1v2;

 GO

Create Table bronze.erp_px_cat_g1v2 (
 id nvarchar(50),
 cat nvarchar(50),
 subcat nvarchar(50),
 maintenance nvarchar(50)
);
GO
