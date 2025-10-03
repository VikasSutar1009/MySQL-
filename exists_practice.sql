create database exists_practice;

use exists_practice;

CREATE TABLE Employees (
    emp_id INT,
    name VARCHAR(50),
    department VARCHAR(50)
);

CREATE TABLE Projects (
    project_id INT,
    emp_id INT,
    project_name VARCHAR(50)
);

INSERT INTO Employees VALUES
(1, 'Amit', 'IT'),
(2, 'Sneha', 'HR'),
(3, 'Rahul', 'Finance'),
(4, 'Priya', 'IT'),
(5, 'Karan', 'Marketing');

INSERT INTO Projects VALUES
(101, 1, 'Website Development'),
(102, 1, 'Database Migration'),
(103, 3, 'Budget Analysis'),
(104, 4, 'Mobile App');

select * from Employees;

select * from Projects;

-- Find employees who are working on at least one project
select name 
from Employees e 
where exists(
select 1
from Projects p 
where e.emp_id = p.emp_id);

-- Find employees who are not assigned to any project.
select name 
from Employees e 
where not exists(
select 1
from Projects p 
where e.emp_id = p.emp_id);

-- Find IT department employees who are assigned to projects.
select name 
from Employees e 
where department = 'IT'
and exists(
select 1
from Projects p 
where e.emp_id = p.emp_id);

-- Find employees who are working on a project named 'Database Migration'
select name 
from Employees e
where exists(
select 1 
from Projects p 
where e.emp_id = p.emp_id
and project_name = 'Database Migration');

-- Find HR employees who are not assigned to any project.
select name 
from Employees e 
where department = 'HR'
and not exists(
select 1
from Projects p 
where e.emp_id = p.emp_id);