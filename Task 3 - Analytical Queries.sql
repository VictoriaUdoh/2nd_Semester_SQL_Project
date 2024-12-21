--Revenue Analysis:

--Calculate the total revenue generated by the e-commerce platform.
SELECT SUM(o.total_amount) AS total_revenue_generated
FROM altschool.orders o;

--Find the revenue generated per product.
SELECT SUM(oi.quantity * oi.price) AS total_revenue, p.products_name 
FROM altschool.order_items oi
INNER JOIN altschool.products p 
ON oi.products_id = p.products_id
GROUP BY p.products_name
ORDER BY total_revenue ASC;

--Customer Insights:

--List the top 5 customers by total spending.
SELECT c.name, o.total_amount AS total_spending
FROM altschool.customers c 
INNER JOIN altschool.orders o 
ON c.customer_id = o.customer_id
ORDER BY total_spending DESC 
LIMIT 5; 


--Identify customers who haven’t made any purchases.
SELECT c.name, o.total_amount AS total_spending
FROM altschool.customers c 
INNER JOIN altschool.orders o 
ON c.customer_id = o.customer_id
WHERE o.total_amount = 0;


--Product Trends

--Find the top 3 best-selling products.
SELECT p.products_name, oi.quantity 
FROM altschool.products p 
INNER JOIN altschool.order_items oi 
ON p.products_id = oi.products_id 
ORDER BY oi.quantity DESC LIMIT 3;

--Identify products that are out of stock.
SELECT p.products_name, p.stock_quantity 
FROM altschool.products p 
WHERE p.stock_quantity = 0;

--Order Details

--Retrieve all items in a specific order, including product names, quantities, and prices.
SELECT p.products_name, oi.quantity, oi.price
FROM altschool.order_items oi
INNER JOIN altschool.products p
ON oi.products_id = p.products_id;

--Calculate the total amount of an order.
SELECT SUM(quantity * oi.price) AS total_amount
FROM altschool.order_items oi 
WHERE oi.order_id = 5


--Monthly Trends:

--Calculate the number of orders and total revenue for each month.
SELECT EXTRACT(YEAR FROM o.order_date) AS YEAR,EXTRACT(MONTHS FROM o.order_date) AS MONTH, COUNT(o.order_id) AS total_orders,SUM(o.total_amount) AS total_revenue
FROM altschool.orders o
GROUP BY YEAR, MONTH
ORDER BY YEAR,MONTH;
