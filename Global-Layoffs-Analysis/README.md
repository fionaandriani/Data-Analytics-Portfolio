what do you think of my github portfolio https://github.com/fionaandriani/Data-Analytics-Portfolio/tree/main/SQL
lets do one by one, how do you do the readme
okay
it looks too ai
nah its okay, it was only the emojis that makes it very ai 
yess
where should i put it? the readme?
okay
whats step 5-7
something is wrong
restart from the first step
all of the steps are fucked up
okay, from the top, how to fix my portfolio: https://github.com/fionaandriani/Data-Analytics-Portfolio
from the top with number 3
when did i remove duplicate records?
ugh
im gonna restart this project
lets start with a new project. fresh. from 0 okay. whatd you think of this project? https://www.kaggle.com/datasets/starbucks/store-locations
how to search for datasets in kaggle
what is nato
what do you think of this dataset: https://www.kaggle.com/datasets/maulikgajera/nato-alliance-dataset
what niche of portfolio do you think is best for me to take?
what about cybersecurity attacks and defense
ev market analytics?
EV Market 2026.json
File
Here is the database
yes, to import the table, we use the table data import wizard right?
Does this look good?
wait wait wait. so after the table import wizard, you are supposed to have the data in there?
i use select count(*) and it says 0
how many data or rows is supposed to be in the dataset?
count(*) shows rows?
is there 2000 rows in that dataset?
can we fix it with with data cleaning?
i used csv for that and got 2000
nah the data def has 2000 rows
i created a staging table and it has 4000?
okay, i re did it and its no 2000
i am also looking at my friend's portfolio, he uses create table subcontractor, what is it for?
why do they have to do this and not just the import table wizard? CREATE TABLE house
(house_id NUMBER (10) PRIMARY KEY,
address VARCHAR2 (35),
zip VARCHAR2 (10)
); 
is it 'year' or year
so year?
if im using row_number, can i just go straight ahead and make cte with row_num or do i have to dit separately?
WITH duplicate_cte AS
(SELECT *, ROW_NUMBER ()
OVER (PARTITION BY
brand, model, year, variant, price_usd, battery_capacity_kwh, range_miles, charging_speed_kw, acceleration_0_60_mph,
top_speed_mph, horsepower, torque_nm, drive_type, seating_capacity, body_type, cargo_volume_cubic_ft, weight_kg, safety_rating,
autopilot_level, country_of_origin, market_segment, annual_sales_units, customer_rating, warranty_years)
AS row_num
FROM evmarket_staging)
SELECT *
FROM duplicate_CTE
WHERE row_num > 1;
if there is no row_num that meand no duplicates right?
should i still put delete duplicate rows in my portfolio tho?
so i can go ahead and move on to trimming?
what is !=, and thats for all of the columns right?
all good, so no trimming neccessary?
next should we check for standardizing first or straight to nulls?
does it have to be 2 separate steps or can i combine them?
is there a space between the ' ' for the blank values?
should i do it in the number rows too?
all good
whats wrong with this: SELECT DISTINCT brand
FROM evmarket_staging
ORDER BY ASC;
okay, next to standardizing?
this one, i have to do the rows one by one right?
i mean, columns
do i have to check for model too?
variant?
okay cool, everything looks good
so now we are in the exploratory?
i use limit 3 to see only the top 3
tesla, byd, volkswagen. but what if the volkswagen cars are pricier in general and it makes the total sales higher?
wait, are we only looking at the top 3 or overall?
wait the top 3 average price overall or just between tesla byd and volks?
SELECT brand,
	ROUND(AVG(price_usd), 0) AS avg_price
FROM evmarket_staging
WHERE brand IN ('Tesla', 'BYD', 'Volkswagen')
GROUP BY brand
ORDER BY avg_price DESC; ?
whatd you think: -- Top Highest Selling Brands
SELECT brand, 
	SUM(annual_sales_units) AS total_sales
FROM evmarket_staging
GROUP BY brand
ORDER BY total_sales DESC;

-- Top 3 Highest Selling Brands
SELECT brand, 
	SUM(annual_sales_units) AS total_sales
FROM evmarket_staging
GROUP BY brand
ORDER BY total_sales DESC
LIMIT 3;

