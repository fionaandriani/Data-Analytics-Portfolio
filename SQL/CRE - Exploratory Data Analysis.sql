-- Colorado Real Estate Exploratory Data Analysis

-- Property type distirbution

SELECT `type`, 
		COUNT(*) AS listings
FROM colorado_clean
GROUP BY `type`
ORDER BY listings DESC;

-- Average price by property type

SELECT `type`, 
		COUNT(*) AS listings, 
        ROUND(AVG(listPrice),0) AS avg_price
FROM colorado_clean
GROUP BY `type`
ORDER BY avg_price DESC;

-- Price per square foor by property type
SELECT `type`, 
		COUNT(*) AS listings,
        ROUND(AVG(listPrice / NULLIF(sqft,0))) AS avg_price_per_sqft
FROM colorado_clean
WHERE sqft > 0
GROUP BY `type`
ORDER BY avg_price_per_sqft DESC;

-- Bedrooms vs average price

SELECT beds,
	   COUNT(*) AS listings,
       ROUND(AVG(listPrice)) AS avg_price
FROM colorado_clean
WHERE beds IS NOT NULL
GROUP BY beds
ORDER BY beds;

-- Price distribution by property type

SELECT	`type`,
		COUNT(*) AS listings,
		ROUND(MIN(listPrice)) AS min_price,
		ROUND(AVG(listPrice)) AS avg_price,
		ROUND(MAX(listPrice)) AS max_price
FROM colorado_clean
GROUP BY `type`
ORDER BY avg_price DESC;