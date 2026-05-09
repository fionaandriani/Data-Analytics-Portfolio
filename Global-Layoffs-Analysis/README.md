# Global World Layoffs Analysis

## Overview
This project explores global layoff trends using SQL. The analysis focuses on identifying patterns across companies, industries, countries, and time periods to better understand how layoffs changed over time.

## Objective
To clean and analyze layoff data in order to identify:
- Companies with the largest layoffs
- Industries most affected
- Countries with the highest layoffs
- Layoff trends over time
- Monthly and yearly layoff patterns

## Tools Used
- MySQL
- SQL (data cleaning + exploratory data analysis)

## Data Cleaning
The dataset was cleaned and prepared using SQL by:
- Removing duplicate records
- Trimming leading/trailing whitespace
- Handling NULL, blank, and placeholder values
- Standardizing categorical values
- Converting date and numeric data types
- Filling missing industry values using matching company records

## Analysis Performed

1. Maximum layoffs and layoff percentages
2. Companies with the largest layoffs
3. Layoffs by industry
4. Layoffs by country
5. Yearly layoff trends
6. Monthly layoff trends
7. Rolling monthly layoff totals
8. Company rankings by year using window functions

## Key Insights

- Large tech companies accounted for some of the highest layoff totals
- The technology and consumer sectors experienced significant layoffs during peak periods
- The United States recorded the highest number of layoffs overall
- Layoffs increased significantly during certain years, reflecting broader economic slowdowns
- Rolling monthly totals showed how layoffs accumulated over time across industries

## SQL Concepts Used
- CTEs
- Window Functions
- ROW_NUMBER()
- DENSE_RANK()
- Aggregate Functions
- Date Functions
- Data Cleaning Techniques
- Joins and Updates

## Project Structure

```text
Global-Layoffs-Analysis/
│
├── Global_World_Layoffs_Data_Cleaning.sql
├── Global_World_Layoffs_Exploratory_Data_Analysis.sql
└── README.md
```

## Notes
This dataset was used for analytical and educational purposes to practice SQL data cleaning and exploratory analysis workflows.