-- Average Price by Brands
SELECT brand,
	ROUND(AVG(price_usd), 0) AS avg_price
FROM evmarket_staging
GROUP BY brand
ORDER BY avg_price DESC;

-- Average Price of The Top 3 Highest Selling Brands
SELECT brand,
	SUM(annual_sales_units) AS total_sales,
	ROUND(AVG(price_usd), 0) AS avg_price
FROM evmarket_staging
WHERE brand IN ('Tesla', 'BYD', 'Volkswagen')
GROUP BY brand
ORDER BY total_sales DESC;
can i put the rank as the first column?
SELECT RANK() OVER (ORDER BY SUM(annual_sales_units) DESC) AS sales_rank,
	brand,
	SUM(annual_sales_units) AS total_sales,
	ROUND(AVG(price_usd), 0) AS avg_price
FROM evmarket_staging
WHERE brand IN ('Tesla', 'BYD', 'Volkswagen')
GROUP BY brand
ORDER BY total_sales DESC;
but if the rank is later then i dont have to do that?
what is that ) t?
im lost. so which one should i use? and this is specificly for rankings too right?
next
not sales by market segments?
premium is the highest
can you please keep the insights for later so that i can summarize it later at the end?
so price vs segments is included in that step right
wait, with sales by market segments or with sales vs demand
so the overview is going to be like this: -- Overview:
-- 1. Top brands
-- 2. Sales by market segments
-- 3. Price vs Demand (by segments)
-- 4. Performance vs Sales
-- 5. Range vs Sales
i think im going to take a rest now, when i come back can we please start over from the price vs demand
lets start over with price and demand
'Luxury','127340','65966088'
'Premium','81102','86507799'
'Mid-range','50689','83479890'
'Budget','29321','23353407'
can we keep the findings for later please
performance
what if i want to put the horsepower column in there too?
'Very High Performance','172779681','93188'
'High Performance','51272996','53408'
'Mid Performance','35254507','36682'
so should i do avg horsepower or avg sales
'Very High Performance','814','172779681'
'High Performance','403','51272996'
'Mid Performance','229','35254507'
why do you only check performance based on horsepower? or battery capacity, charging speed, acceleration, and top speed?
so its better to do it all separately?
Range vs Sales
Okay now, where should i put the insights and what-- EV MARKET 2026 - Exploratory Data Analysis
-- Overview:
-- 1. Top brands
-- 2. Sales by market segments
-- 3. Price vs Demand (by segments)
-- 4. Performance vs Sales
-- 5. Range vs Sales

SELECT *
FROM evmarket_staging;

-- Top Highest Selling Brands
SELECT brand, 
	SUM(annual_sales_units) AS total_sales
FROM evmarket_staging
GROUP BY brand
ORDER BY total_sales DESC;

-- Top 3 Highest Selling Brands
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

-- Sales and Average Price for Top 3 Brands (Tesla, BYD, Volkswagen)
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

-- Price vs Demand
SELECT 
    market_segment,
    ROUND(AVG(price_usd), 0) AS avg_price,
    SUM(annual_sales_units) AS total_sales
FROM evmarket_staging
GROUP BY market_segment
ORDER BY avg_price DESC;

-- Performance vs Sales
-- A. Based on horsepower
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

-- B. Based on Acceleration
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

-- C. Based on Charging Speed
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
this is for range vs sales 'Mid Range','227','185866644'
'High Range','351','73440540'
EV_Market_2026 - Data_Cleaning.sql
File
EV_Market_2026 - Exploratory Data Analysis.sql
File
review and polish but dont make it too ai-ish
EV_Market_2026 - Exploratory Data Analysis(1).sql
File
hold on, lets triple check now
EV_Market_2026_Data_Cleaning.sql
File
EV_Market_2026 - Exploratory Data Analysis(2).sql
File
readme
I no longer want to keep the colorado market analysis, how should i update this: # Data Analytics Portfolio

Hi, I'm Fiona. This portfolio includes data analytics projects using SQL, Excel, Tableau, Power BI, and Python as I continue building my skills toward a data analyst career.

## Projects

