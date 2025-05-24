# Data-Cleaning-Analysis-SQL

# SQL Data Cleaning and Exploratory Analysis Project

This project demonstrates my ability to clean, analyze, and derive insights from a dataset using SQL. The dataset used is `layoffs_stagging`, which contains information about company layoffs, including details such as company name, location, industry, total layoffs, percentage of layoffs, date, and funds raised.

## Project Overview

### 1. **Data Cleaning**
   - **Objective**: Clean the dataset to ensure it is accurate, consistent, and ready for analysis.
   - **Steps**:
     - Identified and removed duplicate records using `ROW_NUMBER()` and `PARTITION BY`.
     - Standardized data (e.g., trimmed company names, updated industry names, fixed country names).
     - Handled missing and inconsistent data (e.g., NULL values, blank entries).
     - Converted date formats and updated the table schema to use the correct data types.
     - Removed irrelevant rows (e.g., rows with no layoff data).

   **Key SQL Techniques Used**:
   - `ROW_NUMBER()` for duplicate detection.
   - `UPDATE` and `JOIN` for data standardization.
   - `ALTER TABLE` for schema modifications.
   - `DELETE` for removing unnecessary rows.

### 2. **Exploratory Data Analysis (EDA)**
   - **Objective**: Analyze the cleaned dataset to uncover trends, patterns, and insights.
   - **Key Analyses**:
     - Total layoffs by company, industry, country, and year.
     - Time-based trends (monthly and yearly layoffs).
     - Rolling total of layoffs over time.
     - Top 5 companies with the most layoffs by year.

   **Key SQL Techniques Used**:
   - Aggregations (`SUM`, `GROUP BY`).
   - Window functions (`SUM() OVER`, `DENSE_RANK()`).
   - Common Table Expressions (CTEs) for modular queries.
   - Date functions (`YEAR`, `SUBSTRING`, `DATE_FORMAT`).

## Dataset
The dataset used in this project is `layoffs_stagging`, which contains the following columns:
- `company`: Name of the company.
- `location`: Location of the company.
- `industry`: Industry sector.
- `total_laid_off`: Total number of employees laid off.
- `percentage_laid_off`: Percentage of employees laid off.
- `date`: Date of the layoff event.
- `stage`: Stage of the company (e.g., IPO, Acquired).
- `country`: Country where the layoff occurred.
- `funds_raised_millions`: Funds raised by the company in millions.

## Key Insights
1. **Top Companies by Layoffs**:
   - Companies like [Company A] and [Company B] had the highest number of layoffs.
2. **Industry Trends**:
   - The [Industry X] sector experienced the most layoffs, accounting for [X]% of total layoffs.
3. **Time-Based Trends**:
   - Layoffs peaked in [Month/Year], with a rolling total of [X] employees laid off.
4. **Geographical Trends**:
   - [Country X] had the highest number of layoffs, followed by [Country Y].


