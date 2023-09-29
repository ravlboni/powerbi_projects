create database PIZZA;
use  PIZZA;
SELECT * FROM pizza_sales;

-------  KPI------------

-- TOTAL REVENUE
select sum(total_price) as total_revenue from pizza_sales;

-- Average Order Value:
select count(distinct order_id) as total_order from pizza_sales;

-- Total Pizzas Sold:
select sum(total_price)/count(distinct order_id) as average_order_value from pizza_sales;

-- Total Orders: 
select sum(quantity) as Total_pizza_sold from pizza_sales;

-- Average Pizza Per Order:
select sum(quantity)/count(distinct order_id) as Average_pizza_order from pizza_sales;

--------------------------------------------------------------------
-- Daily trend of orders

SELECT DAYNAME(STR_TO_DATE(order_date,'%d-%m-%Y')) AS order_day,
       COUNT(DISTINCT order_id) AS daily_trend_of_orders
FROM pizza_sales
GROUP BY order_day

-- Percentage of sales by Pizza category
SELECT pizza_category,
ROUND(SUM(total_price),2) AS total_revenue,
ROUND(SUM(total_price) * 100 / (
           SELECT SUM(total_price)
           FROM pizza_sales
	   ),2) AS percentage_of_sales
FROM pizza_sales
GROUP BY pizza_category

-- Percentage of sales by Pizza size

SELECT pizza_size,
       ROUND(SUM(total_price),2) AS total_revenue,
       ROUND(SUM(total_price) * 100 / (
           SELECT SUM(total_price)
           FROM pizza_sales
           ),2) AS percentage_of_sales
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

-- Total pizzas sold by pizza category

SELECT pizza_category, 
	   SUM(quantity) as total_quantities_sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY total_quantities_sold DESC

-- Top 5 Best Sellers by Total Pizzas Sold

SELECT pizza_name, 
	   SUM(total_price) AS Total_REVENUE, count(distinct order_id)as TOTAL_ORDER,sum(quantity)as total_pizzasold
FROM pizza_sales
GROUP BY pizza_name
order by Total_REVENUE desc
LIMIT 5 ;

-- Bottom 5 Best Sellers by Total Pizzas Sold

SELECT pizza_name, 
	   SUM(total_price) AS Total_REVENUE, count(distinct order_id)as TOTAL_ORDER,sum(quantity)as total_pizzasold
FROM pizza_sales
GROUP BY pizza_name
order by Total_REVENUE asc
LIMIT 5 ;

