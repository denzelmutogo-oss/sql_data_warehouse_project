/* 

===============================================================================
Quality Checks 
===============================================================================

Script Purpose:

	This script performs various quality checks for data consistency, accuracy,
	and standadization across the 'silver' schemas. It includes checks for: 
	- Null or duplicate primary keys.
	- Unwanted spaces in string fields.
	- Data standardization and consistency.
	- Invalid date ranges and orders 
	- Data consistency between related fields.

Usage Notes:
	
	- Run these checks after data loading Silver Layer.
	- Investigate and resolve any discrepancies found duirng the checks.

==================================================================================
*/


--=================================================================
--Checking 'silver.crm_cust_info'
--=================================================================
--Check for NULLs or duplicates in Primary Key 
--Expctation: No Results 
SELECT 
	cst_id,
	COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id 
HAVING COUNT(*) > 1 OR cst_id IS NULL

--Check for unwanted spaces
--Expectectation: No Results
SELECT cst_key
FROM silver.crm_cust_info
WHERE cst_key != TRIM(cst_key)

--Data Standadization & Consistency
SELECT DISTINCT cst_marital_status
FROM silver.crm_prd_info

--=================================================================
--Checking 'silver.crm_cust_info'
--=================================================================
--Check for NULLs or duplicates in Primary Key 
--Expctation: No Results 
SELECT 
	prd_id,
	COUNT(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL

--Check for unwanted spaces
--Expectectation: No Results
SELECT prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm)

--Check for NULLs or Negative Numbers 
--Expectation: No Results 
SELECT prd_cost
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL

--Data Standadization & Consistency
SELECT DISTINCT prd_line
FROM silver.crm_prd_info

--Check for Invalid Date Orders
SELECT *
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt

--=================================================================
--Checking 'silver.crm_sales_details'
--=================================================================
--Check Data Consistency: Between Sales, Quantity, Price
-- >> Sales = Quantity * Price
-- >> Values must not be NULL, zero, or negative 

SELECT DISTINCT 
sls_sales,
sls_quantity,
sls_price,
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_pricE OR sls_sales IS NULL OR sls_quantity IS NULL
	OR sls_price IS NULL OR sls_sales <= 0 OR sls_quantity <= 0 OR sls_price <= 0 
ORDER BY sls_sales, sls_quantity, sls_price
	
