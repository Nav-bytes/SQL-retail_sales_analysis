-- updating nulls in dimcustomer age by default 0 and nulls in price per unit in dimproductby average price per unit price


UPDATE dimcustomer
SET age = 0
WHERE age IS NULL;


UPDATE dimproduct
SET price_per_unit = (SELECT AVG(price_per_unit) FROM dimproduct WHERE price_per_unit IS NOT NULL)
WHERE price_per_unit IS NULL;
