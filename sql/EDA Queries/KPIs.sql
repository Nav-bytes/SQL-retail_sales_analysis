-- Total Revenue

SELECT ROUND(SUM(total_sale), 2) AS total_revenue FROM FactSales;
-- Total Quantity Sold
SELECT SUM(quantity) AS total_quantity_sold FROM FactSales;
-- Total Unique Customers
SELECT COUNT(DISTINCT customer_id) AS total_customers FROM FactSales;

-- Average Order Value (AOV)
SELECT ROUND(SUM(total_sale)/COUNT(DISTINCT transactions_id), 2) AS average_order_value FROM FactSales;

-- Total Transactions
SELECT COUNT(*) AS total_transactions FROM FactSales;

-- Repeat Customer Rate
SELECT ROUND(100.0 * COUNT(*) / (SELECT COUNT(DISTINCT customer_id) FROM FactSales), 2) AS repeat_customer_rate
FROM (
  SELECT customer_id
  FROM FactSales
  GROUP BY customer_id
  HAVING COUNT(DISTINCT transactions_id) > 1
) AS repeat_customers;


-- Revenue per Customer
SELECT ROUND(SUM(total_sale) / COUNT(DISTINCT customer_id), 2) AS revenue_per_customer FROM FactSales;

-- Average Customer (LTV-Lifetime Value)
SELECT ROUND(AVG(customer_total), 2) AS avg_customer_lifetime_value
FROM (
  SELECT customer_id, SUM(total_sale) AS customer_total
  FROM FactSales
  GROUP BY customer_id
) AS customer_ltv;

-- Best Customer/Highest Spending Customer
SELECT customer_id, SUM(total_sale) AS total_spent
FROM FactSales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 1;

-- Top Product Category/Best Selling Product Category
SELECT p.category, SUM(f.total_sale) AS total_revenue
FROM FactSales f
JOIN DimProduct p ON f.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC
LIMIT 1;

-- Peak Sales Day
SELECT d.sale_date, SUM(f.total_sale) AS total_sales
FROM FactSales f
JOIN DimDate d ON f.date_id = d.date_id
GROUP BY d.sale_date
ORDER BY total_sales DESC
LIMIT 1;
