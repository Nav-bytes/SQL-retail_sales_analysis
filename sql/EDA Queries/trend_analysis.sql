--trend_analysis.sql

-- Monthly Revenue Trend
SELECT 
  CONCAT(d.month, '-', d.year) AS month_year,
  SUM(f.total_sale) AS monthly_revenue
FROM FactSales f
JOIN DimDate d ON f.date_id = d.date_id
GROUP BY d.year, d.month
ORDER BY d.year, d.month;

-- Daily Sales Trend
SELECT 
  d.sale_date,
  SUM(f.total_sale) AS daily_revenue
FROM FactSales f
JOIN DimDate d ON f.date_id = d.date_id
GROUP BY d.sale_date
ORDER BY d.sale_date;

-- Quantity Sold over Time
SELECT 
  d.sale_date,
  SUM(f.quantity) AS total_quantity
FROM FactSales f
JOIN DimDate d ON f.date_id = d.date_id
GROUP BY d.sale_date
ORDER BY d.sale_date;

