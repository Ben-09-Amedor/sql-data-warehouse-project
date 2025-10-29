/*
====================================================================================
        Qualilty checks
====================================================================================
Script Purpose:
This scripts performs quality check, data intergrity, consistency, and
accuracy of the gold layer . This check;
    - uniqueness of the surrogate Keys in the dimension tables
    - Referential intergrity between fact and dimension table
    - validation of data for analyitical purpose


  Usage Note:
    - Running these check after running the gold layer
    - investigate and resolve any descripancies found during these checks
=======================================================================================

*/



-- ========================================================
-- Checking gold.dim_customers
-- =========================================================

SELECT cst_id,
COUNT(*)
FROM(
SELECT 
	ci.cst_id,
	ci.cst_key,
	ci.cst_firstname,
	ci.cst_lastname,
	ci.cst_marital_status,
	ci.cst_gndr,
	ci.cst_create_date,
	ca.bdate,
	ca.gen,
	la.cntry
FROM silver.crm_cust_info ci
LEFT JOIN silver.erp_cust_az12 ca
ON		  ci.cst_key = ca.cid
LEFT JOIN silver.erp_loc_a101 la
ON		  ci.cst_key = la.cid

)t
GROUP BY cst_id 
HAVING COUNT(*) > 1

-- checking gold.dim_customers
SELECT*  FROM gold.dim_customers

-- ========================================================
-- Checking gold.dim_products
-- =========================================================


SELECT 
prd_id, COUNT(*)
FROM(
SELECT 
    pn.prd_id,
    pn.cat_id,
    pn.prd_key,
    pn.prd_nm,
    pn.prd_cost,
    pn.prd_line,
    pn.prd_start_dt,
    pc.id,
    pc.cat,
    pc.subcat,
    pc.maintenance
  FROM silver.crm_prd_info pn
  LEFT JOIN silver.erp_px_cat_g1v2 pc
  ON        pn.cat_id = pc.id
  WHERE prd_end_dt IS NULL )t -- filter out historical data
  GROUP BY prd_id
  HAVING COUNT(*) > 1


  SELECT*  FROM gold.dim_products

 

  -- ====================================================================================
  -- Foreign Key intergretity (Dimension)
  -- ================================================================================
  SELECT * 
  FROM gold.fact_sales f
  LEFT JOIN gold.dim_customers c
        ON c.customer_key = f.customer_key
  LEFT JOIN gold.dim_products p
       ON p.product_key = f.product_key
    WHERE c.customer_key IS NULL

  SELECT * FROM gold.fact_sales
