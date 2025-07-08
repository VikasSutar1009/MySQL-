CREATE DATABASE practice_two;

USE practice_two;

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

-- 1
SELECT * FROM OnlineOrders;

SELECT MIN(order_amount) AS MINorder_amount, MAX(order_amount) AS MAXorder_amount FROM OnlineOrders;
-- 2

SELECT SUM(order_quantity) AS sum_order_quantity FROM OnlineOrders;
-- 3
SELECT SUM(order_amount) AS sum_order_amount FROM OnlineOrders;

-- 4
SELECT AVG(order_amount) AS sum_order_amount FROM OnlineOrders;

-- 5
SELECT SUM(order_quantity) AS sum_order_amount FROM OnlineOrders;

-- 6
SELECT 




