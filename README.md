🛒 Online Shopping Behaviour Analysis Project
📌 Project Overview

The Online Shopping Behaviour Analysis Project focuses on analyzing customer shopping behaviour, purchasing patterns, product preferences, and shopping trends using SQL.

The main objective of this project is to understand how customers interact with online shopping platforms and identify meaningful business insights that can help businesses improve customer satisfaction, marketing strategies, and sales performance.

🎯 Project Objectives
Analyze the total number of customers.
Identify unique customers and customer demographics.
Understand purchasing patterns across different customer segments.
Analyze sales performance and purchase amounts.
Identify the most popular product categories.
Understand customer preferences and shopping frequency.
Generate actionable business insights from the dataset.
🛠️ Tools & Technologies
Database: MySQL
Query Language: SQL
Analysis: Data Analysis and Exploration
Platform: MySQL Workbench
Documentation: GitHub
📂 Dataset Description

The project uses an Online Shopping Behaviour dataset containing customer-related information and purchasing behaviour.

The dataset includes information such as:

Customer ID
Gender
Age
Category
Purchase Amount
Frequency of Purchases
Shopping Preferences
Payment Information
Shipping Information
Discount and Promotional Preferences

Note: Actual column names and descriptions should be adjusted according to the dataset schema.

🔍 SQL Analysis Performed
1. Customer Analysis
Total number of customer records.
Total number of unique customers.
Gender-wise customer distribution.
Customer demographic analysis.
2. Sales Analysis
Total purchase amount.
Average purchase amount.
Highest and lowest purchase amount.
Sales analysis by product category.
3. Product Category Analysis
Number of purchases by category.
Most popular product categories.
Category-wise customer preferences.
4. Customer Behaviour Analysis
Shopping frequency analysis.
Customer purchasing patterns.
Payment method preferences.
Shipping method preferences.
5. Business Insights
Identify customer purchasing trends.
Understand customer preferences.
Discover popular product categories.
Support data-driven business decisions.
💻 Sample SQL Queries

1. Total Customer Records

sql
SELECT COUNT(*) AS Total_Customers
FROM online_shopping.online_shopping_behaviour_project;


2. Total Unique Customers

sql
SELECT COUNT(DISTINCT customer_id) AS Unique_Customers
FROM online_shopping.online_shopping_behaviour_project;


3. Gender-wise Customer Count

sql
SELECT gender, COUNT(*) AS Total_Customers
FROM online_shopping.online_shopping_behaviour_project
GROUP BY gender;


4. Average Purchase Amount

sql
SELECT AVG(purchase_amount) AS Average_Purchase
FROM online_shopping.online_shopping_behaviour_project;


5. Category-wise Purchases

sql
SELECT category, COUNT(*) AS Total_Purchases
FROM online_shopping.online_shopping_behaviour_project
GROUP BY category
ORDER BY Total_Purchases DESC;

📊 Key Business Questions
How many customers are present in the dataset?
What is the distribution of customers by gender?
Which product category has the highest number of purchases?
What is the average purchase amount?
Which payment method is most preferred?
How frequently do customers make purchases?
Which shipping method is most commonly selected?
How do discounts influence customer purchasing behaviour?
💡 Expected Business Benefits
Better understanding of customer behaviour.
Improved marketing and promotional strategies.
Identification of popular product categories.
Better customer segmentation.
Improved customer retention strategies.
Data-driven business decision-making.
📁 Project Structure
text
Online-Shopping-Behaviour-Analysis/
│
├── Dataset/
│   └── online_shopping_behaviour.csv
│
├── SQL_Queries/
│   └── online_shopping_analysis.sql
│
├── Screenshots/
│   └── analysis_results.png
│
└── README.md

🚀 Conclusion

This project demonstrates how SQL can be used to analyze online shopping behaviour and extract meaningful insights from customer data.

By applying SQL functions such as COUNT(), SUM(), AVG(), MAX(), MIN(), GROUP BY, ORDER BY, and HAVING, the project explores customer demographics, purchasing trends, and product preferences.

The analysis helps demonstrate practical SQL skills and the ability to solve real-world business problems using data.

👨‍💻 Author

Data Analyst Portfolio Project

Skills Demonstrated
