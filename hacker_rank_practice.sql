create database hacker_rank_practice;

use hacker_rank_practice;

create table departments(
deptid int  primary key,
deptname varchar(50) not null,
location varchar(50)
);

insert into departments (deptid, deptname, location) values
(101, 'HR', 'Mumbai'),
(102, 'IT', 'Pune'),
(103, 'Finance', 'Delhi');


create table employees(
empid int primary key,
empname varchar(50) not null,
department varchar(50),
salary decimal(10,2),
joindate date,
gender char(1),
managerid int,
foreign key(managerid) references employees(empid)
);

insert into employees (empid, empname, department, salary, joindate, gender, managerid) VALUES
(5, 'Meena', 'HR', 80000, '2018-06-12', 'F', NULL),
(6, 'John', 'Finance', 90000, '2017-02-10', 'M', NULL),
(7, 'Ramesh', 'IT', 95000, '2016-07-18', 'M', NULL),
(1, 'Rahul', 'HR', 45000, '2021-05-12', 'M', 5),
(2, 'Priya', 'IT', 60000, '2020-09-23', 'F', 7),
(3, 'Amit', 'Finance', 55000, '2021-01-15', 'M', 6),
(4, 'Sneha', 'IT', 65000, '2019-03-08', 'F', 7);


create table projects(
projid int primary key,
projname varchar(100) not null,
deptid int,
startdate date,
enddate date,
foreign key(deptid) references departments(deptid)
);

insert into projects(projid, projname, deptid, startdate, enddate) values
(201, 'Payroll System', 103, '2022-01-01', '2022-12-31'),
(202, 'AI Chatbot', 102, '2023-03-01', NULL),
(203, 'Recruitment Portal', 101, '2021-04-01', '2021-11-30');

create table attendance(
empid int,
date date,
status enum('present', 'absent'),
foreign key(empid) references employees(empid)
);

insert into attendance(empid, date, status) values
(1, '2025-10-01', 'present'),
(1, '2025-10-02', 'absent'),
(2, '2025-10-01', 'present'),
(3, '2025-10-01', 'present');

select * from departments;

select * from employees;

select * from projects;

select * from attendance;

-- Level 1- Easy
-- List all employees who work in the IT department.
select empname from employees where department = 'IT';

-- Display the names and salaries of all employees earning more than ₹60,000.
select empname, salary from employees where salary > 60000;

-- Show all employees who joined after 2020
select empid,empname from employees where joindate > '2020-12-30';
SELECT *
FROM employees
WHERE YEAR(joindate) > 2020;

-- Find the total number of employees in each department
select department, count(*) as total_employees from employees group by department;

-- Display the details of employees whose name starts with ‘S’.
select empid, empname, department, salary, joindate, gender from employees where empname like 'S%';
SELECT *
FROM employees
WHERE empName LIKE 'S%';

-- Show employee names in alphabetical order
select empname from employees order by empname asc;

-- List all female employees who work in HR
select empname from employees where gender= 'f' and department = 'HR';

-- Find the employee with the highest salary
select empname, salary from employees order by salary desc limit 1;

-- Display employees who don’t have a manager.
select empname from employees where managerid = null ;

-- Show the count of employees in each gender category.
select gender, count(*) as total_employees from employees group by gender;