-- EV MARKET 2026 - Exploratory Data Analysis

-- Objective:
-- Analyze EV market trends to understand how pricing, performance, and range influence sales and consumer demand

-- Overview:
-- 1. Top brands
-- 2. Sales by market segments
-- 3. Price vs Demand (by segments)
-- 4. Performance vs Sales
-- 5. Range vs Sales

-- Top Selling Brands
SELECT brand, 
	SUM(annual_sales_units) AS total_sales
FROM evmarket_staging
GROUP BY brand
ORDER BY total_sales DESC;

-- Top 3 Selling Brands
SELECT 
	brand, 
	SUM(annual_sales_units) AS total_sales
FROM evmarket_staging
GROUP BY brand
ORDER BY total_sales DESC
LIMIT 3;

-- Average Price by Brand
SELECT 
	brand,
	ROUND(AVG(price_usd), 0) AS avg_price
FROM evmarket_staging
GROUP BY brand
ORDER BY avg_price DESC;

-- Sales and Average Price for Top 3 Brands
SELECT 
    RANK() OVER (ORDER BY total_sales DESC) AS sales_rank,
    brand,
    total_sales,
    avg_price
FROM (
    SELECT 
        brand,
        SUM(annual_sales_units) AS total_sales,
        ROUND(AVG(price_usd), 0) AS avg_price
    FROM evmarket_staging
    WHERE brand IN ('Tesla', 'BYD', 'Volkswagen')
    GROUP BY brand
) brand_summary
ORDER BY total_sales DESC;

-- Sales by Market Segments
SELECT 
	market_segment,
	SUM(annual_sales_units) AS total_sales,
    ROUND(AVG(price_usd), 0) AS avg_price
FROM evmarket_staging
GROUP BY market_segment
ORDER BY total_sales DESC;

-- Price vs Demand (by Market Segment)
SELECT 
    market_segment,
    ROUND(AVG(price_usd), 0) AS avg_price,
    SUM(annual_sales_units) AS total_sales
FROM evmarket_staging
GROUP BY market_segment
ORDER BY avg_price DESC;

-- Performance vs Sales
-- A. Horsepower
SELECT
	CASE
		WHEN horsepower < 150 THEN 'Low Performance'
        WHEN horsepower BETWEEN 150 AND 300 THEN 'Mid Performance'
        WHEN horsepower BETWEEN 301 AND 500 THEN 'High Performance'
        ELSE 'Very High Performance'
	END AS performance_level,
    ROUND(AVG(horsepower), 0) AS avg_horsepower,
    SUM(annual_sales_units) AS total_sales
FROM evmarket_staging
GROUP BY performance_level
ORDER BY total_sales DESC;

-- B. Acceleration
SELECT 
    CASE 
        WHEN acceleration_0_60_mph > 8 THEN 'Slow'
        WHEN acceleration_0_60_mph BETWEEN 5 AND 8 THEN 'Moderate'
        ELSE 'Fast'
    END AS acceleration_level,
    SUM(annual_sales_units) AS total_sales
FROM evmarket_staging
GROUP BY acceleration_level
ORDER BY total_sales DESC;

-- C. Charging Speed
SELECT 
    CASE 
        WHEN charging_speed_kw < 100 THEN 'Slow Charging'
        WHEN charging_speed_kw BETWEEN 100 AND 250 THEN 'Moderate Charging'
        ELSE 'Fast Charging'
    END AS charging_level,
    SUM(annual_sales_units) AS total_sales
FROM evmarket_staging
GROUP BY charging_level;

-- Range vs Sales
SELECT 
    CASE 
        WHEN range_miles < 150 THEN 'Low Range'
        WHEN range_miles BETWEEN 150 AND 300 THEN 'Mid Range'
        WHEN range_miles BETWEEN 301 AND 450 THEN 'High Range'
        ELSE 'Very High Range'
    END AS range_level,
    ROUND(AVG(range_miles), 0) AS avg_range,
    SUM(annual_sales_units) AS total_sales
FROM evmarket_staging
GROUP BY range_level
ORDER BY total_sales DESC;

-- FINAL INSIGHTS / SUMMARY
-- 1. Tesla, BYD, and Volkswagen lead total EV sales, with Tesla ranking first overall.
-- 2. The Premium segment has the highest total sales, followed closely by the Mid-range segment, indicating strong demand for mid-to-high tier EVs.
-- 3. Higher-priced segments (Premium and Luxury) still maintain strong sales, suggesting that demand is not driven purely by lower prices.
-- 4. Vehicles with higher performance (horsepower) show significantly higher sales, indicating a preference for more powerful EVs.
-- 5. Mid-range EVs generate the highest sales in terms of driving range, suggesting consumers prefer a balance between range and cost rather than maximum range.