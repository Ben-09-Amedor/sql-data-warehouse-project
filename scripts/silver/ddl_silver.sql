/*
===================================================================================
DDL Scripts: Create silver Table
===================================================================================
Script Purpose:
This script creates silver Table. It will drop existing table if they already exist
Run this scripts to re-define the DDL structure of 'silver' Table

====================================================================================

*/


-- Create table for customer info
IF OBJECT_ID ('silver.crm_cust_info', 'U') IS NOT NULL
	DROP TABLE silver.crm_cust_info
CREATE TABLE silver.crm_cust_info (
	cst_id INT,
	cst_key NVARCHAR(50), 
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_marital_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE,
	dwh_create_date DATETIME2 DEFAULT GETDATE()

);


-- create Table for product info
IF OBJECT_ID ('silver.crm_prd_info', 'U') IS NOT NULL
	DROP TABLE silver.crm_prd_info

CREATE TABLE silver.crm_prd_info(
	prd_id INT,
	cat_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost INT, 
	prd_line NVARCHAR(50),
	prd_start_dt DATE,
	Prd_end_dt DATE,
	dwh_create_date DATETIME2 DEFAULT GETDATE()

);


-- Create Table for Sale Details
IF OBJECT_ID ('silver.crm_sale_details', 'U') IS NOT NULL
	DROP TABLE silver.crm_sales_details

CREATE TABLE silver.crm_sales_details(
	sls_ord_num NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt DATE,
	sls_ship_dt DATE,
	sls_due_dt DATE,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT,
	dwh_create_date DATETIME2 DEFAULT GETDATE()

);


-- Create Table for Customer 
IF OBJECT_ID ('silver.erp_cust_az12', 'U') IS NOT NULL
	DROP TABLE silver.erp_cust_az12

CREATE TABLE silver.erp_cust_az12 (
	CID NVARCHAR(50),
	BDATE DATE,
	GEN NVARCHAR(50),
	dwh_create_date DATETIME2 DEFAULT GETDATE()

);



-- Create Table for Customer Location
IF OBJECT_ID ('silver.erp_loc_a101', 'U') IS NOT NULL
	DROP TABLE silver.erp_loc_a101

CREATE TABLE silver.erp_loc_a101(
	CID NVARCHAR(50),
	CNTRY NVARCHAR(50),
	dwh_create_date DATETIME2 DEFAULT GETDATE()

);


-- Create Table for Product Categories
IF OBJECT_ID ('silver.erp_px_cat_g1V2', 'U') IS NOT NULL
	DROP TABLE silver.erp_px_cat_g1V2

CREATE TABLE silver.erp_px_cat_g1V2 (
	ID NVARCHAR(50),
	CAT VARCHAR(50),
	SUBCAT VARCHAR(50),
	MAINTENANCE NVARCHAR(50),
	dwh_create_date DATETIME2 DEFAULT GETDATE()

);
