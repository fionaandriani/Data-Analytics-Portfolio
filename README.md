# Global World Layoffs SQL Project

## Project Overview
This project analyzes global layoff data using SQL. The goal was to clean the raw dataset, standardize values, remove duplicates, handle missing data, and explore layoff trends by company, industry, country, and time period.

## Tools Used
- MySQL
- SQL
- GitHub

## Project Steps
1. Imported the raw layoffs dataset
2. Created a staging table to protect the original data
3. Removed duplicate records using ROW_NUMBER()
4. Standardized text values and cleaned inconsistent categories
5. Converted date and numeric columns into proper data types
6. Removed rows with limited usable layoff information
7. Performed exploratory data analysis

## Key Analysis Questions
- Which companies had the largest layoffs?
- Which industries were most affected?
- Which countries had the highest layoffs?
- How did layoffs change over time?
- Which companies ranked highest in layoffs by year?

## Files
- `01_data_cleaning.sql` — SQL script for cleaning and preparing the data
- `02_exploratory_analysis.sql` — SQL script for analyzing layoff trends

## Skills Demonstrated
- Data cleaning
- Duplicate removal
- Data type conversion
- NULL handling
- Window functions
- Aggregations
- Ranking analysis
- Exploratory data analysis