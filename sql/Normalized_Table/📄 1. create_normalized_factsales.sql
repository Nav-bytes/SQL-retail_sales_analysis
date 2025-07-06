--Creat normalized factsales table
  
DROP TABLE IF EXISTS FactSales_Normalized;

CREATE TABLE FactSales_Normalized (
    transactions_id VARCHAR(20) PRIMARY KEY,
    date_id INT,
    time_id INT,
    customer_id VARCHAR(10),
    product_id INT,
    quantity INT,
    cogs FLOAT,
    total_sale FLOAT,

    FOREIGN KEY (date_id) REFERENCES DimDate(date_id),
    FOREIGN KEY (time_id) REFERENCES DimTime(time_id),
    FOREIGN KEY (customer_id) REFERENCES DimCustomer(customer_id),
    FOREIGN KEY (product_id) REFERENCES DimProduct(product_id)
);
