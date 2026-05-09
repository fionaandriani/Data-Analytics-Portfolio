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
        company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions
        ORDER BY company
	) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte 
WHERE row_num > 1;

-- Creating staging table 2
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` text,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` text,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert data to staging table 2
INSERT INTO layoffs_staging2
SELECT *,
    ROW_NUMBER() OVER(
        PARTITION BY
            company, location, industry, total_laid_off,
            percentage_laid_off, `date`, stage,
            country, funds_raised_millions
        ORDER BY company
    ) AS row_num
FROM layoffs_staging;

-- Deleting duplicate rows
DELETE 
FROM layoffs_staging2
WHERE row_num > 1;

-- Remove leading/trailing whitespace in text columns
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
    OR `date` IS NULL OR `date` = '' OR `date` = 'None'
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
    
SELECT DISTINCT `date`
FROM layoffs_staging2
ORDER BY `date` ASC;

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
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

-- Changing column data type
ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

-- Fill missing industry values using matching company records
SELECT *
FROM layoffs_staging2
WHERE industry IS NULL;

SELECT t1.company, t1.industry, t2.industry
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
ON t1.company = t2.company
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

-- Removing unnecessary rows
-- Rows where both total_laid_off and percentage_laid_off are NULL
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

-- Fixing numeric datatypes
ALTER TABLE layoffs_staging2
MODIFY COLUMN total_laid_off INT;

ALTER TABLE layoffs_staging2
MODIFY COLUMN funds_raised_millions INT;

ALTER TABLE layoffs_staging2
MODIFY COLUMN percentage_laid_off DECIMAL(5,2);

-- Final cleaned table
SELECT *
FROM layoffs_staging2;