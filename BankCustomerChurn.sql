-- Business Problem:
-- Identify characteristics associated with customers who leave the bank.


-- Phase 1 - Data Understanding 
SELECT 
	*
FROM Bank_Customer_Churn_Prediction bccp; 

-- Number of rows 
SELECT COUNT(*)
FROM bank_customer_churn_prediction bccp
;

-- The different countries of the customers 
SELECT DISTINCT country
FROM Bank_Customer_Churn_Prediction bccp; 

-- Phase 2 -- Data Quality Assessment 

-- Checking Duplicates in table
SELECT customer_id, COUNT(*) AS occurrences
FROM Bank_Customer_Churn_Prediction bccp 
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Missing ages
SELECT COUNT(*)
FROM Bank_Customer_Churn_Prediction
WHERE age IS NULL;

-- Missing credit scores
SELECT COUNT(*)
FROM Bank_Customer_Churn_Prediction
WHERE credit_score IS NULL;

-- Age Range
SELECT
    MIN(age),
    MAX(age)
FROM Bank_Customer_Churn_Prediction;

-- Phase 3 -- Metrics of Customer churn 

-- Total Customers
SELECT 
	COUNT(customer_id) AS total_customers,
	SUM(churn) AS total_churn,
	ROUND (
	(SUM(churn) * 1.0 / COUNT(customer_id)) * 100 ,
	2)
		AS total_churn_percentage
FROM Bank_Customer_Churn_Prediction bccp;

SELECT COUNT(*)
FROM Bank_Customer_Churn_Prediction bccp 
WHERE churn = 1;

-- Geography Exploratory Analysis 

-- How many countries exist? 
SELECT DISTINCT
Country
FROM Bank_Customer_Churn_Prediction bccp; 

-- How many customers in each country

SELECT 
	Country,
	COUNT(customer_id) AS customer_count
FROM Bank_Customer_Churn_Prediction bccp
GROUP BY country;


-- How many customers churned in each country? 

SELECT 
	Country,
	COUNT(customer_id)
FROM Bank_Customer_Churn_Prediction bccp
WHERE churn = 1
GROUP BY country;

-- Churn Rate by Country 
SELECT 
	Country,
	COUNT(customer_id) AS country_count,
	SUM(Churn) AS total_churn,
	ROUND(
		(SUM(Churn)) / (COUNT(customer_id) * 1.0) * 100,
		2
	)AS churn_percentage
FROM Bank_Customer_Churn_Prediction bccp
GROUP BY country; 

-- Geography Findings

-- Finding #1:
-- Germany has the highest churn rate 

-- Finding #2:
-- France has the lowest churn rate 

-- Finding #3: 
-- The difference between highest and lowest churn rates is 16.29%

-- Gender Exploratory Analysis
-- Does churn vary by gender?

SELECT 
	Gender,
	COUNT(customer_id) AS total_customers,
	SUM(Churn) AS total_churn,
	ROUND(
		(SUM(Churn) * 1.0 / COUNT(customer_id)) * 100,
		2
		
	) AS gender_churn_rate
FROM bank_customer_churn_prediction bccp
GROUP BY Gender; 

-- Gender Findings

-- Finding #1:
-- Females have a churn rate ot 25.07% while males have a churn rate of 16.46%

-- Finding #2:
-- Females tend to have a higher churn rate than males

-- Age Analysis 

-- Does age affect churn? 

SELECT
    AVG(Age) AS avg_age,
    COUNT(*) AS customers,
    churn
FROM bank_customer_churn_prediction bccp
GROUP BY Churn;

-- Finding #1: 
-- Customers who had churned had an average age of 44.84

-- Finding #2: 
-- Customers who remained had an average age of 37.41

-- Finding #3: 
-- Churned customers were approximately 7.4 years older on average than customers who remained

-- Credit Score Analysis 

SELECT
    AVG(credit_score) AS avg_credit,
    COUNT(*) AS customers,
    churn
FROM bank_customer_churn_prediction bccp
GROUP BY Churn;

-- Finding #1: 
-- Customers who had churned had an average credit score of 645.35

-- Finding #2: 
-- Customers who remained had an average credit score of 651.85

-- Finding #3: 
-- Churned customers were approximately 6.5 points lower on average than customers who remained

-- Tenure Analysis 
-- Does Customer tenure affect churn?

SELECT
    AVG(tenure) AS avg_tenure,
    COUNT(*) AS customers,
    churn
FROM bank_customer_churn_prediction bccp
GROUP BY Churn;

-- Finding #1: 
-- Customers who had churned had an average tenure of 4.93

