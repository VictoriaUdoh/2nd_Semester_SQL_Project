set search_path to altschool;

--Add a new customer to the database 

INSERT INTO altschool.customers(
	name,email,phone_number,address
)

VALUES(
	'godwin', 'godwinj5@gmail.com', '543278906', 'Lagos Nigeria'
);


--Update the stock quantity of a product after a purchase

UPDATE altschool.products
SET stock_quantity = 15
WHERE products_id = 2;



-- Delete an order from the database

DELETE FROM altschool.orders
WHERE order_id = 11;


-- Retrieve all orders made by a specific customer

SELECT * FROM order_items

SELECT o.order_id,
o.order_date,
o.total_amount
FROM orders o
LEFT JOIN customers c 
ON o.customer_id = c.customer_id 
WHERE c.customer_id = 15;