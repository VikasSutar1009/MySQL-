CREATE DATABASE joins_example;

USE joins_example;

CREATE TABLE employees(
emp_id INT,
emp_name VARCHAR(50),
dept_id INT,
salary INT
);

CREATE TABLE departments(
dept_id INT,
dept_name VARCHAR(50)
);

INSERT INTO employees(emp_id, emp_name, dept_id, salary) values
(1, 'Amit', 10, 60000),
(2, 'Neha', 20, 75000),
(3, 'Rahul', 10, 50000),
(4, 'Priya', NULL, 55000);

INSERT INTO departments(dept_id, dept_name) values
(10, 'Data Science'),
(20, 'HR'),
(30, 'Finance');

select * from employees;

select * from departments; 

-- show all employees with departmets names so employees is left 
-- FROM employees e
-- LEFT JOIN departments d
SELECT *
FROM employees e 
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

-- show all departments even those without employees (department is left table)
-- FROM departments d
-- LEFT JOIN employees e
SELECT * 
FROM departments d
LEFT JOIN employees e 
ON d.dept_id = e.dept_id;

-- Analysis salaries only for employees with valid departments
SELECT *
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;

select *
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
where d.dept_id is null;





CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    order_amount INT
);

CREATE TABLE payments (
    payment_id INT,
    order_id INT,
    payment_status VARCHAR(20)
);

INSERT INTO customers VALUES
(1, 'Amit', 'Mumbai'),
(2, 'Neha', 'Pune'),
(3, 'Rahul', 'Delhi'),
(4, 'Priya', 'Bangalore');

INSERT INTO orders VALUES
(101, 1, '2025-01-01', 5000),
(102, 1, '2025-01-05', 3000),
(103, 2, '2025-01-03', 7000),
(104, 4, '2025-01-07', 4000);

INSERT INTO payments VALUES
(1001, 101, 'SUCCESS'),
(1002, 102, 'FAILED'),
(1003, 103, 'SUCCESS');


select * from customers;
select * from orders;
select * from payments;

-- show customers who actually placed orders
select c.customer_name, o.order_id, o.order_amount
FROM customers c 
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- show all even if they not placed order
select c.customer_name, o.order_id ,o.order_amount
FROM customers c
LEFT JOIN orders o 
on c.customer_id = o.customer_id;

-- which customer never placed an order
select c.customer_name
FROM customers c
LEFT JOIN orders o 
on c.customer_id = o.customer_id
where o.order_id is null;

-- show only successful paid orders
select o.order_id, o.order_amount, p.payment_status
FROM orders o
INNER JOIN payments p
on o.order_id = p.order_id
WHERE p.payment_statUs = 'SUCCESS';

-- SHOW all orders and their payment status
SELECT o.order_id, o.order_amount, p.payment_status
FROM orders o
LEFT JOIN payments p
ON o.order_id = p.order_id;

-- customer wise order and payment report
SELECT c.customer_id,
	c.customer_name,
    c.city,
    o.order_id,
    o.order_date,
    o.order_amount,
    p.payment_status
FROM customers c
LEFT JOIN orders o 
	ON c.customer_id = o.customer_id
LEFT JOIN payments p
	ON	o.order_id = p.order_id
ORDER BY c.customer_id, o.order_id;

-- total successful revenue per customer
 
