
-- 📄 part_of_whole.sql

-- Revenue by Gender (%)
SELECT 
  c.gender,
  ROUND(SUM(f.total_sale), 2) AS total_revenue,
  ROUND(100 * SUM(f.total_sale) / (SELECT SUM(total_sale) FROM FactSales), 2) AS percent_of_total
FROM FactSales f
JOIN DimCustomer c ON f.customer_id = c.customer_id
GROUP BY c.gender;

-- Revenue by Time of Day
SELECT 
  t.time_of_day,
  SUM(f.total_sale) AS total_revenue,
  ROUND(100 * SUM(f.total_sale) / (SELECT SUM(total_sale) FROM FactSales), 2) AS percent_share
FROM FactSales f
JOIN DimTime t ON f.time_id = t.time_id
GROUP BY t.time_of_day;

-- Revenue by Category
SELECT 
  p.category,
  SUM(f.total_sale) AS total_revenue,
  ROUND(100 * SUM(f.total_sale) / (SELECT SUM(total_sale) FROM FactSales), 2) AS percent_share
FROM FactSales f
JOIN DimProduct p ON f.product_id = p.product_id
GROUP BY p.category;

-- Revenue by Weekday
SELECT 
  d.weekday,
  SUM(f.total_sale) AS total_revenue,
  ROUND(100 * SUM(f.total_sale) / (SELECT SUM(total_sale) FROM FactSales), 2) AS percent_share
FROM FactSales f
JOIN DimDate d ON f.date_id = d.date_id
GROUP BY d.weekday;
