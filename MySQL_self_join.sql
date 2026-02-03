CREATE DATABASE MySQL_self_join;

USE MySQL_self_join;

CREATE TABLE employees (
	emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT
);

INSERT INTO employees(emp_id, emp_name, manager_id)VALUES
(1, 'Amit', NULL),
(2, 'Rohit', 1),
(3, 'Neha', 1),
(4, 'Priya', 2),
(5, 'Karan',2),
(6, 'Sneha', 3);

SELECT * FROM employees;

-- SELF JOIN (Employee → Manager)
SELECT
	e.emp_name AS Employee,
    m.emp_name AS Manager
FROM employees e
LEFT JOIN employees m 
ON e.manager_id = m.emp_id;

-- Employees with their Manager ID & Name
SELECT 
	e.emp_id,
    e.emp_name,
    e.manager_id,
    m.emp_name AS manager_name
FROM employees e 
LEFT JOIN employees m
ON e.manager_id = m.emp_id;

-- Find Managers Only
SELECT DISTINCT m.emp_name AS Manager
FROM employees e
JOIN employees m 
ON e.manager_id = m.emp_id;

-- Employees Reporting to Amit
SELECT e.emp_name
FROM employees e
JOIN employees m
ON e.manager_id = m.emp_id
WHERE m.emp_name = 'Amit';

-- Multi-table JOIN
CREATE TABLE customers (
	customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE products (
	product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders(
	order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items(
	order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);

INSERT INTO customers VALUES
(1, 'Amit', 'Mumbai'),
(2, 'Neha', 'Pune'),
(3, 'Rohit', 'Delhi');

INSERT INTO products VALUES
(101, 'Laptop', 60000),
(102, 'Mobile', 30000),
(103, 'Headphones', 2000);

INSERT INTO orders VALUES
(1001, 1, '2025-01-10'),
(1002, 2, '2025-01-12'),
(1003, 1, '2025-01-15');

INSERT INTO order_items VALUES
(1, 1001, 101, 1),
(2, 1001, 103, 2),
(3, 1002, 102, 1),
(4, 1003, 103, 3);

-- Customer → Order → Product Details
SELECT 
	c.customer_name,
    c.city,
    o.order_id,
    o.order_date,
    p.product_name,
    oi.quantity,
    p.price,
    (oi.quantity * p.price) AS total_amount
FROM customers c
JOIN orders o 
	ON c.customer_id = o.customer_id
JOIN order_items oi
	ON o.order_id = oi.order_id
JOIN products p 
	ON oi.product_id = p.product_id;
    
-- Most Sold Product
SELECT p.product_name, SUM(oi.quantity) AS total_qty
FROM products p
JOIN order_items oi 
ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY SUM(oi.quantity) DESC
LIMIT 1;

-- Orders With More Than One Product
SELECT o.order_id, COUNT(oi.product_id) AS product_count
FROM orders o
JOIN order_items oi 
ON o.order_id = oi.order_id
GROUP BY o.order_id
HAVING COUNT(oi.product_id) >1; 

-- Practice
CREATE TABLE employees_hr (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    manager_id INT,
    salary INT
);

INSERT INTO employees_hr VALUES
(1, 'Amit',  'Management', NULL, 150000),  
(2, 'Rohit', 'IT',          1,    90000),
(3, 'Neha',  'HR',          1,    85000),
(4, 'Priya', 'IT',          2,    70000),
(5, 'Karan', 'IT',          2,    95000),  
(6, 'Sneha', 'HR',          3,    60000),
(7, 'Vikas', 'Finance',     1,    80000),
(8, 'Anita', 'Finance',     7,    50000),
(9, 'Raj',   'Sales',       NULL, 88000);

SELECT * FROM employees_hr;

-- Display employee name and their manager name
SELECT 
	e.emp_name AS Employee,
    m.emp_name AS Manager
    FROM employees_hr e
    JOIN employees_hr m 
    ON e.manager_id = m.emp_id;
    
-- Find employees who earn more than their manager
SELECT 
	e.emp_name
    FROM employees_hr e
    JOIN employees_hr m
    ON e.manager_id = m.emp_id
    WHERE e.salary > m.salary;
    
-- List employees who do not have a manager
SELECT  *
FROM employees_hr
WHERE manager_id IS NULL;

-- Find managers who manage more than 2 employees
SELECT
	m.emp_name, COUNT(e.emp_id) AS emp
FROM employees_hr m
JOIN employees_hr e
ON e.manager_id = m.emp_id
GROUP BY m.emp_name
HAVING COUNT(e.emp_id) > 2;

-- Display employee → manager → manager’s manager (2-level hierarchy)
SELECT 
	e.emp_name AS Employee,
    m.emp_name AS Manager,
    mm.emp_name AS Managers_manager
FROM employees_hr e
LEFT JOIN employees_hr m 
	ON e.manager_id = m.emp_id
LEFT JOIN employees_hr mm
	ON m.manager_id = mm.emp_id;
    
-- Find employees working in the same department as their manager
SELECT e.emp_name
FROM employees_hr e
JOIN employees_hr m
ON e.manager_id = m.emp_id
WHERE e.department = m.department;

-- Count number of employees reporting to each manager
SELECT m.manager_id,m.emp_name, COUNT(e.emp_id)
FROM employees_hr e 
JOIN employees_hr m
on e.manager_id = m.emp_id
GROUP BY m.manager_id, m.emp_name;

-- Find employees whose manager’s salary is greater than 80,000
SELECT
    e.emp_name AS employee,
    m.emp_name AS manager, m.salary
FROM employees_hr e
JOIN employees_hr m 
ON e.manager_id = m.emp_id 
WHERE m.salary> 80000;

-- Show employee details where manager belongs to a different department
SELECT e.emp_name, e.department, m.department AS manager_department
FROM employees_hr e
JOIN employees_hr m
ON e.manager_id = m.emp_id
WHERE e.department <> m.department;

-- List top-level managers (managers who report to no one)
SELECT emp_name
FROM employees_hr
WHERE manager_id is null;


-- Subquery
CREATE TABLE employees_payroll (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees_payroll VALUES
(1, 'Amit',  'IT',      90000),
(2, 'Neha',  'IT',      75000),
(3, 'Rohit', 'HR',      60000),
(4, 'Priya', 'HR',      82000),
(5, 'Karan', 'Finance', 95000),
(6, 'Sneha', 'Finance', 70000),
(7, 'Vikas', 'Sales',   50000),
(8, 'Anita', 'Sales',   65000);

SELECT * FROM employees_payroll;

-- Employees earning more than average salary
SELECT emp_name, salary 
FROM employees_payroll
where salary > (
	select avg(salary) as avg_salary 
    from employees_payroll
);

-- Employees working in departments with average salary > 75,000
SELECT emp_name, department
FROM employees_payroll
WHERE department IN (
    SELECT department
    FROM employees_payroll
    GROUP BY department
    HAVING AVG(salary) > 75000
);

-- Show employee salary and company average
SELECT 
    emp_name,
    salary,
    (SELECT AVG(salary) FROM employees_payroll) AS avg_salary
FROM employees_payroll;