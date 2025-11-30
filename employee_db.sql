CREATE DATABASE employee_db;

USE employee_db;

CREATE TABLE employees(
emp_id int auto_increment primary key,
name varchar(100) not null,
department varchar(50),
position varchar(50),
salary decimal(10,2),
email varchar(100)
);

select * from employees;