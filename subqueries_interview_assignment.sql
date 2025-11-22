CREATE DATABASE subqueries_interview_assignment;

USE subqueries_interview_assignment;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO departments (dept_id, dept_name, location) VALUES
(1, 'HR', 'Mumbai'),
(2, 'Sales', 'Delhi'),
(3, 'IT', 'Bangalore'),
(4, 'Finance', 'Pune'),
(5, 'Marketing', 'Chennai');

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    job_title VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT,
    hire_date DATE,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO employees (emp_id, name, job_title, salary, dept_id, hire_date) VALUES
(101, 'Amit', 'HR Executive', 45000, 1, '2020-02-15'),
(102, 'Neha', 'HR Manager', 70000, 1, '2018-08-10'),
(103, 'Raj', 'Sales Executive', 40000, 2, '2021-06-22'),
(104, 'Priya', 'Sales Manager', 85000, 2, '2017-04-18'),
(105, 'Karan', 'Software Engineer', 65000, 3, '2019-03-12'),
(106, 'Sneha', 'System Analyst', 90000, 3, '2016-11-30'),
(107, 'Arjun', 'Finance Analyst', 50000, 4, '2021-01-05'),
(108, 'Meera', 'Accountant', 60000, 4, '2019-09-23'),
(109, 'Vikram', 'Marketing Executive', 48000, 5, '2020-05-10'),
(110, 'Ananya', 'Marketing Head', 95000, 5, '2015-12-19');

select * from departments;

select * from employees;

--  Get employees who earn more than the average salary
select name, salary
from employees 
where salary > (select avg(salary) from employees);

-- Multi-row Subquery (Using IN)
-- Get employees who work in departments with ‘Sales’ or ‘HR’:
select name 
from employees 
where dept_id in (select dept_id from departments where dept_name in ('Sales', 'HR'));

-- Multi-column Subquery
-- Find employees with the same department and salary as someone named “ ”:
select name 
from employees 
where (dept_id, salary) in (
		select dept_id, salary from employees where name = 'John'
);

-- Correlated Subquery

-- Find employees who earn more than the average salary of their own department:
select name, dept_id, salary
from employees e 
where salary > (
	select avg(salary)
    from employees 
    where dept_id = e.dept_id
);

-- Subquery in FROM (Derived Table)

-- Show departments and their average salaries, then filter:
select dept_id, avg_salary
from (
		select dept_id, avg(salary) as avg_salary
        from employees 
        group by dept_id
) as dept_avg
where avg_salary > 50000;

-- Subquery in SELECT

-- Add a column showing each employee’s department average:
select name, salary, (
						select avg(salary)
                        from employees e2
                        where e2.dept_id = e1.dept_id ) as dept_avg
from employees e1;