### Colorado Real Estate Market Analysis
- Tool: MySQL
- Skills: data cleaning, duplicate removal, NULL handling, data type conversion, exploratory analysis
- Goal: Explore pricing patterns and property features in Colorado real estate data

[View SQL Project](SQL)

## Skills
- SQL
- MySQL
- Excel
- Tableau
- Power BI
- Data cleaning
- Exploratory data analysis
guide me step by step to import my ev market project to github
wait, how do you make the readme and put it in your computer
i cant click on the /
from the top
https://github.com/fionaandriani/Data-Analytics-Portfolio/blob/main/EV-Market-2026-Analysis/EV_Market_2026%20-%20Exploratory%20Data%20Analysis.sql
whatd you think: -- EV MARKET 2026 PROJECT - DATA CLEANING

-- Make a new schema
-- Import Table
SELECT COUNT(*)
FROM ev_market_2026;

-- Create staging table
CREATE TABLE evmarket_staging
LIKE ev_market_2026;

-- Insert data to staging table
INSERT evmarket_staging
SELECT *
FROM ev_market_2026;

SELECT COUNT(*)
FROM evmarket_staging;

SELECT *
FROM evmarket_staging;

-- Data Cleaning: Removing Duplicates
-- Creating CTE with ROW_NUMBER
WITH duplicate_cte AS (
	SELECT *, 
		ROW_NUMBER () OVER (
			PARTITION BY
			brand, model, year, variant, price_usd, battery_capacity_kwh, range_miles, charging_speed_kw, acceleration_0_60_mph,
			top_speed_mph, horsepower, torque_nm, drive_type, seating_capacity, body_type, cargo_volume_cubic_ft, weight_kg, safety_rating,
			autopilot_level, country_of_origin, market_segment, annual_sales_units, customer_rating, warranty_years
            ORDER BY brand
		) AS row_num
FROM evmarket_staging
)
SELECT *
FROM duplicate_CTE
WHERE row_num > 1;

-- Result: No exact duplicate rows found, no deletion required

-- Check for leading/trailing whitespace in text columns
-- != means not equal to
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
			brand, model, year, variant, price_usd, battery_capacity_kwh, range_miles, charging_speed_kw, acceleration_0_60_mph,
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

-- Check staging table row count
SELECT COUNT(*)
FROM evmarket_staging;

