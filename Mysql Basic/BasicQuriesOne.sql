CREATE DATABASE BasicQueriesOne;

USE BasicQueriesOne;

CREATE TABLE employees(
emp_id INT,
name VARCHAR(100),
department VARCHAR(50),
salary INT,
City VARCHAR(50)
);

INSERT INTO employees (emp_id,name,department,salary,city) Values(101,'Alice','HR',50000,'Delhi');
INSERT INTO employees (emp_id,name,department,salary,city) Values(102,'Bob','Finance',60000,'Mumbai');
INSERT INTO employees (emp_id,name,department,salary,city) Values(103,'Charlie','IT',70000,'Bengalore');
INSERT INTO employees (emp_id,name,department,salary,city) Values(104,'David','IT',55000,'Delhi');
INSERT INTO employees (emp_id,name,department,salary,city) Values(105,'Eva','Finance',65000,'Chennai');
INSERT INTO employees (emp_id,name,department,salary,city) Values(106,'Frank','HR',52000,'Mumbai');

select * from employees;

select * from employees where department ='IT';

select * from employees WHERE department ='Finance' AND salary > 60000;

select * from employees where department= 'HR' OR city ='Delhi';

select * from employees where not(department = 'HR');

select * from employees where (department = 'IT' or department= 'Finance') AND NOT (city = 'Mumbai');