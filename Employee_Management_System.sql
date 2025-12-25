CREATE DATABASE Employee_Management_System_DB;

USE Employee_Management_System_DB;

CREATE TABLE employees(
emp_id int primary key,
first_name varchar(50),
last_name varchar(50),
email varchar(100),
phone varchar(15),
hire_date date,
dept_id int,
job_id int
);

CREATE TABLE departments (
dept_id int primary key,
dept_name varchar(50),
location varchar(50)
);

CREATE TABLE jobs(
job_id int primary key,
job_title varchar(50),
min_salary decimal(10,2),
max_salary decimal(10,2)
);

CREATE TABLE salaries (
salary_id int primary key,
emp_id int, 
salary decimal(10,2),
from_date date,
to_date date
);

CREATE TABLE attendance(
attendance_id int primary key,
emp_id int,
date date,
status varchar(10)           -- present / absent
);

CREATE TABLE users(
user_id int primary key,
emp_id int,
username varchar(50),
password varchar(100),
role varchar(20)              -- Admin / Manager / Employee
);

show tables;

INSERT INTO departments values
(1, 'IT', 'Pune'),
(2, 'HR', 'Mumbai'),
(3, 'Finance', 'Delhi'),
(4, 'Sales', 'Bengalore'),
(5, 'Marketing', 'Hyderabad'),
(6, 'Admin', 'Pune'),
(7, 'Support', 'Chennai'),
(8, 'Operations', 'Noida'),
(9, 'R&D', 'Bngalore'),
(10, 'Legal', 'Delhi');

select * from departments;

INSERT INTO jobs values
(1, 'Software Engineer', 40000, 90000),
(2, 'HR Executive', 30000, 60000),
(3, 'Accountant', 35000, 70000),
(4, 'Sales Executive', 30000, 80000),
(5, 'Marketing Manager', 50000, 100000),
(6, 'Admin Officer', 28000, 50000),
(7, 'Support Engineer', 32000, 65000),
(8, 'Operations Manager', 60000, 120000),
(9, 'Research Analyst', 55000, 110000),
(10, 'Legal Advisor', 70000, 130000);

select * from jobs;

INSERT INTO employees VALUES
(101, 'Rahul', 'Patil', 'rahul@gmail.com', '9000000001', '2022-01-10', 1, 1),
(102, 'Sneha', 'Sharma', 'sneha@gmail.com', '9000000002', '2022-03-15', 2, 2),
(103, 'Amit', 'Verma', 'amit@gmail.com', '9000000003', '2021-07-01', 3, 3),
(104, 'Priya', 'Iyer', 'priya@gmail.com', '9000000004', '2023-02-20', 4, 4),
(105, 'Kunal', 'Mehta', 'kunal@gmail.com', '9000000005', '2020-11-11', 5, 5),
(106, 'Neha', 'Joshi', 'neha@gmail.com', '9000000006', '2022-08-18', 6, 6),
(107, 'Rohit', 'Singh', 'rohit@gmail.com', '9000000007', '2021-06-25', 7, 7),
(108, 'Anjali', 'Deshmukh', 'anjali@gmail.com', '9000000008', '2023-01-05', 8, 8),
(109, 'Saurabh', 'Kulkarni', 'saurabh@gmail.com', '9000000009', '2019-09-09', 9, 9),
(110, 'Pooja', 'Nair', 'pooja@gmail.com', '9000000010', '2018-04-30', 10, 10);

SELECT * FROM employees;

INSERT INTO salaries VALUES
(1, 101, 60000, '2023-01-01', '2023-12-31'),
(2, 102, 45000, '2023-01-01', '2023-12-31'),
(3, 103, 55000, '2023-01-01', '2023-12-31'),
(4, 104, 50000, '2023-01-01', '2023-12-31'),
(5, 105, 85000, '2023-01-01', '2023-12-31'),
(6, 106, 40000, '2023-01-01', '2023-12-31'),
(7, 107, 48000, '2023-01-01', '2023-12-31'),
(8, 108, 90000, '2023-01-01', '2023-12-31'),
(9, 109, 95000, '2023-01-01', '2023-12-31'),
(10, 110, 110000, '2023-01-01', '2023-12-31');

SELECT * FROM salaries;

INSERT INTO attendance VALUES
(1, 101, '2024-01-01', 'Present'),
(2, 102, '2024-01-01', 'Absent'),
(3, 103, '2024-01-01', 'Present'),
(4, 104, '2024-01-01', 'Present'),
(5, 105, '2024-01-01', 'Present'),
(6, 106, '2024-01-01', 'Absent'),
(7, 107, '2024-01-01', 'Present'),
(8, 108, '2024-01-01', 'Present'),
(9, 109, '2024-01-01', 'Present'),
(10, 110, '2024-01-01', 'Absent');

SELECT * FROM attendance;

INSERT INTO users VALUES
(1, 101, 'rahul', 'rahul@123', 'Employee'),
(2, 102, 'sneha', 'sneha@123', 'Employee'),
(3, 103, 'amit', 'amit@123', 'Employee'),
(4, 104, 'priya', 'priya@123', 'Employee'),
(5, 105, 'kunal', 'kunal@123', 'Manager'),
(6, 106, 'neha', 'neha@123', 'Employee'),
(7, 107, 'rohit', 'rohit@123', 'Employee'),
(8, 108, 'anjali', 'anjali@123', 'Manager'),
(9, 109, 'saurabh', 'saurabh@123', 'Admin'),
(10, 110, 'pooja', 'pooja@123', 'Employee');

