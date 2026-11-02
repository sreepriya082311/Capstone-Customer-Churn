# Customer Churn Analysis

## Project Overview
Customer Churn Analysis is a data analytics capstone project based on the Telecommunications domain. The project analyses customer data to identify churn patterns and generate business insights that can support customer retention.

## Project Objectives
- Analyse customer churn behaviour.
- Identify customer segments with higher churn rates.
- Understand the relationship between churn, tenure, contract type and payment method.
- Build an interactive Power BI dashboard.
- Provide data-driven customer retention recommendations.

## Tools & Technologies
- **Python:** Data cleaning and preprocessing using Pandas and NumPy.
- **MySQL:** Data storage, SQL queries and views.
- **Power BI:** Data modelling, DAX measures and interactive dashboards.

## Dataset
- Dataset: Telco Customer Churn
- Total Records: 7,043
- Original Columns: 21
- Derived Column: TenureGroup
- Duplicate Records: 0

## Project Workflow

1. **Python – Data Cleaning**
   - Loaded the dataset using Pandas.
   - Checked missing values and duplicates.
   - Handled missing TotalCharges values.
   - Converted data types and checked outliers.
   - Created TenureGroup categories.

2. **MySQL – Data Analysis**
   - Created the customer_churn_analysis database.
   - Imported the cleaned customer dataset.
   - Developed 12 business-focused SQL queries.
   - Created 10 SQL views for analysis.

3. **Power BI – Dashboard Development**
   - Connected Power BI to the MySQL dataset.
   - Created a Churn Status calculated column.
   - Developed DAX measures and KPI cards.
   - Built two interactive dashboard pages.

## Key Results
- Total Customers: 7,043
- Churned Customers: 1,869
- Retained Customers: 5,174
- Overall Churn Rate: 26.54%
- Retention Rate: 73.46%
- Average Tenure of Churned Customers: 17.98 months
- Average Tenure of Retained Customers: 37.57 months

## Power BI Dashboard Pages
1. Customer Churn Overview
2. Detailed Churn Analysis

## Business Recommendations
- Focus on customers during their early tenure.
- Monitor customer segments with higher churn rates.
- Improve onboarding and customer support.
- Regularly track churn and retention KPIs.

## Project Deliverables
- Python Jupyter Notebook (`.ipynb`)
- MySQL SQL Script (`.sql`)
- Power BI Dashboard (`.pbix`)
- Project Report (`.docx`)
- Dashboard Screenshots (`.png`)

## Conclusion
This project demonstrates an end-to-end data analytics workflow using Python, MySQL and Power BI. It transforms raw customer data into meaningful insights that can help businesses understand churn behaviour and improve customer retention.
