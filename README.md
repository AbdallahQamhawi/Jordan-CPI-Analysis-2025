# Jordan-CPI-Analysis-2025
End-to-end CPI analytics using Python, SQL, and Power BI (Jordan, 2025)
Jordan CPI Analysis 2025

End to End Cost of Living Analytics Using Python, SQL, and Power BI

Project Overview

This project presents a comprehensive end to end analysis of Jordan’s Consumer Price Index (CPI) for the year 2025 using official government data. The objective is not only to report inflation figures, but to explain inflation dynamics by identifying the categories driving price changes and assessing whether household essentials are the primary source of cost of living pressure.

The project follows a complete analytics lifecycle beginning with raw data ingestion and ending with decision oriented business intelligence reporting.

Raw Government Data to Python Processing to SQL Data Warehouse to Power BI Dashboard

Key Analytical Questions

Where does inflation stand in 2025
How is inflation evolving month by month
Which expenditure categories are driving inflation pressure
Are essential household items the main contributors to rising prices

Data Source

Provider
Department of Statistics Jordan

Dataset
Monthly Consumer Price Index Base Year 2018 equals 100

Coverage
January 2025 to December 2025

Granularity
Category by Month

Languages
Arabic and English category labels preserved

Data Pipeline Architecture
Python Data Preparation

Python was used to transform the official CPI Excel files into analysis ready datasets. Government statistical files are presentation oriented and require careful structural inspection before transformation.

Key steps included
Reading Excel files without headers to prevent misinterpretation
Dynamic detection of monthly columns
Cleaning and standardizing category names while preserving official meaning
Constructing a hierarchical category structure including All Items Main Categories and Sub Categories
Reshaping data into a long tidy format suitable for analytics
Generating fact and dimension tables for downstream use

The output of this phase consists of clean dimension and fact datasets.

SQL Data Warehouse Modeling

The processed data was stored in a relational database using a star schema to ensure analytical integrity and scalability.

Tables created include
dim_date which represents the time dimension
dim_category which contains category hierarchy and essential classification
fact_cpi which stores CPI values and relative weights at the category month level

The warehouse design ensures
One row per category per month
Clear parent child category relationships
Separation of dimensions and facts
Referential integrity across all tables

Power BI Analytics and Visualization

Power BI was used to translate CPI mechanics into interpretable insights suitable for decision makers. The data model was imported directly from the warehouse structure to preserve consistency and avoid duplication.

The dashboard consists of three analytical pages.

Overview
Provides a high level snapshot of inflation including headline CPI month over month change year to date change overall trend and top contributing categories.

Drivers Breakdown
Decomposes inflation pressure using contribution analysis. This page identifies which categories drive inflation based on both price movement and household importance rather than CPI level alone.

Essentials Analysis
Evaluates whether inflation pressure originates from essential household spending. This page compares headline CPI with essential CPI and examines essential sub category behavior.

Analytical Framework
Contribution Based Analysis

Rather than focusing solely on CPI index levels this project emphasizes contribution analysis.

Conceptually contribution reflects
Price movement multiplied by household importance weight

This approach ensures that categories are evaluated based on their real influence on overall inflation rather than price changes in isolation.

Essentials versus Non Essentials

Categories were classified into essential and non essential groups based on non discretionary household consumption. This classification enables assessment of household cost pressure beyond headline inflation figures.

A key finding is that essential inflation remained below headline CPI during 2025 indicating that inflation pressure was driven primarily by non essential and discretionary categories.

An explanatory annotation is included in the dashboard clarifying that CPI contribution depends on both relative weights and price movements and does not directly reflect household necessity.

Data Validation

Multiple validation checks were performed to ensure data accuracy and consistency including
Verification of unique category month combinations
Referential integrity checks between fact and dimension tables
Expected row count validation
Consistency checks for contribution shares

Repository Structure

Jordan-CPI-Analysis-2025

data
raw
processed

notebooks
CPI_Data_Preparation.ipynb

sql
schema.sql
tables.sql
validation_queries.sql

powerbi
Jordan_CPI_Analysis_2025.pbix

README.md

Outcome

This project demonstrates
End to end analytics capability
Strong understanding of CPI mechanics
Data modeling and validation discipline
Ability to translate raw government data into policy relevant insights

The project is designed to be portfolio ready academically defensible and aligned with industry best practices.

Future Extensions

Extend the analysis to multiple years to enable year over year comparison
Incorporate exchange rate or tariff effects
Expand essential classification methodology
