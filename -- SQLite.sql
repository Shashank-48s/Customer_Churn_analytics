-- SQLite
SELECT * FROM churn LIMIT 10;

✅ 1. Total Customers
SELECT COUNT(*) AS total_customers FROM churn;

✅ 2. How Many Customers Left the Company?
SELECT COUNT(*) AS churned_customers
FROM churn
WHERE Churn = 'Yes';


✅ 3. What % of Customers Left?
SELECT 
  ROUND(
    (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2
  ) AS churn_percentage
FROM churn;


✅ 4. Gender-wise Churn Count
SELECT 
  gender,
  COUNT(*) AS total,
  SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned
FROM churn
GROUP BY gender;


✅ 5. Contract Type vs Churn
SELECT 
  Contract,
  COUNT(*) AS total,
  SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned
FROM churn
GROUP BY Contract;


✅ 6. Who Leaves More: Seniors or Non-Seniors?
SELECT 
  SeniorCitizen,
  COUNT(*) AS total,
  SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned
FROM churn
GROUP BY SeniorCitizen;


✅ 1. Which Payment Method Has the Highest Churn?
SELECT 
  PaymentMethod, 
  COUNT(*) AS total_customers, 
  SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND( (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2 ) AS churn_rate
FROM churn
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;


✅ 2. Do Month-to-Month Customers Leave More?
SELECT 
  Contract, 
  COUNT(*) AS total_customers, 
  SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND( (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2 ) AS churn_rate
FROM churn
GROUP BY Contract
ORDER BY churn_rate DESC;


✅ 3. Does Higher Monthly Charges = More Churn?
SELECT 
  CASE 
    WHEN MonthlyCharges < 30 THEN 'Low ( < $30 )'
    WHEN MonthlyCharges BETWEEN 30 AND 70 THEN 'Medium ( $30 - $70 )'
    ELSE 'High ( > $70 )'
  END AS MonthlyChargeCategory,
  COUNT(*) AS total_customers,
  SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND( (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2 ) AS churn_rate
FROM churn
GROUP BY MonthlyChargeCategory
ORDER BY churn_rate DESC;


✅ 4. Does Tenure (Loyalty) Affect Churn?
SELECT 
  CASE 
    WHEN tenure <= 12 THEN '0-1 Year'
    WHEN tenure BETWEEN 13 AND 36 THEN '1-3 Years'
    ELSE '3+ Years'
  END AS TenureCategory,
  COUNT(*) AS total_customers,
  SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND( (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2 ) AS churn_rate
FROM churn
GROUP BY TenureCategory
ORDER BY churn_rate DESC;


✅ 5. Which Internet Service Has the Highest Churn?
SELECT 
  InternetService, 
  COUNT(*) AS total_customers, 
  SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND( (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2 ) AS churn_rate
FROM churn
GROUP BY InternetService
ORDER BY churn_rate DESC;


✅ 6. Does Lack of Tech Support Increase Churn?
SELECT 
  TechSupport, 
  COUNT(*) AS total_customers, 
  SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND( (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2 ) AS churn_rate
FROM churn
GROUP BY TechSupport
ORDER BY churn_rate DESC;