-- Check for duplicate records
-- Creating CTE with ROW_NUMBER
WITH duplicate_cte AS (
	SELECT *, 
		ROW_NUMBER () OVER (
			PARTITION BY
			brand, model, year, variant, price_usd, battery_capacity_kwh, range_miles, charging_speed_kw, acceleration_0_60_mph,
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

-- Check staging table row count
SELECT COUNT(*)
FROM evmarket_staging;

-- Check for duplicate records
-- Creating CTE with ROW_NUMBER
WITH duplicate_cte AS (
	SELECT *, 
		ROW_NUMBER() OVER (
			PARTITION BY
			brand, model, year, variant, price_usd, battery_capacity_kwh, range_miles, charging_speed_kw, acceleration_0_60_mph,
			top_speed_mph, horsepower, torque_nm, drive_type, seating_capacity, body_type, cargo_volume_cubic_ft, weight_kg, safety_rating,
			autopilot_level, country_of_origin, market_segment, annual_sales_units, customer_rating, warranty_years
            ORDER BY brand
		) AS row_num
	FROM evmarket_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

-- Result: No duplicate records found

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
do you think i should put the layoff staging project in my github or choose another dataset from kaggle?
okay, lets start over with the layoff staging project then?
do you think its a strong dataset for my portfolio?
layoffs.json
File
Layoffs
How many dataset is considered complete in this data
is this right: WITH duplicate_cte AS (
	SELECT *,
		ROW_NUMBER() OVER (
        PARTITION BY
        company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions
        ORDER BY company
	) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte 
WHERE row_num > 1;
whats next after this? WITH duplicate_cte AS (
	SELECT *,
		ROW_NUMBER() OVER (
        PARTITION BY
        company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions
        ORDER BY company
	) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte 
WHERE row_num > 1;
should we just go ahead and delete the duplicates first?
INSERT INTO layoffs_staging2
SELECT *,
	ROW_NUMBER() OVER(
	PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, date, stage, country,
	funds_raised_millions) AS row_num
FROM layoffs_staging;
after deleting duplicate, we trim the white spaces first or standardize the data?
i am trimming whitespaces, i didnt include columns with numbers. However, i have a question, at some point i still need to change their data type to number later, will it be okay? SELECT *
FROM layoffs_staging2
WHERE company != TRIM(brand)
	OR location != TRIM(location)
    OR industry != TRIM(industry)
    OR stage != TRIM(stage)
    OR country != TRIM(country);
are there any whitespaces in these? now what? ' E Inc.','Toronto','Transportation','None','None','12/16/2022','Post-IPO','Canada','None','1'
' Included Health','SF Bay Area','Healthcare','None','0.06','7/25/2022','Series E','United States','272','1'
'Atlas Obscura ','New York City','Media','15','None','6/18/2020','Series B','United States','32','1'
'Bonterra ','Austin','Other','140','0.1','1/13/2023','Unknown','United States','None','1'
'Captain Fresh ','Bengaluru','Food','120','None','1/15/2023','Series C','India','126','1'
'Pear Therapeutics ','Boston','Healthcare','25','0.09','7/25/2022','Post-IPO','United States','409','1'
'Science 37 ','Los Angeles','Healthcare','90','None','11/14/2022','Post-IPO','United States','347','1'
'Twine Solutions ','Tel Aviv','Hardware','30','0.33','1/5/2023','Unknown','Israel','50','1'
'WeWork ','New York City','Real Estate','300','None','1/19/2023','Post-IPO','United States','22200','1'
'WeWork ','Shenzen','Real Estate','None','None','9/23/2020','Series H','China','19500','1'
'Zymergen ','SF Bay Area','Other','None','0.1','5/13/2020','Series C','United States','574','1'
instade of doing the OR !=, can i just go ahead and use TRIM? wont it safe to much time? does it look professional tho?
do i even still need the trim and include row num on this: SELECT *
FROM layoffs_staging2
WHERE company IS NULL OR TRIM(company) = ''
	OR location IS NULL OR TRIM(location) = ''
    OR industry IS NULL OR TRIM(industry) = ''
    OR total_laid_off IS NULL OR TRIM(total_laid_off) = ''
    OR percentage_laid_off IS NULL OR TRIM(percentage_laid_off) = ''
    OR date IS NULL OR TRIM(date) = ''
    OR stage IS NULL OR TRIM(stage) = ''
    OR country IS NULL OR TRIM(country) = ''
    OR funds_raised_millions IS NULL OR TRIM(funds_raised_millions) = ''
    OR row_num IS NULL OR TRIM(row_num) = '';
that dont show all of the nones tho
am i going in the right direction: UPDATE layoffs_staging2
	SET company = NULL WHERE company = '' OR company = 'None',
    SET location = NULL WHERE location = '' OR location = 'None',
so i can only check with distinct one column at a time right?
should i standardize the date next?
whats next
okay, lets backup a bit. in the company column , there are ada, adahealth, and adasupport, should i standardize that?
even aura and aura insurance?
is there any duplicate in here: 'Accra'
'Ahmedabad'
'Albany'
'Amsterdam'
'Ann Arbor'
'Athens'
'Atlanta'
'Auckland'
'Austin'
'Baltimore'
'Bangkok'
'Barcelona'
'Baton Rouge'
'Beau Vallon'
'Beijing'
'Belo Horizonte'
'Bend'
'Bengaluru'
'Berlin'
'Birmingham'
'Bismarck'
'Blumenau'
'Bogota'
'Boise'
'Boston'
'Boulder'
'Brasilia'
'Brisbane'
'Bristol'
'Brussels'
'Bucharest'
'Budapest'
'Buenos Aires'
'Burlington'
'Cairo'
'Calgary'
'Cape Town'
'Charleston'
'Charlotte'
'Chennai'
'Chicago'
'Cincinnati'
'Coimbra'
'Columbus'
'Copenhagen'
'Cork'
'Curitiba'
'Dakar'
'Dallas'
'Davenport'
'Denver'
'Detroit'
'Dover'
'Dubai'
'Dublin'
'Durham'
'Düsseldorf'
'Edinburgh'
'Eindhoven'
'Fayetteville'
'Ferdericton'
'Florianópolis'
'Frankfurt'
'Gothenburg'
'Grand Rapids'
'Guadalajara'
'Gurugram'
'Hamburg'
'Hanoi'
'Helsinki'
'Ho Chi Minh City'
'Hong Kong'
'Houston'
'Huntsville'
'Hyderabad'
'Ibadan'
'Indianapolis'
'Indore'
'Istanbul'
'Jakarta'
'Jersey City'
'Jerusalem'
'Joinville'
'Kansas City'
'Karachi'
'Karlsruhe'
'Kiel'
'Krakow'
'Kuala Lumpur'
'Lagos'
'Lahore'
'Las Vegas'
'Lehi'
'Lexington'
'Lima'
'Lisbon'
'Logan'
'London'
'Los Angeles'
'Louisville'
'Luxembourg'
'Madison'
'Malmo'
'Manama'
'Manchester'
'Melbourne'
'Mexico City'
'Miami'
'Milan'
'Milwaukee'
'Minneapolis'
'Missoula'
'Montevideo'
'Montreal'
'Moscow'
'Mumbai'
'Munich'
'Nairobi'
'Nashua'
'Nashville'
'Nebraska City'
'New Delhi'
'New Haven'
'New Orleans'
'New York City'
'Noida'
'Non-U.S.'
'Norwalk'
'Orlando'
'Oslo'
'Ottawa'
'Oxford'
'Paris'
'Patna'
'Philadelphia'
'Phoenix'
'Pittsburgh'
'Portland'
'Porto Alegre'
'Prague'
'Providence'
'Pune'
'Quebec'
'Raleigh'
'Reno'
'Richmond'
'Sacramento'
'Salt Lake City'
'San Antonio'
'San Diego'
'San Luis Obispo'
'Santa Barbara'
'Santa Fe'
'Santiago'
'Sao Paulo'
'Saskatoon'
'Seattle'
'Selangor'
NULL
''
'Aerospace'
'Construction'
'Consumer'
'Crypto'
'Crypto Currency'
'CryptoCurrency'
'Data'
'Education'
'Energy'
'Fin-Tech'
'Finance'
'Fitness'
'Food'
'Hardware'
'Healthcare'
'HR'
'Infrastructure'
'Legal'
'Logistics'
'Manufacturing'
'Marketing'
'Media'
'Other'
'Product'
'Real Estate'
'Recruiting'
'Retail'
'Sales'
'Security'
'Support'
'Transportation'
'Travel'
theres a blanck space in there?
then how to make this one includ the blanks too?
i meant this one: company = NULLIF(company, 'None'),
	location = NULLIF(location, 'None'),
	industry = NULLIF(industry, 'None'),
	total_laid_off = NULLIF(total_laid_off, 'None'),
	percentage_laid_off = NULLIF(percentage_laid_off, 'None'),
	date = NULLIF(date, 'None'),
	stage = NULLIF(stage, 'None'),
	country = NULLIF(country, 'None'),
	funds_raised_millions = NULLIF(funds_raised_millions, 'None');
so use the blank first and then the none to null and you cant combine them?
can i combine it with other columns too?
why does this not work:   total_laid_off = CASE
		WHEN total_laid_off = 'None' THEN NULL
        ELSE total_laid_off
	END;
    
so this: UPDATE layoffs_staging2
SET
    company = CASE
        WHEN company = '' OR company = 'None' THEN NULL
        ELSE company
    END,
    
    location = CASE
        WHEN location = '' OR location = 'None' THEN NULL
        ELSE percentage_laid_off
    END,
    
    industry = CASE
        WHEN industry = 'None' THEN NULL
        ELSE industry
    END,
    
    total_laid_off = CASE
		WHEN total_laid_off = 'None' THEN NULL
        ELSE total_laid_off
	END,
    
    percentage_laid_off = CASE
		WHEN percentage_laid_off = 'None' THEN NULL
        ELSE percentage_laid_off
	END,
    
    date = CASE
		WHEN date = 'None' THEN NULL
        ELSE date
	END,
    
    stage = CASE
		WHEN stage = 'None' THEN NULL
        ELSE stage
	END,
    
    country = CASE
		WHEN country = 'None' THEN NULL
        ELSE country
	END,
    
    funds_raised_millions = CASE
		WHEN funds_raised_millions = 'None' THEN NULL
        ELSE funds_raised_millions
	END;?
UPDATE layoffs_staging2
SET
    company = CASE
        WHEN company = '' OR company = 'None' THEN NULL
        ELSE company
    END,
    
    location = CASE
        WHEN location = '' OR location = 'None' THEN NULL
        ELSE location
    END,
    
    industry = CASE
        WHEN industry = 'None' THEN NULL
        ELSE industry
    END,
    
    total_laid_off = CASE
		WHEN total_laid_off = 'None' THEN NULL
        ELSE total_laid_off
	END,
    
    percentage_laid_off = CASE
		WHEN percentage_laid_off = 'None' THEN NULL
        ELSE percentage_laid_off
	END,
    
    date = CASE
		WHEN date = 'None' THEN NULL
        ELSE date
	END,
    
    stage = CASE
		WHEN stage = 'None' THEN NULL
        ELSE stage
	END,
    
    country = CASE
		WHEN country = 'None' THEN NULL
        ELSE country
	END,
    
    funds_raised_millions = CASE
		WHEN funds_raised_millions = 'None' THEN NULL
        ELSE funds_raised_millions
	END;
WHAT, so which one should i use, make up your mind
should we still keep this? SELECT *
FROM layoffs_staging2
WHERE company IS NULL OR company = '' OR company = 'None'
    OR location IS NULL OR location = '' OR location = 'None'
    OR industry IS NULL OR industry = '' OR industry = 'None'
    OR total_laid_off IS NULL OR total_laid_off = 'None'
    OR percentage_laid_off IS NULL OR percentage_laid_off = '' OR percentage_laid_off = 'None'
    OR date IS NULL OR date = '' OR date = 'None'
    OR stage IS NULL OR stage = '' OR stage = 'None'
    OR country IS NULL OR country = '' OR country = 'None'
    OR funds_raised_millions IS NULL OR funds_raised_millions = 'None';
should we keep this or change it? UPDATE layoffs_staging2
SET
	company = NULLIF(company, 'None'),
	location = NULLIF(location, 'None'),
	industry = NULLIF(industry, 'None'),
	total_laid_off = NULLIF(total_laid_off, 'None'),
	percentage_laid_off = NULLIF(percentage_laid_off, 'None'),
	date = NULLIF(date, 'None'),
	stage = NULLIF(stage, 'None'),
	country = NULLIF(country, 'None'),
	funds_raised_millions = NULLIF(funds_raised_millions, 'None');
should i do it for the date column too
Pasted text(9).txt
Document
what do you think: 
-- Global World Layoffs PROJECT - DATA CLEANING

-- Check imported table row count
SELECT COUNT(*)
FROM layoffs;

-- Create staging table
CREATE TABLE layoffs_staging
LIKE layoffs;

-- Insert data into staging table
INSERT INTO layoffs_staging
SELECT *
FROM layoffs;

-- Check for duplicate records
-- Creating CTE with ROW_NUMBER
WITH duplicate_cte AS (
	SELECT *,
		ROW_NUMBER() OVER (
        PARTITION BY
        company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions
        ORDER BY company
	) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte 
WHERE row_num > 1;

-- Creating staging table 2
CREATE TABLE layoffs_staging2 (
  company text,
  location text,
  industry text,
  total_laid_off text,
  percentage_laid_off text,
  date text,
  stage text,
  country text,
  funds_raised_millions text,
  row_num int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert data to staging table 2
INSERT INTO layoffs_staging2
SELECT *,
    ROW_NUMBER() OVER(
        PARTITION BY
            company, location, industry, total_laid_off,
            percentage_laid_off, date, stage,
            country, funds_raised_millions
        ORDER BY company
    ) AS row_num
FROM layoffs_staging;

-- Deleting duplicate rows
DELETE 
FROM layoffs_staging2
WHERE row_num > 1;

SELECT *
FROM layoffs_staging2;

-- Check for leading/trailing whitespace in in text columns
UPDATE layoffs_staging2
SET company = TRIM(company),
	location = TRIM(location),
	industry = TRIM(industry),
    stage = TRIM(stage),
    country = TRIM(country);

-- Check for NULL, blank, and placeholder values
SELECT *
FROM layoffs_staging2
WHERE company IS NULL OR company = '' OR company = 'None'
    OR location IS NULL OR location = '' OR location = 'None'
    OR industry IS NULL OR industry = '' OR industry = 'None'
    OR total_laid_off IS NULL OR total_laid_off = 'None'
    OR percentage_laid_off IS NULL OR percentage_laid_off = '' OR percentage_laid_off = 'None'
    OR date IS NULL OR date = '' OR date = 'None'
    OR stage IS NULL OR stage = '' OR stage = 'None'
    OR country IS NULL OR country = '' OR country = 'None'
    OR funds_raised_millions IS NULL OR funds_raised_millions = 'None';

UPDATE layoffs_staging2
SET company = NULL
WHERE company = ''
   OR company = 'None';

UPDATE layoffs_staging2
SET location = NULL
WHERE location = ''
   OR location = 'None';

UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = ''
   OR industry = 'None';

UPDATE layoffs_staging2
SET total_laid_off = NULL
WHERE total_laid_off = 'None';

UPDATE layoffs_staging2
SET percentage_laid_off = NULL
WHERE percentage_laid_off = ''
   OR percentage_laid_off = 'None';

UPDATE layoffs_staging2
SET country = NULL
WHERE country = ''
   OR country = 'None';

UPDATE layoffs_staging2
SET funds_raised_millions = NULL
WHERE funds_raised_millions = 'None';
        
-- Check categorical columns for inconsistent values
SELECT DISTINCT company
FROM layoffs_staging2
ORDER BY company ASC;

SELECT DISTINCT location
FROM layoffs_staging2
ORDER BY location ASC;

SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY industry ASC;

-- Standardizing data in the industry column
UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT DISTINCT total_laid_off
FROM layoffs_staging2
ORDER BY total_laid_off ASC;
        
SELECT DISTINCT percentage_laid_off
FROM layoffs_staging2
ORDER BY percentage_laid_off ASC;
    
SELECT DISTINCT date
FROM layoffs_staging2
ORDER BY date ASC;

SELECT DISTINCT stage
FROM layoffs_staging2
ORDER BY stage ASC;

SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY country ASC;

-- Standardizing data in the country column
UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

SELECT DISTINCT funds_raised_millions
FROM layoffs_staging2
ORDER BY funds_raised_millions ASC;

-- Standardizing the date column format
UPDATE layoffs_staging2
SET date = STR_TO_DATE(date, '%m/%d/%Y');

-- Changing column data type
ALTER TABLE layoffs_staging2
MODIFY COLUMN date DATE;

-- Filling in the NULL cells with possible data
SELECT *
FROM layoffs_staging2
WHERE industry IS NULL;

SELECT t1.company, t1.industry, t2.industry
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
ON t1.company = t2.company
WHERE t1.industry IS NOT NULL
AND t2.industry IS NULL;

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
ON t1.company = t2.company
SET t2.industry = t1.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

-- Removing unnecessary columns
-- Rows where both total_laid_off and percentage_laid_off is NULL
SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

DELETE 
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- Removing row_num column
ALTER TABLE layoffs_staging2
DROP COLUMN row_num;
-- Global World Layoffs PROJECT - DATA CLEANING

-- Check imported table row count
SELECT COUNT(*)
FROM layoffs;

-- Create staging table
CREATE TABLE layoffs_staging
LIKE layoffs;

-- Insert data into staging table
INSERT INTO layoffs_staging
SELECT *
FROM layoffs;

-- Check for duplicate records
-- Creating CTE with ROW_NUMBER
WITH duplicate_cte AS (
	SELECT *,
		ROW_NUMBER() OVER (
        PARTITION BY
        company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions
        ORDER BY company
	) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte 
WHERE row_num > 1;

-- Creating staging table 2
CREATE TABLE layoffs_staging2 (
  company text,
  location text,
  industry text,
  total_laid_off text,
  percentage_laid_off text,
  date text,
  stage text,
  country text,
  funds_raised_millions text,
  row_num int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert data to staging table 2
INSERT INTO layoffs_staging2
SELECT *,
    ROW_NUMBER() OVER(
        PARTITION BY
            company, location, industry, total_laid_off,
            percentage_laid_off, date, stage,
            country, funds_raised_millions
        ORDER BY company
    ) AS row_num
FROM layoffs_staging;

-- Deleting duplicate rows
DELETE 
FROM layoffs_staging2
WHERE row_num > 1;

-- Check for leading/trailing whitespace in in text columns
UPDATE layoffs_staging2
SET company = TRIM(company),
	location = TRIM(location),
	industry = TRIM(industry),
    stage = TRIM(stage),
    country = TRIM(country);

-- Check for NULL, blank, and placeholder values
SELECT *
FROM layoffs_staging2
WHERE company IS NULL OR company = '' OR company = 'None'
    OR location IS NULL OR location = '' OR location = 'None'
    OR industry IS NULL OR industry = '' OR industry = 'None'
    OR total_laid_off IS NULL OR total_laid_off = 'None'
    OR percentage_laid_off IS NULL OR percentage_laid_off = '' OR percentage_laid_off = 'None'
    OR date IS NULL OR date = '' OR date = 'None'
    OR stage IS NULL OR stage = '' OR stage = 'None'
    OR country IS NULL OR country = '' OR country = 'None'
    OR funds_raised_millions IS NULL OR funds_raised_millions = 'None';

UPDATE layoffs_staging2
SET company = NULL
WHERE company = ''
   OR company = 'None';

UPDATE layoffs_staging2
SET location = NULL
WHERE location = ''
   OR location = 'None';

UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = ''
   OR industry = 'None';

UPDATE layoffs_staging2
SET total_laid_off = NULL
WHERE total_laid_off = 'None';

UPDATE layoffs_staging2
SET percentage_laid_off = NULL
WHERE percentage_laid_off = ''
   OR percentage_laid_off = 'None';

UPDATE layoffs_staging2
SET country = NULL
WHERE country = ''
   OR country = 'None';

UPDATE layoffs_staging2
SET funds_raised_millions = NULL
WHERE funds_raised_millions = 'None';
        
-- Check categorical columns for inconsistent values
SELECT DISTINCT company
FROM layoffs_staging2
ORDER BY company ASC;

SELECT DISTINCT location
FROM layoffs_staging2
ORDER BY location ASC;

SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY industry ASC;

-- Standardizing data in the industry column
UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT DISTINCT total_laid_off
FROM layoffs_staging2
ORDER BY total_laid_off ASC;
        
SELECT DISTINCT percentage_laid_off
FROM layoffs_staging2
ORDER BY percentage_laid_off ASC;
    
SELECT DISTINCT date
FROM layoffs_staging2
ORDER BY date ASC;

SELECT DISTINCT stage
FROM layoffs_staging2
ORDER BY stage ASC;

SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY country ASC;

-- Standardizing data in the country column
UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

SELECT DISTINCT funds_raised_millions
FROM layoffs_staging2
ORDER BY funds_raised_millions ASC;

-- Standardizing the date column format
UPDATE layoffs_staging2
SET date = STR_TO_DATE(date, '%m/%d/%Y');

-- Changing column data type
ALTER TABLE layoffs_staging2
MODIFY COLUMN date DATE;

-- Filling in the NULL cells with possible data
SELECT *
FROM layoffs_staging2
WHERE industry IS NULL;

SELECT t1.company, t1.industry, t2.industry
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
ON t1.company = t2.company
WHERE t1.industry IS NOT NULL
AND t2.industry IS NULL;

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

-- Removing unnecessary rows
-- Rows where both total_laid_off and percentage_laid_off is NULL
SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

DELETE 
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- Removing row_num column
ALTER TABLE layoffs_staging2
DROP COLUMN row_num;
Pasted text(10).txt
Document
last check please, also check the sequence 
Global_World_Layoffs_Data_Cleaning.sql
File
lets go to eda
i think something is wrong with my number 5 and 6
what about percentage?
Rankings
why dont you use limit for the last part?
okay. anything else?
step by step on uploading the file into github?
make me a readme for the global layoffs project
in the other format
