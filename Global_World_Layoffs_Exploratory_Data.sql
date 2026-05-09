-- GLOBAL WORLD LAYOFFS PROJECT - EXPLORATORY DATA ANALYSIS

-- Overview:
-- 1. Maximum layoffs
-- 2. Companies with largest layoffs
-- 3. Layoffs by industry
-- 4. Layoffs by country
-- 5. Yearly layoffs
-- 6. Monthly rolling total
-- 7. Company rankings by year

SELECT *
FROM layoffs_staging2;

-- Maximum Layoffs
-- A. Number of people
SELECT 
	MAX(total_laid_off)
FROM layoffs_staging2;

-- B Percentage of layoffs
SELECT 
	MAX(percentage_laid_off)
FROM layoffs_staging2;

-- Companies with largest layoffs
SELECT 
	company,
    SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
GROUP BY company
ORDER BY total_layoffs DESC
LIMIT 5;

-- Layoffs by industry
SELECT
	industry,
    SUM(total_laid_off) as total_layoffs
FROM layoffs_staging2
GROUP BY industry
ORDER BY total_layoffs DESC
LIMIT 5;

-- Layoffs by country
SELECT 
	country,
    SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
GROUP BY country
ORDER BY total_layoffs DESC
LIMIT 5;

-- Yearly Layoffs
SELECT
    YEAR(`date`) AS layoff_year,
    SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
WHERE `date` IS NOT NULL
GROUP BY layoff_year
ORDER BY layoff_year;

-- Monthly rolling total
WITH monthly_totals AS (
    SELECT
        DATE_FORMAT(`date`, '%Y-%m') AS `month`,
        SUM(total_laid_off) AS monthly_layoffs
    FROM layoffs_staging2
    WHERE `date` IS NOT NULL
    GROUP BY `month`
)
SELECT
    `month`,
    monthly_layoffs,
    SUM(monthly_layoffs) OVER (
        ORDER BY `month`
    ) AS rolling_total
FROM monthly_totals
ORDER BY `month`;

-- Top 5 companies with the most layoffs by year
WITH company_year AS (
    SELECT
        company,
        YEAR(`date`) AS layoff_year,
        SUM(total_laid_off) AS total_layoffs
    FROM layoffs_staging2
    WHERE `date` IS NOT NULL
    GROUP BY company, layoff_year
),
company_ranking AS (
    SELECT
        company,
        layoff_year,
        total_layoffs,
        DENSE_RANK() OVER (
            PARTITION BY layoff_year
            ORDER BY total_layoffs DESC
        ) AS ranking
    FROM company_year
)
SELECT *
FROM company_ranking
WHERE ranking <= 5
ORDER BY layoff_year, ranking;
