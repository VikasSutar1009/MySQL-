CREATE DATABASE window_functon;

USE window_functon;

CREATE TABLE sales_data(
sale_id INT,
salesperson VARCHAR(50),
region VARCHAR(20),
sale_amount INT,
sale_date DATE
);

INSERT INTO sales_data VALUES
(1, "Amit", 'North', 50000, '2025-01-01'),
(2, 'Neha', 'North', 70000, '2025-01-02'),
(3, 'Ravi', 'North', 70000, '2025-01-03'),
(4, 'Pooja', 'South', 45000, '2025-01-01'),
(5, 'Karan', 'South', 60000, '2025-01-02'),
(6, 'Meera', 'South', 60000, '2025-01-03');

SELECT * FROM sales_data;

-- RANK()  (Gaps in ranking)
SELECT 
	salesperson,
    region,
    sale_amount,
    RANK() OVER(
		PARTITION BY region 
        ORDER BY sale_amount DESC
	) AS rank_in_region
FROM sales_data; 

-- Gap after tie → Rank jumps from 1 to 3.
-- DENSE_RANK() (No gaps)
SELECT 
	salesperson,
    region,
    sale_amount,
    DENSE_RANK() OVER(
		PARTITION BY region
        ORDER BY sale_amount DESC
	)AS dense_rank_in_region
FROM sales_data;

-- LAG()   (Compare with previous row)
SELECT 
	salesperson,
    region,
    sale_date,
    sale_amount,
    LAG(sale_amount) OVER(
		PARTITION BY region
        ORDER BY sale_date
	) AS previous_day_sale
FROM sales_data;

-- Day-to-Day Growth (Real DS Use)
SELECT 
	salesperson,
    region,
    sale_date,
    sale_amount,
    sale_amount - LAG(sale_amount) OVER (
		PARTITION BY region
        ORDER BY sale_date
	) AS daily_growth
FROM sales_data;


-- questions
-- create employee salary table
CREATE TABLE employee_salary (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    effective_date DATE
);

INSERT INTO employee_salary VALUES
(101, 'Arjun',  'IT',      60000, '2024-01-01'),
(101, 'Arjun',  'IT',      70000, '2025-01-01'),
(102, 'Sneha',  'IT',      70000, '2024-01-01'),
(102, 'Sneha',  'IT',      70000, '2025-01-01'),
(103, 'Rahul',  'HR',      50000, '2024-01-01'),
(103, 'Rahul',  'HR',      55000, '2025-01-01'),
(104, 'Kavita', 'HR',      55000, '2024-01-01'),
(105, 'Manish', 'Finance', 80000, '2025-01-01');

SELECT * FROM employee_salary;

-- find Salary Ranking (With Gaps)
SELECT 
	emp_name,
    department,
    salary,
    RANK() OVER(
		PARTITION BY department
        ORDER BY salary DESC
	) AS salary_rank
FROM employee_salary;

-- Find Salary Ranking (No Gaps)
SELECT 
	emp_name,
    department,
    salary,
    DENSE_RANK() OVER(
		PARTITION BY department
        ORDER BY salary DESC
	) AS dense_salary_rank
FROM employee_salary;

-- Salary Increase Tracking
SELECT 
	emp_name,
    department,
    salary,
    effective_date,
    LAG(salary) OVER(
		PARTITION BY department
        ORDER BY effective_date 
	) AS previous_salary
FROM employee_salary;

-- 