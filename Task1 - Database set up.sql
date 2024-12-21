set search_path to altschool;

CREATE TABLE customers(
	customer_id SERIAL PRIMARY KEY,
	name CHAR(50) NOT NULL,
	email VARCHAR(250) UNIQUE,
	phone_number VARCHAR(20) UNIQUE,
	address VARCHAR(250)
);

CREATE TABLE orders(
	order_id SERIAL PRIMARY KEY,
	customer_id INT,
	order_date DATE NOT NULL,
	total_amount DECIMAL(15,2) NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

CREATE TABLE products(
	products_id SERIAL PRIMARY KEY,
	products_name VARCHAR(200) NOT NULL,
	category VARCHAR(100) NOT NULL,
	price DECIMAL(10,2) NOT NULL,
	stock_quantity INT NOT NULL
);

CREATE TABLE order_items(
	order_item_id SERIAL PRIMARY KEY,
	order_id INT,
	products_id INT,
	quantity INT NOT NULL,
	price DECIMAL(10,2) NOT NULL,
	FOREIGN KEY(order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
	FOREIGN KEY(products_id) REFERENCES products(products_id) ON DELETE CASCADE
);

--insert sample data into customers
INSERT INTO altschool.customers (name, email, phone_number, address)
VALUES
('John Smith', 'john.smith01@gmail.com', '+1-555-100-0001', '123 Elm Street, Springfield, IL'),
('Jane Doe', 'jane.doe02@gmail.com', '+1-555-200-0002', '456 Oak Avenue, Madison, WI'),
('Michael Johnson', 'michael.j03@gmail.com', '+1-555-300-0003', '789 Pine Road, Austin, TX'),
('Emily Brown', 'emily.brown04@gmail.com', '+1-555-400-0004', '321 Maple Lane, Denver, CO'),
('Daniel Garcia', 'daniel.garcia05@gmail.com', '+1-555-500-0005', '654 Birch Drive, Portland, OR'),
('Sophia Martinez', 'sophia.martinez06@gmail.com', '+1-555-600-0006', '987 Cedar Street, Miami, FL'),
('Christopher Wilson', 'chris.wilson07@gmail.com', '+1-555-700-0007', '123 Willow Way, Seattle, WA'),
('Isabella Davis', 'isabella.davis08@gmail.com', '+1-555-800-0008', '456 Aspen Boulevard, Chicago, IL'),
('Matthew Moore', 'matthew.moore09@gmail.com', '+1-555-900-0009', '789 Spruce Court, Atlanta, GA'),
('Olivia Taylor', 'olivia.taylor10@gmail.com', '+1-555-010-0010', '321 Redwood Terrace, Phoenix, AZ'),
('Ethan Anderson', 'ethan.anderson11@gmail.com', '+1-555-110-0011', '654 Cherry Circle, Dallas, TX'),
('Mia Thomas', 'mia.thomas12@gmail.com', '+1-555-210-0012', '987 Chestnut Square, Orlando, FL'),
('Benjamin Lee', 'benjamin.lee13@gmail.com', '+1-555-310-0013', '123 Sycamore Road, Boston, MA'),
('Ava Harris', 'ava.harris14@gmail.com', '+1-555-410-0014', '456 Dogwood Lane, San Francisco, CA'),
('Alexander Clark', 'alex.clark15@gmail.com', '+1-555-510-0015', '789 Magnolia Place, Nashville, TN'),
('Charlotte Lewis', 'charlotte.lewis16@gmail.com', '+1-555-610-0016', '321 Poplar Path, Las Vegas, NV'),
('William Young', 'william.young17@gmail.com', '+1-555-710-0017', '654 Beech Street, Raleigh, NC'),
('Amelia Hall', 'amelia.hall18@gmail.com', '+1-555-810-0018', '987 Hazel Lane, Salt Lake City, UT'),
('James Wright', 'james.wright19@gmail.com', '+1-555-910-0019', '123 Palm Drive, Honolulu, HI'),
('Harper King', 'harper.king20@gmail.com', '+1-555-020-0020', '456 Cypress Avenue, San Diego, CA')

--insert sample data into order_items
INSERT INTO altschool.order_items (quantity, price)
VALUES
(15, 12.99),
(7, 15.45),
(23, 9.75),
(12, 22.10),
(8, 18.50),
(18, 14.30),
(5, 8.99),
(30, 24.99),
(25, 30.45),
(16, 19.50),
(11, 12.89),
(22, 21.75),
(9, 15.99),
(6, 10.50),
(19, 29.89),
(27, 35.75),
(13, 27.50),
(4, 14.99),
(31, 11.25),
(10, 22.49),
(20, 9.99),
(28, 13.75),
(14, 18.49),
(24, 10.99),
(32, 25.99),
(17, 32.49),
(29, 28.50),
(21, 19.99),
(3, 14.50),
(26, 11.99),
(33, 21.75),
(9, 15.89),
(18, 23.45),
(2, 30.75),
(34, 16.99),
(5, 24.89),
(10, 20.50),
(14, 12.49),
(19, 28.99),
(7, 14.75),
(30, 18.49),
(13, 22.99),
(8, 16.25),
(6, 24.75),
(21, 31.45),
(9, 20.99),
(17, 26.89),
(29, 21.50),
(12, 13.75),
(15, 19.99),
(18, 15.99),
(5, 20.49),
(22, 24.99),
(10, 17.89),
(14, 26.45),
(24, 32.99),
(3, 22.50),
(31, 27.99),
(33, 23.75),
(26, 14.50),
(11, 20.75),
(2, 16.49),
(34, 21.75),
(7, 26.45),
(12, 18.25),
(30, 28.50),
(25, 33.75),
(20, 23.99),
(19, 28.89),
(15, 25.75),
(9, 15.49),
(14, 21.99),
(27, 17.25),
(4, 22.49),
(8, 27.99),
(11, 19.89),
(16, 29.45),
(23, 34.75),
(6, 24.50),
(29, 29.99),
(3, 26.50),
(13, 16.25),
(18, 23.75),
(20, 18.49),
(30, 23.99),
(5, 28.50),
(21, 20.75),
(32, 30.75),
(19, 35.99),
(17, 25.75),
(24, 30.99),
(14, 27.50),
(6, 17.45),
(15, 24.99),
(22, 19.50),
(8, 22.99),
(28, 28.99),
(25, 32.75),
(9, 15.45),
(3, 29.25);

--insert sample data into orders
INSERT INTO altschool.orders (order_date, total_amount)
VALUES
('2024-11-01', 199.75),
('2024-11-03', 145.30),
('2024-11-05', 320.40),
('2024-11-07', 210.25),
('2024-11-09', 152.10),
('2024-11-11', 388.60),
('2024-11-13', 275.85),
('2024-11-15', 423.45),
('2024-11-17', 98.75),
('2024-11-19', 189.55),
('2024-11-21', 315.99),
('2024-11-23', 440.60),
('2024-11-25', 220.35),
('2024-11-27', 279.95),
('2024-11-29', 510.80),
('2024-12-01', 101.50),
('2024-12-03', 335.40),
('2024-12-05', 267.65),
('2024-12-07', 180.25),
('2024-12-09', 395.10),
('2024-12-11', 423.75),
('2024-12-13', 218.95),
('2024-12-15', 355.60),
('2024-12-17', 408.99),
('2024-12-19', 110.50),
('2024-12-21', 267.40),
('2024-12-23', 502.30),
('2024-12-25', 440.20),
('2024-12-27', 319.85),
('2024-12-29', 276.45),
('2024-12-31', 375.80),
('2024-10-01', 102.90),
('2024-10-03', 286.75),
('2024-10-05', 415.20),
('2024-10-07', 249.30),
('2024-10-09', 384.65),
('2024-10-11', 185.15),
('2024-10-13', 276.80),
('2024-10-15', 330.40);

--insert sample data into products
INSERT INTO altschool.products (products_name, category, price, stock_quantity)
VALUES
('Smartphone', 'Electronics', 499.99, 150),
('Laptop', 'Electronics', 899.99, 80),
('Wireless Headphones', 'Electronics', 129.99, 200),
('Bluetooth Speaker', 'Electronics', 69.99, 250),
('Smartwatch', 'Electronics', 199.99, 180),
('Coffee Maker', 'Home Appliances', 59.99, 100),
('Air Conditioner', 'Home Appliances', 299.99, 50),
('Vacuum Cleaner', 'Home Appliances', 89.99, 120),
('Dishwasher', 'Home Appliances', 399.99, 60),
('Refrigerator', 'Home Appliances', 799.99, 40),
('Running Shoes', 'Footwear', 69.99, 300),
('Casual T-shirt', 'Clothing', 19.99, 500),
('Jeans', 'Clothing', 39.99, 250),
('Leather Jacket', 'Clothing', 129.99, 100),
('Wool Sweater', 'Clothing', 49.99, 150),
('Backpack', 'Accessories', 34.99, 200),
('Sunglasses', 'Accessories', 19.99, 350),
('Handbag', 'Accessories', 59.99, 120),
('Luggage Set', 'Accessories', 129.99, 75)


 
UPDATE altschool.order_items 
SET order_id = ( 
	SELECT order_id
	FROM orders
	WHERE orders.order_id = altschool.order_items.order_item_id
	);

UPDATE altschool.order_items 
SET order_id = ( 
	SELECT order_id
	FROM orders
	WHERE orders.order_id = altschool.order_items.order_item_id
	);

UPDATE altschool.orders 
SET customer_id = ( 
	SELECT customer_id
	FROM customers
	WHERE customers.customer_id = altschool.orders.order_id
	);


SELECT * FROM orders