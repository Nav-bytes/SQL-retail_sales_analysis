-- Check for NULL values in FactSales
SELECT 
  COUNT(*) AS total_rows,
  SUM(date_id IS NULL) AS null_date_id,
  SUM(time_id IS NULL) AS null_time_id,
  SUM(customer_id IS NULL) AS null_customerid,
  SUM(product_id IS NULL) AS null_product,
  SUM(quantity IS NULL) AS null_quantity
  SUM(cogs IS NULL) AS null_cogs
FROM FactSales;

-- Check for NULL values in dimcustomer,dimdate,dimtime,dimproduct


--dimcustomer

SELECT 
  COUNT(*) AS total_rows,
  SUM(customer_id IS NULL) AS null_customer_id,
  SUM(gender IS NULL) AS null_gender,
  SUM(age IS NULL) AS null_age,
 FROM dimcustomer;

--dimdate
SELECT 
  COUNT(*) AS total_rows,
  SUM(date_id IS NULL) AS null_date_id,
  SUM(sale_date IS NULL) AS null_sale_date,
  SUM(weekday IS NULL) AS null_weekday,
 FROM dimdate;

--dimtime
SELECT 
  COUNT(*) AS total_rows,
  SUM(time IS NULL) AS null_date_id,
  SUM(sale_time IS NULL) AS null_sale_time,
  SUM(time_of_day IS NULL) AS null_time_of_day,
 FROM dimtime;

--dimproduct
SELECT 
  COUNT(*) AS total_rows,
  SUM(product_id IS NULL) AS null_product_id,
  SUM(category IS NULL) AS null_category,
  SUM(price_per_unit IS NULL) AS null_price_per_unit,
 FROM dimproduct;


