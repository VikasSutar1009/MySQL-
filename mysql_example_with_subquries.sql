create database mysql_example_with_subquries;

use mysql_example_with_subquries;

create table employees(
empName varchar(50),
department varchar(50),
salary int
);

insert into employees( empName, department, salary) values
('Amit', 'HR', 30000),
('Ravi', 'IT', 50000),
('Sneha', 'Finance', 45000),
('Priya', 'IT', 60000),
('Manish', 'Finance', 40000),
('Kiran', 'HR', 35000);

-- a) Find employees earning more than the average salary
select empName,salary
from employees
where salary > (select avg(salary) from employees);

-- b) Find employees in the same department as 'Sneha'
select empName, department
from employees
where department = (select department from employees where empName = 'sneha');

-- c) Get highest salary using a subquery
select empName, salary
from employees
where salary = (select max(salary) from employees);

-- d) Employees who earn less than any IT employee
select empName, salary
from employees
where salary < (select min(salary) from employees where department = 'IT');

-- e)employees salary with less than 30000
select empName, salary
from employees
where salary < (select salary = 30000);





