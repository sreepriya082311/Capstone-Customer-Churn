CREATE DATABASE customer_churn_analysis;

USE customer_churn_analysis;
SHOW TABLES;
SELECT COUNT(*)
FROM cleaned_customer_churn;

SELECT *
FROM cleaned_customer_churn
LIMIT 5;

USE customer_churn_analysis;

-- BUSINESS QUESTION 1:
-- What is the total number of customers?
SELECT COUNT(*) AS Total_Customers
FROM cleaned_customer_churn;

-- BUSINESS QUESTION 2:
-- How many customers have churned and how many have stayed?
SELECT
    Churn,
    COUNT(*) AS Customer_Count
FROM cleaned_customer_churn
GROUP BY Churn;

-- BUSINESS QUESTION 3:
-- What is the churn count for each contract type?
SELECT
    Contract,
    Churn,
    COUNT(*) AS Customer_Count
FROM cleaned_customer_churn
GROUP BY Contract, Churn
ORDER BY Contract, Churn;

-- BUSINESS QUESTION 4:
-- Which contract type has the highest number of churned customers?
SELECT
    Contract,
    COUNT(*) AS Churned_Customers
FROM cleaned_customer_churn
WHERE Churn = 'Yes'
GROUP BY Contract
ORDER BY Churned_Customers DESC;

-- BUSINESS QUESTION 5:
-- What is the average monthly charge by churn status?
SELECT
    Churn,
    ROUND(AVG(MonthlyCharges), 2) AS Average_Monthly_Charge
FROM cleaned_customer_churn
GROUP BY Churn;

-- BUSINESS QUESTION 6:
-- Which internet service type has the highest churn?
SELECT
    InternetService,
    COUNT(*) AS Churned_Customers
FROM cleaned_customer_churn
WHERE Churn = 'Yes'
GROUP BY InternetService
ORDER BY Churned_Customers DESC;

-- BUSINESS QUESTION 7:
-- What is the average tenure by churn status?
SELECT
    Churn,
    ROUND(AVG(tenure), 2) AS Average_Tenure_Months
FROM cleaned_customer_churn
GROUP BY Churn;

-- BUSINESS QUESTION 8:
-- Which payment method has the highest churn?
SELECT
    PaymentMethod,
    COUNT(*) AS Churned_Customers
FROM cleaned_customer_churn
WHERE Churn = 'Yes'
GROUP BY PaymentMethod
ORDER BY Churned_Customers DESC;

-- BUSINESS QUESTION 9:
-- What is the churn count by senior citizen status?
SELECT
    SeniorCitizen,
    COUNT(*) AS Churned_Customers
FROM cleaned_customer_churn
WHERE Churn = 'Yes'
GROUP BY SeniorCitizen
ORDER BY Churned_Customers DESC;

-- BUSINESS QUESTION 10:
-- Which contract type has the highest average monthly charges?
SELECT
    Contract,
    ROUND(AVG(MonthlyCharges), 2) AS Average_Monthly_Charges
FROM cleaned_customer_churn
GROUP BY Contract
ORDER BY Average_Monthly_Charges DESC;

-- =========================================
-- SQL VIEW 1: CUSTOMER CHURN SUMMARY
-- Purpose: Display customer count and percentage by churn status.
-- =========================================
USE customer_churn_analysis;

CREATE VIEW vw_churn_summary AS
SELECT
    Churn,
    COUNT(*) AS Customer_Count,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM cleaned_customer_churn),
        2
    ) AS Customer_Percentage
FROM cleaned_customer_churn
GROUP BY Churn;

USE customer_churn_analysis;

SELECT *
FROM vw_churn_summary;

-- SQL VIEW 2: CONTRACT-WISE CHURN SUMMARY
-- Purpose: Show customer churn count by contract type.
CREATE VIEW vw_contract_churn AS
SELECT
    Contract,
    Churn,
    COUNT(*) AS Customer_Count
FROM cleaned_customer_churn
GROUP BY Contract, Churn;
SELECT *
FROM vw_contract_churn;

