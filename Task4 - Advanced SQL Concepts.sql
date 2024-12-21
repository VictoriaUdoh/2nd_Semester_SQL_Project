set search_path to altschool;

--INNER JOIN 
SELECT c.name, o.order_id, o.total_amount
FROM altschool.customers c
INNER JOIN altschool.orders o ON c.customer_id = o.customer_id;

--LEFT JOIN 
SELECT c.name, o.order_id, o.total_amount
FROM altschool.customers c
LEFT JOIN altschool.orders o ON c.customer_id = o.customer_id;

--FULL JOIN 
SELECT c.name, o.order_id, o.total_amount
FROM altschool.customers c
FULL JOIN altschool.orders o ON c.customer_id = o.customer_id;

--Window Functions
--Rank customers based on total spending
SELECT c.name, SUM(o.total_amount) AS total_spent,
       RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS rank
FROM altschool.customers c
JOIN altschool.orders o ON c.customer_id = o.customer_id
GROUP BY c.name;

--Assign a unique number to each order for a customer
SELECT o.customer_id, o.order_id, 
       ROW_NUMBER() OVER (PARTITION BY o.customer_id ORDER BY o.order_date) AS order_number
FROM altschool.orders o;

--CTEs and Subqueries
--CTE to calculate total revenue per customer and find customers with revenue > $500
WITH CustomerRevenue AS (
    SELECT c.customer_id, c.name, SUM(o.total_amount) AS total_spent
    FROM altschool.customers c
    JOIN altschool.orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.name
)
SELECT name, total_spent
FROM CustomerRevenue
WHERE total_spent > 500;

--Subquery to find the product with the highest price
SELECT products_name, price
FROM altschool.products
WHERE price = (SELECT MAX(price) FROM altschool.products);

--Indexing
--Create indexes on frequently queried fields
CREATE INDEX idx_customer_id ON altschool.orders(customer_id);
CREATE INDEX idx_products_id ON altschool.order_items(products_id);