Global World Layoffs SQL Project
Project Overview
This project explores and analyzes global layoff data using SQL. The main objective was to clean and standardize raw data before performing exploratory data analysis (EDA) to identify trends across companies, industries, countries, and time periods.
The project demonstrates a complete SQL workflow including data cleaning, transformation, and analytical querying.

Tools Used


MySQL


SQL


GitHub



Dataset
The dataset contains global layoff information including:


Company names


Industry


Country


Total layoffs


Percentage of layoffs


Funding raised


Company stage


Layoff dates



Project Steps
1. Data Cleaning
The raw dataset was cleaned and prepared for analysis by:


Creating staging tables


Removing duplicate records using ROW_NUMBER()


Standardizing text values with TRIM()


Handling NULL and blank values


Formatting date columns using STR_TO_DATE()


Standardizing inconsistent country and industry names


Removing unusable records


Converting columns into appropriate data types


2. Exploratory Data Analysis (EDA)
The cleaned dataset was analyzed to answer questions such as:


Which companies had the largest layoffs?


Which industries were most affected?


Which countries experienced the highest layoffs?


How did layoffs change over time?


Which companies ranked highest in layoffs each year?



SQL Concepts Used


CTEs (WITH)


Window Functions


ROW_NUMBER()


DENSE_RANK()


Aggregate Functions


GROUP BY


ORDER BY


Date Functions


Data Cleaning Techniques


NULL Handling


String Functions



Files Included
01_data_cleaning.sql
Contains the full data cleaning and preparation process.
02_exploratory_data_analysis.sql
Contains SQL queries used to analyze layoffs and identify trends.

Key Insights


Several technology companies experienced the highest layoffs.


Layoffs increased significantly during certain years.


Some industries were impacted more heavily than others.


The United States had one of the highest total layoff counts.


Layoff patterns varied across time periods and company stages.



What I Learned
Through this project, I strengthened my understanding of:


SQL data cleaning workflows


Window functions and ranking


Exploratory data analysis using SQL


Organizing SQL projects for GitHub portfolios


Writing cleaner and more readable SQL queries



Author
Fiona Andriani Putri