SELECT * FROM users;

-- Display only employee first name and email
SELECT first_name, email FROM employees;

-- Show employees working in department ID =1
SELECT * FROM employees where dept_id = 1;

-- Display employees hired after 2022
SELECT * FROM employees where hire_date > '2022-01-01';

-- Show employees whose job ID is 5
SELECT * FROM employees WHERE job_id = 5;

-- Show all unique department IDs from employees table
SELECT distinct dept_id FROM employees;

-- Show distinct attendance status
SELECT distinct status FROM attendance;

-- List employees ordered by first name (A–Z)
SELECT * FROM employees order by first_name asc;

-- Display employees ordered by hire date (latest first)
SELECT * FROM employees ORDER BY hire_date desc;

-- Display only first 5 employees
SELECT * FROM employees limit 5;

-- Show top 3 highest paid employees (using salaries table)
SELECT e.emp_id, e.first_name, s.salary
FROM employees e
join salaries s 
on e.emp_id = s.emp_id
order by salary desc
limit 3;

-- Rename column names using aliases
SELECT 
	emp_id AS Employee_id,
    first_name AS Name,
    hire_date AS Joining_date
FROM employees;

-- Show salary with alias name
SELECT 
	emp_id AS Employee,
    salary AS Monthly_Salary
FROM salaries;

-- Show top 5 highest paid employees sorted by salary
SELECT emp_id, salary
FROM salaries
ORDER BY salary DESC
LIMIT 5;

-- Show employees working in department 1 AND job id 1
SELECT * FROM employees WHERE dept_id = 1 AND job_id =1;

-- Show employees from department 1 OR department 2
SELECT * FROM employees WHERE dept_id = 1 OR dept_id = 2;

-- Show employees NOT working in department 5
SELECT * FROM employees WHERE dept_id != 5;

-- Show employees hired after 2021 AND working in department 3
SELECT * FROM employees WHERE hire_date > '2021-01-01' AND dept_id = 3;

-- Show employees working in departments 1, 3, or 5
SELECT * FROM employees WHERE dept_id IN (1,3,5);

-- Show employees whose job id is 2, 4, or 6
SELECT * FROM employees WHERE job_id IN (2,4 or 6);

-- Show attendance records where status is Present or Absent
SELECT * FROM attendance WHERE status IN ('Present', 'Absent');

-- Show employees hired between 2020 and 2022
SELECT * FROM employees WHERE hire_date between '2020-01-01' and '2022-12-31';

-- Show employees with salary between 50,000 and 90,000
SELECT * FROM salaries  where salary BETWEEN 50000 AND 90000;

-- Show attendance records between two dates
SELECT *
FROM attendance
WHere date BETWEEN '2024-01-01' AND '2024-01-10';

-- Show employees whose first name starts with 'R'
SELECT * FROM employees WHERE first_name like 'R%';

-- Show employees whose email contains 'gmail'
select * from employees where email like '%gmail%';

-- Show employees whose name ends with 'a'
select * from employees where first_name like '%a';

-- Show employees whose phone number is NULL
select * from employees where phone is null;

-- Show employees whose email is NOT NULL
select * from employees where email is not null;

-- Show salary records where to_date is NULL (current salary)
select * from salaries where to_date is null;

-- Show employees in departments 1 or 2 AND hired after 2021
select * from employees where dept_id in (1 ,2) and hire_date > '2021-01-01';

-- Show employees whose name starts with 'A' AND email is NOT NULL
select * from employees where First_name like 'A%' and email is not null;

-- Show employees NOT in department 3 and salary above 60,000
select s.emp_id, s.salary
from salaries s 
where s.salary > 60000
and s.emp_id not in(
	select emp_id
    from employees 
    where dept_id = 3
);

-- Make employee email unique (no two employees can have same email)
CREATE TABLE employees(
emp_id int primary key,
first_name varchar(50),
email varchar(100) unique,
phone varchar(15),
hire_date date
);

-- Add UNIQUE constraint to existing table on phone number
Alter table employees
add constraint unique_phone unique (phone) ;

-- Make employee name mandatory
create table employees (
emp_id int primary key,
first_name varchar(50) not null,
email varchar(100)
);

-- Add NOT NULL constraint to existing column
Alter table employees 
modify first_name varchar(50) not null;

-- Ensure salary must be greater than 10,000
CREATE TABLE salaries(
salary_id int primary key,
emp_id int,
salary decimal(10, 2) check (salary > 10000)
);

-- Ensure employee age is between 18 and 60
CREATE TABLE employees (
	emp_id int primary key,
    first_name varchar(50),
    age INT CHECK (age between 18 And 60)
);

-- Add CHECK constraint to existing table (attendance status)
ALTER TABLE attendance
ADD constraint chk_status
check ( status in ('Present', 'Absent'));

-- Email must be UNIQUE and NOT NULL
email varchar(100) unique not null;

-- Salary must be between 30,000 and 1,50,000
salary decimal(10,2)
check (salary between 30000 and 150000);

-- Phone number must be exactly 10 digits
phone varchar(10)
check (length(phone) = (10)
