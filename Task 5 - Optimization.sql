set search_path to altschool;

--Analyze query performance with EXPLAIN ANALYZE
EXPLAIN ANALYZE
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM altschool.customers c
JOIN altschool.orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC;

--Optimize a slow query
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM altschool.customers c
JOIN altschool.orders o ON c.customer_id = o.customer_id
WHERE o.order_date >= '2024-01-01'
GROUP BY c.name
ORDER BY total_spent DESC;