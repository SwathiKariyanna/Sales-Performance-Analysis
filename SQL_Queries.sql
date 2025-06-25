-- SQL Queries for Sales Data Extraction and Consolidation

-- 1. Extract detailed sales data by joining sales and products tables
SELECT
    s.sale_id,
    s.sale_date,
    s.customer_id,
    p.product_name,
    s.quantity,
    s.price,
    (s.quantity * s.price) AS sale_amount
FROM sales_table s
JOIN products_table p ON s.product_id = p.product_id;

-- 2. Consolidate sales data from two different regions into one dataset
SELECT * FROM sales_region1
UNION ALL
SELECT * FROM sales_region2;

-- 3. Aggregate total sales amount by month from the consolidated sales data
SELECT
    DATE_FORMAT(sale_date, '%Y-%m') AS sale_month,
    SUM(quantity * price) AS total_sales_amount
FROM consolidated_sales
GROUP BY sale_month
ORDER BY sale_month;
