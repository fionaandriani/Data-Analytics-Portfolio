# Colorado Real Estate Market Analysis (SQL)

## Project Overview
I worked with a Colorado real estate dataset to explore pricing patterns and property characteristics.

## Dataset
- Source: Kaggle (Colorado Real Estate Market dataset)
- The dataset includes information such as property type, price, square footage, number of bedrooms and bathrooms, and other property features.

## Tools Used
- MySQL
- SQL (Data Cleaning & EDA)

## Data Cleaning Process
The dataset required several cleaning steps before analysis:
- Removed duplicate records using `ROW_NUMBER()`
- Trimmed whitespace from text fields
- Replaced blank values with NULLs using `NULLIF()` and `TRIM()`
- Converted columns (e.g., sqft, beds, baths) to appropriate numeric data types
- Checked for inconsistent or non-numeric values using `REGEXP`

## Exploratory Data Analysis
After cleaning the data, I looked at:
- Average property prices by property type
- Price per square foot
- Distribution of property features (beds, baths, garage)
- Minimum and maximum values for key variables

## Key Findings
- Property type has a major impact on pricing. Larger residential properties tend to have higher total prices, but not always higher price per square foot.
- Price per square foot is a more reliable metric for comparing properties, since total price can be misleading when property sizes vary significantly.
- Listings with 0 bedrooms or bathrooms appear in the dataset, which likely represent land or incomplete listings. These need to be handled carefully, as they can distort averages.
- There is a wide range in both price and property features, suggesting the dataset includes a mix of property types (e.g., residential homes, land, and possibly unfinished properties).

## What I Learned
- How to clean messy datasets using SQL
- The importance of handling NULL and blank values correctly
