CREATE DATABASE bike_sales;

USE bike_sales;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    city VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO customers (full_name, email, phone, city)
VALUES
('Rahul Patil', 'rahul@gmail.com', '9876543210', 'Kolhapur'),
('Amit Sharma', 'amit@gmail.com', '9123456780', 'Pune'),
('Sneha Desai', 'sneha@gmail.com', '9988776655', 'Mumbai');

SELECT * FROM customers;

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    bike_model VARCHAR(100),
    order_date DATE,
    total_amount DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders (customer_id, bike_model, order_date, total_amount, status)
VALUES
(1, 'Royal Enfield Classic 350', '2025-01-05', 195000.00, 'Confirmed'),
(2, 'Yamaha R15', '2025-01-06', 180000.00, 'Delivered'),
(3, 'Honda Shine', '2025-01-07', 85000.00, 'Pending');

SELECT * FROM orders;

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(30),
    amount_paid DECIMAL(10,2),
    payment_status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO payments (order_id, payment_date, payment_method, amount_paid, payment_status)
VALUES
(1, '2025-01-05', 'UPI', 195000.00, 'Paid'),
(2, '2025-01-06', 'Credit Card', 180000.00, 'Paid'),
(3, '2025-01-07', 'Cash', 20000.00, 'Partial');

SELECT * FROM payments;

-- BASIC LEVEL (SELECT & WHERE)
-- Display all customers from the customers table.
SELECT * FROM customers;

-- Show customer names and cities only.
SELECT full_name, city 
FROM customers;

-- Find all customers who live in Pune.
SELECT full_name
FROM customers
WHERE city = 'Pune';

-- Display all orders with status 'Confirmed'.
SELECT *
FROM orders 
WHERE status = 'Confirmed';

-- Show bike models and total amounts where the total amount is greater than ₹1,00,000.
SELECT bike_model 
FROM orders
WHERE total_amount> 100000;

-- List all payments made using UPI.#
SELECT * 
FROM payments
WHERE payment_method = 'UPI';

-- Display all orders placed on 2025-01-06.
SELECT * 
FROM orders
WHERE order_date = '2025-01-06';

-- Show distinct cities from the customers table.
SELECT DISTINCT city 
FROM customers;

-- INTERMEDIATE LEVEL (JOINS, AGGREGATES)
-- Display customer name and bike model they ordered.
SELECT c.full_name, o.bike_model
FROM customers c
LEFT JOIN orders o
on c.customer_id = o.customer_id;

-- Show customer name, order date, and total amount.
SELECT c.full_name, o.order_date, o.total_amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

-- Find total sales amount from all orders.
SELECT sum(total_amount) as sales_amount
FROM orders ;

-- Find the average order value.
SELECT avg(total_amount) as avg_amount
FROM orders;

-- Count total number of customers.
SELECT count(*) as total_customers
FROM customers;

-- Count how many orders each customer has placed.
SELECT c.full_name, count(o.order_id) as total_orders
FROM customers c
join orders o
ON c.customer_id = o.order_id
GROUP BY c.full_name;

-- Show customers who have placed more than one order.
SELECT c.full_name, count(o.order_id) as total_order
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.full_name
having count(o.order_id) > 1;

-- Display order id, bike model, and payment status.
SELECT o.order_id, o.bike_model, p.payment_status
FROM orders o
JOIN payments p
ON o.order_id = p.order_id;

-- Find total amount paid using Credit Card.
SELECT sum(amount_paid) as credit_card
FROM payments
WHERE payment_method = 'Credit Card';

-- Show all customers who have Pending orders.
SELECT c.full_name
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.status = 'Pending';

-- ADVANCED LEVEL (SUBQUERIES, GROUP BY, HAVING)
-- Find customers who have not made any payment.


-- Find orders that are partially paid.


-- Show customer name and total amount spent by each customer.
SELECT c.full_name, sum(o.total_amount) as total_amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.full_name;


-- Find the highest order value.
SELECT MAX(total_amount) as highest_value
FROM orders;

-- Display customers who paid more than ₹1,50,000.
SELECT c.full_name, SUM(p.amount_paid) as total_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.full_name
HAVING SUM(p.amount_paid) > 150000;

-- Find customers who have placed orders but payment status is not Paid.

-- Show bike model with total sales amount.
SELECT bike_model, sum(total_amount) as total_sales_amount
FROM orders
GROUP BY bike_model;

-- Find the city with the highest number of customers.
SELECT city, COUNT(*) as total_customers
FROM customers
GROUP BY city
ORDER BY count(*) desc LIMIT 1;

-- Display customers who have never placed an order.
SELECT c.full_name
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
where o.order_id is NULL;

-- Show orders where payment was made after the order date.
SELECT o.order_id, o.order_date, p.payment_date
FROM orders o
JOIN payments p 
ON o.order_id = p.order_id
WHERE p.payment_date > o.order_date;

-- Find customers whose payment method is UPI or Credit Card.

-- Rank customers based on total spending (highest first).