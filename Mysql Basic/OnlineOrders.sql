CREATE DATABASE practice_one;

USE practice_one;

CREATE TABLE OnlineOrders(
customer_name VARCHAR(50),
product_name VARCHAR(50),
category VARCHAR(50),
order_amount DECIMAL(10,2),
order_quantity int,
order_date DATE
);

INSERT INTO OnlineOrders(customer_name,product_name,category,order_amount,order_quantity,order_date) values('Alice','T-Shirt','clothing',500.00,2,'2024-10-01');
INSERT INTO OnlineOrders(customer_name,product_name,category,order_amount,order_quantity,order_date) values('Bob','Laptop','electronics',55000.00,1,'2024-10-02');
INSERT INTO OnlineOrders(customer_name,product_name,category,order_amount,order_quantity,order_date) values('Charlie','shoes','footware',2000.00,1,'2024-10-03');
INSERT INTO OnlineOrders(customer_name,product_name,category,order_amount,order_quantity,order_date) values('Alice','shoes','footware',1800.00,1,'2024-10-04');
INSERT INTO OnlineOrders(customer_name,product_name,category,order_amount,order_quantity,order_date) values('Eve','headphones','electronics',3000.00,2,'2024-10-04');
INSERT INTO OnlineOrders(customer_name,product_name,category,order_amount,order_quantity,order_date) values('Bob','T-Shirt','clothing',500.00,1,'2024-10-05');
INSERT INTO OnlineOrders(customer_name,product_name,category,order_amount,order_quantity,order_date) values('Charlie','mouse','electronics',1500.00,3,'2024-10-06');

select * from OnlineOrders;

-- 1  Find the minimum and maximum order_amount in the table.
select MIN(order_amount) AS min_order_amount, MAX(order_amount) AS max_order_amount FROM OnlineOrders;

-- 2 Find the total number of orders made.
select COUNT(order_quantity) AS count_order_quantity FROM onlineOrders;

-- 3 Calculate the total revenue generated (order_amount) from all orders.
select sum(order_amount)  AS sum_order_amount FROM OnlineOrders;

-- 4 What is the average order_amount per order?
select AVG(order_amount) AS avg_order_amount FROM OnlineOrders;

-- 5 Find the total number of units sold (order_quantity).
select SUM(order_quantity) AS sum_order_quantity FROM OnlineOrders;

-- 6  Show the total revenue by category.
select category,SUM(order_amount) AS sum_order_amount FROM OnlineOrders GROUP BY category;

-- 7  Show the average order_amount by customer_name.
select customer_name, AVG(order_amount) AS avg_order_amount FROM OnlineOrders GROUP BY customer_name;

-- 8  Count how many orders each customer has placed.
select customer_name, COUNT(*) AS total_rows FROM OnlineOrders GROUP BY customer_name;

-- 9  List categories where the total quantity sold is more than 3.


-- 10  Show the highest and lowest order_amount per category.
select category, MAX(order_amount) AS max_order_amount, MIN(order_amount) AS min_order_amount FROM OnlineOrders GROUP BY category;