-- Finding #2: 
-- Customers who remained had an average tenure of 5.03

-- Finding #3: 
-- Churned customers were approximately 0.10 tenure lower on average than customers who remained

-- Balance Analysis 

SELECT
    AVG(balance) AS avg_balance,
    COUNT(*) AS customers,
    churn
FROM bank_customer_churn_prediction bccp
GROUP BY Churn;

-- Finding #1: 
-- Customers who had churned had an average account balance of 91108.54

-- Finding #2: 
-- Customers who remained had an average account balance of 72745.30

-- Finding #3: 
-- Churned customers were approximately 18363.24 higher on average balance than customers who remained

-- Estimated Salary Analysis 

SELECT
    AVG(estimated_salary) AS avg_est_salary,
    COUNT(*) AS customers,
    churn
FROM bank_customer_churn_prediction bccp
GROUP BY Churn;

-- Finding #1: 
-- The average salary difference between churned and retained customers was only about $1,727.

-- Finding #2: 
-- Estimated salary appears to have a weak relationship with churn, as churned and retained customers had very similar average salaries.

-- Active Member Analysis 
-- Are active members less likely to churn?

SELECT 
	active_member,
	COUNT(customer_id) AS total_customers,
	SUM(Churn) AS total_churn,
	ROUND(
		(SUM(Churn) * 1.0 / COUNT(customer_id)) * 100,
		2
		
	) AS active_member_churn_rate
FROM bank_customer_churn_prediction bccp
GROUP BY active_member; 

-- Finding #1: 
-- Active members had a churn rate of 14.27%

-- Finding #2: 
-- inactive members had a churn rate of 26.85%

-- Finding #3: 
-- Inactive members experienced a churn rate 12.58 percentage points higher than active members.

-- Credit Card Status Analysis 
-- Does having a credit card affect churn?

SELECT 
	credit_card,
	COUNT(customer_id) AS total_customers,
	SUM(Churn) AS total_churn,
	ROUND(
		(SUM(Churn) * 1.0 / COUNT(customer_id)) * 100,
		2
		
	) AS credit_card_churn_rate
FROM bank_customer_churn_prediction bccp
GROUP BY credit_card; 

-- Finding #1: 
-- Customers without a credit card had a churn rate of 20.18%

-- Finding #2: 
-- Customers with a credit card had a churn rate of 20.81%

-- Finding #3: 
-- Credit card ownership appears to have little relationship with churn, as the difference in churn rates was only 0.63 percentage points.

-- ==========================================
-- FINAL FINDINGS
-- ==========================================
-- 1. Germany exhibited the highest churn rate.

-- 2. Female customers churned more frequently than male customers.

-- 3. Churned customers were approximately 7.4 years older.

-- 4. Churned customers maintained balances roughly $18,000 higher.

-- 5. Inactive members were nearly twice as likely to churn.

-- 6. Tenure, salary, and credit card ownership showed little relationship with churn.


-- Investigative Questions 

-- 1. Which country has the highest inactive-member churn rate?

SELECT
	country,
	COUNT(customer_id) AS total_customers,
	SUM(churn) AS total_churn,
	ROUND(
		(SUM(Churn) * 1.0 / COUNT(customer_id)) * 100, 2
		
	) AS churn_rate
FROM Bank_Customer_Churn_Prediction bccp
WHERE active_member = 0
GROUP BY country
ORDER BY churn_rate DESC;

-- Finding #1:
-- Germany exhibited the highest inactive-member churn rate at 41.08%.

-- Finding #2:
-- France and Spain showed substantially lower inactive-member churn rates.

-- Finding #3:
-- Inactive customers in Germany appear to be particularly vulnerable to churn compared to inactive customers in other countries.

-- 2. Which age group has the highest churn rate?

SELECT
	COUNT(customer_id) AS total_customers,
	SUM(churn) AS total_churn,
	ROUND (
		SUM(churn) * 1.0 / COUNT(customer_id) * 100, 2
		
	) AS churn_rate,
	CASE 
		WHEN age <= 29 THEN 'Young Adults'
		WHEN age <= 49 THEN 'Adults '
		WHEN age <= 59 THEN 'Older Adults'
		ELSE 'Senior Citizens'
	END AS age_group
FROM Bank_Customer_Churn_Prediction bccp
GROUP BY age_group
ORDER BY churn_rate DESC; 

-- Finding #1:
-- Older Adults (ages 50-59) showed the highest churn rate of about 56.04%

-- Finding #2:
-- Adults (ages 30-49) and Young Adults (29 and under) showed significantly lower churn rate

-- Finding #3:
-- Customers in the 50–59 age segment appear to be
-- significantly more vulnerable to churn than younger customers.

