-- Colorado Real Estate Market Analysis

-- Create Staging Table

CREATE TABLE colorado_staging
LIKE colorado_estate;

INSERT INTO colorado_staging
SELECT *
FROM colorado_estate;

-- Duplicate check

WITH duplicate_cte AS (
	SELECT *, 
	   ROW_NUMBER() OVER (
       PARTITION BY `type`, sub_type, `text`, listPrice, 
            sqft, stories, beds, baths, baths_full, 
            baths_full_calc, garage
		) AS row_num
FROM colorado_staging)
SELECT *
FROM duplicate_CTE
WHERE row_num > 1;

-- Standardize Blank Values and Trim Whitespace

UPDATE colorado_staging
SET 
	`type`	        =	NULLIF(TRIM(`type`), ''),
	sub_type	    = 	NULLIF(TRIM(sub_type), ''),
    `text`		    =	NULLIF(TRIM(`text`), ''),
    sqft	 		= 	NULLIF(TRIM(sqft), ''),
    stories		    = 	NULLIF(TRIM(stories), ''),
    beds		    =	NULLIF(TRIM(beds), ''),
    baths		    = 	NULLIF(TRIM(baths), ''),
    baths_full		= 	NULLIF(TRIM(baths_full), ''),
    baths_full_calc	= 	NULLIF(TRIM(baths_full_calc), ''),
    garage		    =	NULLIF(TRIM(garage), '');

-- Validate Numeric Columns Before Conversion

SELECT *
FROM colorado_staging
WHERE 	sqft REGEXP '[^0-9]' 
   OR	stories REGEXP '[^0-9]' 
   OR   beds REGEXP '[^0-9]' 
   OR   baths REGEXP '[^0-9]' 
   OR   baths_full REGEXP '[^0-9]' 
   OR   baths_full_calc REGEXP '[^0-9]' 
   OR   garage REGEXP '[^0-9]';
   
-- Convert Numeric Column:

ALTER TABLE colorado_staging
	MODIFY sqft INT,
	MODIFY stories INT,
	MODIFY beds INT,
	MODIFY baths INT,
	MODIFY baths_full INT,
	MODIFY baths_full_calc INT,
	MODIFY garage INT;

-- Validate Value Ranges

SELECT 
	MIN(listPrice) AS min_price, 
    MAX(listPrice) AS max_price,
    MIN(sqft) AS min_sqft, 
    MAX(sqft) AS max_sqft,
    MIN(stories) AS min_stories, 
    MAX(stories) AS max_stories,
    MIN(beds) AS min_beds, 
    MAX(beds) AS max_beds,
    MIN(baths) AS min_baths, 
    MAX(baths) AS max_baths,
    MIN(baths_full) AS min_baths_full, 
    MAX(baths_full) AS max_baths_full,
    MIN(baths_full_calc) AS min_baths_full_calc, 
    MAX(baths_full_calc) AS max_baths_full_calc,
    MIN(garage) AS min_garage, 
    MAX(garage) AS max_garage
FROM colorado_staging;

-- Note:
-- Zero values in beds, baths, and garage may represent condos, unfinished properties, or land listings and were retained

-- 7. Create Final Clean Table

CREATE TABLE colorado_clean
LIKE colorado_staging;

INSERT colorado_clean
SELECT *
FROM colorado_staging;