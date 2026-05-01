# Colorado Real Estate Market Analysis (SQL)

## 📌 Project Overview
This project analyzes a Colorado real estate dataset to identify pricing patterns, property characteristics, and potential market trends. The goal is to practice data cleaning and exploratory data analysis (EDA) using SQL.

## 🗂 Dataset
- Source: Kaggle (Colorado Real Estate Market dataset)
- The dataset includes information such as property type, price, square footage, number of bedrooms and bathrooms, and other property features.

## 🛠 Tools Used
- MySQL
- SQL (Data Cleaning & EDA)

## 🧹 Data Cleaning Process
The dataset required several cleaning steps before analysis:
- Removed duplicate records using `ROW_NUMBER()`
- Trimmed whitespace from text fields
- Replaced blank values with NULLs using `NULLIF()` and `TRIM()`
- Converted columns (e.g., sqft, beds, baths) to appropriate numeric data types
- Checked for inconsistent or non-numeric values using `REGEXP`

## 📊 Exploratory Data Analysis
After cleaning the data, I explored:
- Average property prices by property type
- Price per square foot
- Distribution of property features (beds, baths, garage)
- Minimum and maximum values for key variables

## 🔍 Key Findings
- Property prices vary significantly depending on property type
- Some listings contain 0 values for bedrooms or bathrooms, which may represent land or incomplete data
- Price per square foot provides a better comparison across different property sizes

## 💡 What I Learned
- How to clean messy datasets using SQL
- The importance of handling NULL and blank values correctly
- How to use window functions like `ROW_NUMBER()` to remove duplicates
- How to prepare data for analysis before visualization
