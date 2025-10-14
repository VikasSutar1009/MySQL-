create database mysql_operator;

use mysql_operator;

create table employees(
emp_id int,
name varchar(50),
department varchar(50),
salary int,
join_date date
);

INSERT INTO employees (emp_id, name, department, salary, join_date) VALUES
(1, 'Amit', 'HR', 40000, '2021-05-10'),
(2, 'Sneha', 'IT', 55000, '2020-02-15'),
(3, 'Rohit', 'Finance', 60000, '2019-11-20'),
(4, 'Priya', 'IT', 75000, '2022-01-12'),
(5, 'Vikas', 'HR', 30000, '2023-07-05');

select * from employees;

-- comparision operator
-- Employees with salary greater than 50,000
SELECT * FROM Employees WHERE salary > 50000;

-- Employees who joined before 2022
SELECT * FROM Employees WHERE join_date < '2022-01-01';

-- Employees with salary equal to 40000
SELECT * FROM Employees WHERE salary = 40000;

-- logical operator
-- employees in IT dept with salary > 60000
select * from employees where department = 'IT' and salary > 60000;

-- employees in HR or Finance
select * from employees where department = 'HR' or department= 'Finance';

-- employees not in  IT
select * from employees where not department = 'IT';

-- Between operator
-- employees with salary betwee 40k and 70k
select * from employees where salary between 40000 and 70000;

-- 
-- employees from HR and It
select * from employees where department in ('HR', 'IT');

-- LIKE Operator (Pattern Matching)
-- Employees whose name starts with 'S'
SELECT * FROM Employees WHERE name LIKE 'S%';

-- Employees whose name ends with 'a'
SELECT * FROM Employees WHERE name LIKE '%a';

-- IS NULL Operator
-- If some salary values were NULL
SELECT * FROM Employees WHERE salary IS NULL;

