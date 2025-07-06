--Insert data into Factsales_normalized from different tables avoiding redundant columns from fact_sales(
sale_date,sale_time,gender,age,category,price per unit columns removed) and new columns date_id,time_id,customer_id,product_id introduced into Factsales_normalized to make the schema normalized

INSERT INTO FactSales_Normalized (
    transactions_id,
    date_id,
    time_id,
    customer_id,
    product_id,
    quantity,
    cogs,
    total_sale
)
SELECT 
    f.transactions_id,
    d.date_id,
    t.time_id,
    f.customer_id,
    p.product_id,
    f.quantity,
    f.cogs,
    f.total_sale
FROM FactSales f
JOIN DimDate d ON f.sale_date = d.sale_date
JOIN DimTime t ON f.sale_time = t.sale_time
JOIN DimProduct p 
    ON f.category = p.category AND f.price_per_unit = p.price_per_unit;