-- SQL VIEW 3: INTERNET SERVICE CHURN SUMMARY
-- Purpose: Show churn count by internet service type.
CREATE VIEW vw_internet_churn AS
SELECT
    InternetService,
    Churn,
    COUNT(*) AS Customer_Count
FROM cleaned_customer_churn
GROUP BY InternetService, Churn;
SELECT *
FROM vw_internet_churn;

-- SQL VIEW 4: PAYMENT METHOD CHURN SUMMARY
-- Purpose: Show customer churn count by payment method.
CREATE VIEW vw_payment_churn AS
SELECT
    PaymentMethod,
    Churn,
    COUNT(*) AS Customer_Count
FROM cleaned_customer_churn
GROUP BY PaymentMethod, Churn;
SELECT *
FROM vw_payment_churn;

SHOW COLUMNS FROM cleaned_customer_churn;
SHOW COLUMNS FROM cleaned_customer_churn
LIKE 'TenureGroup';

-- SQL VIEW 5: TENURE GROUP CHURN SUMMARY
-- Purpose: Show customer churn count by tenure group.
CREATE VIEW vw_tenure_churn AS
SELECT
    TenureGroup,
    Churn,
    COUNT(*) AS Customer_Count
FROM cleaned_customer_churn
GROUP BY TenureGroup, Churn;
SELECT *
FROM vw_tenure_churn;

-- SQL VIEW 6: SENIOR CITIZEN CHURN SUMMARY
-- Purpose: Show customer churn by senior citizen status.
CREATE VIEW vw_senior_churn AS
SELECT
    SeniorCitizen,
    Churn,
    COUNT(*) AS Customer_Count
FROM cleaned_customer_churn
GROUP BY SeniorCitizen, Churn;
SELECT *
FROM vw_senior_churn;

-- SQL VIEW 7: MONTHLY CHARGES CHURN SUMMARY
-- Purpose: Compare average monthly charges by churn status.
CREATE VIEW vw_monthly_charges_churn AS
SELECT
    Churn,
    ROUND(AVG(MonthlyCharges), 2) AS Average_Monthly_Charges,
    COUNT(*) AS Customer_Count
FROM cleaned_customer_churn
GROUP BY Churn;
SELECT *
FROM vw_monthly_charges_churn;

-- SQL VIEW 8: PAYMENT METHOD CHURN RATE
-- Purpose: Calculate churn percentage by payment method.
CREATE VIEW vw_payment_churn_rate AS
SELECT
    PaymentMethod,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Churn_Percentage
FROM cleaned_customer_churn
GROUP BY PaymentMethod;
SELECT *
FROM vw_payment_churn_rate;


-- SQL VIEW 9: CONTRACT-WISE CHURN RATE
-- Purpose: Calculate churn percentage by contract type.
CREATE VIEW vw_contract_churn_rate AS
SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Churn_Percentage
FROM cleaned_customer_churn
GROUP BY Contract;
SELECT *
FROM vw_contract_churn_rate;


-- SQL VIEW 10: TENURE-WISE CHURN RATE
-- Purpose: Calculate churn percentage by tenure group.
CREATE VIEW vw_tenure_churn_rate AS
SELECT
    TenureGroup,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Churn_Percentage
FROM cleaned_customer_churn
GROUP BY TenureGroup;
SELECT *
FROM vw_tenure_churn_rate;

SHOW FULL TABLES
WHERE Table_type = 'VIEW';

-- BUSINESS QUESTION 11:
-- What is the churn count and churn percentage by contract type?
SELECT
    c.Contract,
    c.Total_Customers,
    ch.Churned_Customers,
    c.Churn_Percentage
FROM vw_contract_churn_rate AS c
INNER JOIN (
    SELECT
        Contract,
        Customer_Count AS Churned_Customers
    FROM vw_contract_churn
    WHERE Churn = 'Yes'
) AS ch
ON c.Contract = ch.Contract;


-- BUSINESS QUESTION 12:
-- Rank contract types by churn percentage.
SELECT
    Contract,
    Total_Customers,
    Churned_Customers,
    Churn_Percentage,
    RANK() OVER (
        ORDER BY Churn_Percentage DESC
    ) AS Churn_Rank
FROM vw_contract_churn_rate;