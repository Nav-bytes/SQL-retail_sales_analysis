--  1. Check duplicate customer_id in DimCustomer
SELECT customer_id, COUNT(*) AS count
FROM DimCustomer
GROUP BY customer_id
HAVING COUNT(*) > 1;

--  2. Check duplicate product_id in DimProduct
SELECT product_id, COUNT(*) AS count
FROM DimProduct
GROUP BY product_id
HAVING COUNT(*) > 1;

--  3. Check duplicate date_id in DimDate
SELECT date_id, COUNT(*) AS count
FROM DimDate
GROUP BY date_id
HAVING COUNT(*) > 1;

--  4. Check duplicate time_id in DimTime
SELECT time_id, COUNT(*) AS count
FROM DimTime
GROUP BY time_id
HAVING COUNT(*) > 1;

--  5. Check duplicate transactions_id in FactSales
SELECT transactions_id, COUNT(*) AS count
FROM FactSales
GROUP BY transactions_id
HAVING COUNT(*) > 1;
