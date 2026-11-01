create database online_shopping;
use online_shopping;
SELECT * FROM online_shopping.online_shopping_behaviour_project;

-- KPI  
-- Total Customer 
select count(distinct customer_id) as Total_Customer from online_shopping.online_shopping_behaviour_project;

-- Total City
select count(distinct city) as Total_city from online_shopping.online_shopping_behaviour_project;

-- Total Revenue
select sum(Order_Value) as Total_revenue from online_shopping.online_shopping_behaviour_project;

-- Total_device 
select count(distinct device_type) as total_device from online_shopping.online_shopping_behaviour_project;

-- Average age 
select avg(age) as Avg_age from online_shopping.online_shopping_behaviour_project;

-- Analysis
-- Top 10 revenue by city
select sum(order_value) as revenue , city as revenuebycity from online_shopping.online_shopping_behaviour_project 
group by city order by revenue desc limit 10;

-- Find the top 5 product categories by revenue
select Product_Category, sum(Order_Value) as revenue  from online_shopping.online_shopping_behaviour_project 
group by Product_Category order by revenue limit 5;

-- Find the top 5 cities by revenue
select city, sum(order_value) city_revn from online_shopping.online_shopping_behaviour_project 
group by city order by city_revn desc limit 5;

-- Find the number of purchases by gender
select count(purchase), gender as num_pur_gender from 
online_shopping.online_shopping_behaviour_project group by gender;

-- which product_category  are most purchase 
SELECT Product_Category, COUNT(*) AS total_purchases
FROM online_shopping.online_shopping_behaviour_project
WHERE purchase = 'Yes' GROUP BY Product_Category ORDER BY total_purchases DESC;

-- find the number of customer for each customer_types
select count(customer_id), customer_type as customer_type
from online_shopping.online_shopping_behaviour_project group by customer_type;

-- Find the number of purchases by gender
select count(purchase), gender as num_pur_gender from 
online_shopping.online_shopping_behaviour_project group by gender;

-- Find the number of purchases by device type
select device_type, count(*) as total_purchase from 
online_shopping.online_shopping_behaviour_project where Purchase = 'Yes' 
group by Device_Type order by total_purchase desc;

-- Which city has the highest number of Gender
SELECT gender, city, COUNT(*) AS total_customers
FROM online_shopping.online_shopping_behaviour_project
GROUP BY gender, city
ORDER BY total_customers DESC; 

-- Which product has received a discount
select product_category,  discount_value as dis_value from online_shopping.online_shopping_behaviour_project 
where Discount_value = "Yes"
group by product_category ;
 
-- Calculate the average order value for new customers and returning customer
select customer_type as toal_customer, avg(order_value) as avg_order from online_shopping.online_shopping_behaviour_project
group by customer_type;

-- Find which device has the highest purchase rate
select device_type, sum(order_value) as highest_purchase from online_shopping.online_shopping_behaviour_project 
group by Device_Type order by highest_purchase desc; 

-- Find purchase rate for each time-on-site group
SELECT FLOOR(Time_On_Site_Min / 5) * 5 AS time_group, COUNT(*) AS total_visitors,
    SUM(CASE WHEN Purchase = 'Yes' THEN 1 ELSE 0 END) AS purchases,
    ROUND(
        100.0 * SUM(CASE WHEN Purchase = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS purchase_rate_pct
FROM online_shopping.online_shopping_behaviour_project
GROUP BY FLOOR(Time_On_Site_Min / 5) * 5
ORDER BY time_group;

-- Do customers who click advertisements purchase more frequently
SELECT
    Ad_Clicked,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Purchase = 'Yes' THEN 1 ELSE 0 END) AS purchases,
    ROUND(
        100.0 * SUM(CASE WHEN Purchase = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS purchase_rate
FROM online_shopping.online_shopping_behaviour_project
GROUP BY Ad_Clicked;

-- Find customers whose previous purchases are greater than the average previous purchases
select customer_id from online_shopping.online_shopping_behaviour_project where previous_purchases > (
select avg(Previous_Purchases) from online_shopping.online_shopping_behaviour_project) limit 5;

-- What is the relationship between time spent and purchasing
SELECT Purchase, COUNT(*) AS total_customers,
    SUM(time_on_site_min) AS total_time_spent, AVG(time_on_site_min) AS avg_time_spent
FROM online_shopping.online_shopping_behaviour_project GROUP BY Purchase;

-- What is the relationship between pages viewed and purchasing
SELECT Purchase, Customer_Type,
    COUNT(*) AS total_customers, SUM(pages_viewed) AS total_pages_viewed, AVG(pages_viewed) AS avg_pages_viewed
FROM online_shopping.online_shopping_behaviour_project 
GROUP BY Purchase, Customer_Type ORDER BY Customer_Type, Purchase;

 -- Which products receive the most page views
select product_category, sum(pages_viewed) as most_pages_view 
from  online_shopping.online_shopping_behaviour_project  
group by Product_Category order by most_pages_view desc ; 

-- Compare monthly website visits with monthly purchases
SELECT EXTRACT(MONTH FROM visit_date) AS month, SUM(pages_viewed) AS total_website_visits,
    SUM(CASE
        WHEN purchase = 'Yes' THEN 1
        ELSE 0
    END) AS total_purchases
FROM online_shopping.online_shopping_behaviour_project GROUP BY EXTRACT(MONTH FROM visit_date) ORDER BY month;

-- Find customers who viewed a product many times but never purchased it
SELECT customer_id,product_category,SUM(pages_viewed) AS total_pages_viewed
FROM online_shopping.online_shopping_behaviour_project
GROUP BY customer_id, product_category
HAVING SUM(pages_viewed) >= 10
   AND SUM(CASE WHEN purchase = 'Yes' THEN 1 ELSE 0 END) = 0 ORDER BY total_pages_viewed DESC;

-- Compare the average time spent on the website by customers who purchased products with those who did not.
select purchase, avg(time_on_site_min) as avg_spend_time 
from online_shopping.online_shopping_behaviour_project
group by Purchase;

-- Find the products that receive the most page views but generate the least revenue.
select product_category, sum(pages_viewed) as total_view , sum(order_value) as total_revenue 
from online_shopping.online_shopping_behaviour_project group by Product_Category 
order by total_view desc ,total_revenue asc limit 1;

-- Compare average discounts for purchased and non-purchased products
SELECT Purchase, ROUND(
        AVG(CASE WHEN Discount_Value = 'Yes' THEN 1.0
                ELSE 0.0
            END) * 100,2
    ) AS discount_percentage
FROM online_shopping.online_shopping_behaviour_project GROUP BY Purchase;

-- Which customer has the highest bounce rate, and which product category is associated with that customer
SELECT customer_id, product_category, MAX(bounce_rate) AS highest_bounce_rate
FROM online_shopping.online_shopping_behaviour_project
GROUP BY customer_id, product_category
ORDER BY highest_bounce_rate DESC
LIMIT 1;

-- Which product_category are most pages_viewed
select Product_category,purchase, sum(pages_viewed) as most_viewed 
from online_shopping.online_shopping_behaviour_project where purchase = "Yes" 
group by Product_Category order by most_viewed desc limit 1;


