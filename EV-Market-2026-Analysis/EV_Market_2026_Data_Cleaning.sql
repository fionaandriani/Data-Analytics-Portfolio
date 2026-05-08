-- EV MARKET 2026 PROJECT - DATA CLEANING

-- Check imported table row count
SELECT COUNT(*)
FROM ev_market_2026;

-- Create staging table
CREATE TABLE evmarket_staging
LIKE ev_market_2026;

-- Insert data into staging table
INSERT INTO evmarket_staging
SELECT *
FROM ev_market_2026;

SELECT COUNT(*)
FROM evmarket_staging;

SELECT *
FROM evmarket_staging;

-- Check for duplicate records
-- Creating CTE with ROW_NUMBER
WITH duplicate_cte AS (
	SELECT *, 
		ROW_NUMBER () OVER (
			PARTITION BY
			brand, model, `year`, variant, price_usd, battery_capacity_kwh, range_miles, charging_speed_kw, acceleration_0_60_mph,
			top_speed_mph, horsepower, torque_nm, drive_type, seating_capacity, body_type, cargo_volume_cubic_ft, weight_kg, safety_rating,
			autopilot_level, country_of_origin, market_segment, annual_sales_units, customer_rating, warranty_years
            ORDER BY brand
		) AS row_num
FROM evmarket_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

-- Result: No exact duplicate rows found, no deletion required

-- Check for leading/trailing whitespace in text columns
SELECT *
FROM evmarket_staging
WHERE brand != TRIM(brand)
	OR model != TRIM(model)
    OR variant != TRIM(variant)
    OR drive_type != TRIM(drive_type)
    OR body_type != TRIM(body_type)
    OR country_of_origin != TRIM(country_of_origin)
    OR market_segment != TRIM(market_segment);
    
-- Check for NULL and blank values in text columns
SELECT *
FROM evmarket_staging
WHERE brand IS NULL OR TRIM(brand) = ''
	OR model IS NULL OR TRIM(model) = ''
    OR variant IS NULL OR TRIM(variant) = ''
    OR drive_type IS NULL OR TRIM(drive_type) = ''
    OR body_type IS NULL OR TRIM(body_type) = ''
    OR country_of_origin IS NULL OR TRIM(country_of_origin) = ''
    OR market_segment IS NULL OR TRIM(market_segment) = '';
    
-- Check categorical columns for inconsistent values
SELECT DISTINCT brand
FROM evmarket_staging
ORDER BY brand ASC;

SELECT DISTINCT variant
FROM evmarket_staging
ORDER BY variant ASC;

SELECT DISTINCT drive_type
FROM evmarket_staging
ORDER BY drive_type ASC;

SELECT DISTINCT body_type
FROM evmarket_staging
ORDER BY body_type ASC;

SELECT DISTINCT country_of_origin
FROM evmarket_staging
ORDER BY country_of_origin ASC;

SELECT DISTINCT market_segment
FROM evmarket_staging
ORDER BY market_segment ASC;
