USE restaurant_db;

-- Objective 1: Explore the items table

-- Task: View the menu_items table and write a query to find the number of items on the menu
SELECT
	*
FROM
	menu_items;
SELECT 
	COUNT(*)
FROM
	menu_items;
    
-- Task: What are the least and most expensive items on the menu?
SELECT
	*
FROM
	menu_items
ORDER BY 
	price ASC
LIMIT 1;

SELECT
	*
FROM
	menu_items
ORDER BY 
	price DESC
LIMIT 1;

-- Task: How many Italian dishes are on the menu? What are the least and most expensive Italian dishes on the menu?
SELECT
	COUNT(*)
FROM
	menu_items
WHERE
	category = 'Italian';
    
SELECT
	*
FROM
	menu_items
WHERE
	category = 'Italian'
ORDER BY 
	price ASC
LIMIT 1;

SELECT
	*
FROM
	menu_items
WHERE
	category = 'Italian'
ORDER BY 
	price DESC
LIMIT 1;

-- Task: How many dishes are in each category? What is the average dish price within each category?
SELECT
	category, COUNT(*), AVG(price)
FROM 
	menu_items
GROUP BY
	category;
    
-- Objective 2: Explore the orders table

-- Task: View the order_details table. What is the date range of the table?
SELECT
	*
FROM
	order_details;
    
SELECT
	MIN(order_date), MAX(order_date)
FROM
	order_details;

-- Task: How many orders were made within this date range? How many items were ordered within this date range?
SELECT
	COUNT(DISTINCT order_id)
FROM
	order_details;

SELECT
	COUNT(*)
FROM
	order_details;

-- Task: Which orders had the most number of items?
SELECT
	order_id, COUNT(*)
FROM
	order_details
GROUP BY 
	order_id
ORDER BY
	COUNT(*) DESC;

-- Task: How many orders had more than 12 items?
SELECT
	COUNT(*)
FROM (
	SELECT
		order_id, COUNT(*) AS num_of_items
	FROM
		order_details
	GROUP BY 
		order_id
	HAVING
		COUNT(*) > 12
) AS subquery;


-- Objective 3: Analyze customer behavior

-- Task: Combine the menu_items and order_details tables into a single table

-- Task: What were the least and most ordered items? What categories were they in?

-- Task: What were the top 5 orders that spent the most money?

-- Task: View the details of the highest spend order. Which specific items were purchased?

-- Task: BONUS: View the details of the top 5 highest spend orders