-- 3. What is the average balance of churned customers by country?

SELECT
	country,
	ROUND(AVG(balance),2) AS avg_balance,
	SUM(churn) AS total_churn
FROM Bank_Customer_Churn_Prediction bccp
WHERE churn = 1
GROUP BY country; 

-- Finding #1:
-- Churned customers in Germany maintained the highest average balance,
-- approximately $120,361.

-- Finding #2:
-- Churned customers in France and Spain maintained lower average balances than churned customers in Germany.

-- Finding #3:
-- High-balance customers appear to be an important segment of churned customers, particularly in Germany.


-- 4. Are older inactive customers especially likely to churn?

SELECT
	COUNT(*) AS total_inactive_members,
	SUM(churn) AS total_churn,
	ROUND (
		SUM(churn) * 1.0 / COUNT(customer_id) * 100, 2
		
	) AS churn_rate,
	CASE 
		WHEN age <= 29 THEN 'Young Adults'
		WHEN age <= 49 THEN 'Adults'
		WHEN age <= 59 THEN 'Older Adults'
		ELSE 'Senior Citizens'
	END AS age_group
FROM Bank_Customer_Churn_Prediction bccp
WHERE active_member = 0
GROUP BY age_group
ORDER BY churn_rate DESC; 

-- Finding #1:
-- Inactive customers in the Older Adult (50–59) and Senior Citizen (60+) age groups
-- exhibited substantially higher churn rates than inactive Adults (30–49)
-- and Young Adults (29 and under).

-- Finding #2:
-- Churn risk among inactive customers increased with age.

-- Finding #3:
-- Older inactive customers appear to represent a particularly high-risk segment for customer attrition.


-- ==========================================
-- BUSINESS CONCLUSIONS
-- ==========================================

-- Germany exhibited the highest customer churn rate among all countries analyzed.

-- Inactive customers were substantially more likely to churn than active customers.

-- Customers aged 50 and older experienced the highest churn rates.

-- Customers who churned tended to maintain higher account balances than customers who remained.

-- Credit card ownership showed little relationship with customer churn.

-- Estimated salary showed little relationship with customer churn.


-- ==========================================
-- RECOMMENDATIONS
-- ==========================================

-- Develop customer engagement programs targeting inactive customers.

-- Implement retention initiatives for customers aged 50 and older.

-- Investigate potential causes of elevated churn in Germany.

-- Monitor high-balance customer segments and proactively address retention risks.

-- Prioritize retention efforts on variables that demonstrated stronger relationships with churn rather than credit card ownership or salary.


-- Build the 5 final dashboard queries and save them in a new section:

-- DASHBOARD DATASETS

-- KPI Cards

SELECT 
	COUNT(Customer_id) AS total_customers,
	SUM(churn) AS total_churned,
	ROUND(
	SUM(churn) * 1.0 / COUNT(customer_id) * 100, 2 
	) AS churn_rate
FROM Bank_Customer_Churn_Prediction bccp; 

-- Country Analysis 

SELECT 
	Country,
	COUNT(customer_id) AS country_count,
	SUM(Churn) AS total_churn,
	ROUND(
		(SUM(Churn)) / (COUNT(customer_id) * 1.0) * 100,
		2
	)AS churn_rate
FROM Bank_Customer_Churn_Prediction bccp
GROUP BY country; 

-- Age Analysis 

SELECT
	COUNT(customer_id) AS total_customers,
	SUM(churn) AS total_churn,
	ROUND (
		SUM(churn) * 1.0 / COUNT(customer_id) * 100, 2
		
	) AS churn_rate,
	CASE 
		WHEN age <= 29 THEN 'Young Adults'
		WHEN age <= 49 THEN 'Adults '
		WHEN age <= 59 THEN 'Older Adults'
		ELSE 'Senior Citizens'
	END AS age_group
FROM Bank_Customer_Churn_Prediction bccp
GROUP BY age_group
ORDER BY churn_rate DESC; 


-- Activity Analysis 

SELECT 
	active_member,
	COUNT(customer_id) AS total_customers,
	SUM(Churn) AS total_churn,
	ROUND(
		(SUM(Churn) * 1.0 / COUNT(customer_id)) * 100,
		2
		
	) AS active_member_churn_rate
FROM bank_customer_churn_prediction bccp
GROUP BY active_member; 

-- Balance Analysis 

SELECT
	country,
	ROUND(AVG(balance),2) AS avg_balance,
	COUNT(*) AS total_churn
FROM Bank_Customer_Churn_Prediction bccp
WHERE churn = 1
GROUP BY country; 
