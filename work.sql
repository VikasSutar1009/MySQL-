create database sql_examples;

use sql_examples;

create table sales(
id int,
product varchar(50),
category varchar(50),
quantity int,
price decimal(10.2)
);

insert into sales values
(1, 'Laptop', 'Electronics', 2, 50000),
(2, 'Phone', 'Electronics', 5, 20000),
(3, 'Tablet', 'Electronics', 3, 15000),
(4, 'Shirt', 'Clothing', 10, 800),
(5, 'Jeans', 'Clothing', 6, 1200),
(6, 'Shoes', 'Clothing', 4, 2500),
(7, 'Milk', 'Grocery', 15, 50),
(8, 'Bread', 'Grocery', 8, 40),
(9, 'Butter', 'Grocery', 5, 150);

select * from sales;

-- Find the total quantity sold per category. Show only those categories where total quantity > 15.
select category, sum(quantity) as total_quantity from sales group by category having sum(quantity) >15;

-- Find the average price per category. Show only categories where average price > 10,000.
select category, avg(price) as avg_price from sales group by category having avg(price) > 10000;

-- Find the number of products in each category. Display only categories having more than 2 products
select category, count(product) as total_product from sales group by category having count(product) > 2;

-- Find the maximum price per category. Show only categories where maximum price > 2,000.
select category, max(price) as max_price from sales group by category having max(price) > 2000;

create table employees(
emp_id int,
emp_name varchar(50),
department varchar(50),
salary decimal(10,2),
city varchar(50)
);


insert into employees values
(1, 'Amit', 'HR', 40000, 'Pune'),
(2, 'Neha', 'IT', 60000, 'Mumbai'),
(3, 'Raj', 'Finance', 55000, 'Delhi'),
(4, 'Sneha', 'IT', 65000, 'Pune'),
(5, 'Karan', 'HR', 42000, 'Delhi'),
(6, 'Meena', 'Finance', 58000, 'Mumbai'),
(7, 'Vikas', 'IT', 70000, 'Delhi'),
(8, 'Pooja', 'HR', 39000, 'Pune'),
(9, 'Arjun', 'Finance', 60000, 'Delhi'),
(10, 'Simran', 'IT', 72000, 'Mumbai');

select * from employees;

-- Find the average salary per department. Show only those with avg salary > 55,000.
select department, avg(salary) as avg_salary from employees group by department having avg(salary) > 550000;

-- Find the total salary per department. Show only departments with total salary > 1,50,000.
select department, sum(salary) as total_salary from employees group by department having sum(salary) > 150000;

-- Find the number of employees per city. Show only cities with more than 2 employees.
select city, count(emp_id) as total_employees from employees group by city having count(emp_id) > 2;

-- Find the highest salary in each department. Show only departments where highest salary > 60,000.
select department, max(salary) as max_salary from employees group by department having max(salary) > 60000;


create table orders(
order_id int,
customer varchar(50),
city varchar(50),
amount decimal(10,2),
order_date date
);

insert into orders values
(1, 'Rahul', 'Pune', 500, '2025-09-01'),
(2, 'Neha', 'Delhi', 1200, '2025-09-02'),
(3, 'Arjun', 'Mumbai', 800, '2025-09-03'),
(4, 'Sneha', 'Pune', 1500, '2025-09-03'),
(5, 'Meena', 'Delhi', 700, '2025-09-04'),
(6, 'Karan', 'Pune', 2000, '2025-09-04'),
(7, 'Simran', 'Mumbai', 1800, '2025-09-05'),
(8, 'Amit', 'Delhi', 2200, '2025-09-05'),
(9, 'Pooja', 'Pune', 900, '2025-09-06');

select * from orders;

-- Find the total order amount per city. Show only cities with total > 3,000.
select city, sum(amount) as total_amount from orders group by city having sum(amount) > 3000;

-- Find the average order amount per city. Show only those cities where avg amount > 1,000.
select city, avg(amount) as avg_amount from orders group by city having avg(amount) > 1000;

-- Count the number of orders per city. Show only those with more than 2 orders.
select city, count(*) as total_orders from orders group by city having count(*) > 2;

-- Find the maximum order amount per city. Show only those cities with maximum order > 2,000.
select city, max(amount) as max_amount from orders group by city having max(amount) > 2000;

create table students(
roll_no int,
name varchar(50),
class varchar(50),
marks int,
subject varchar(50)
);

insert into students values
(1, 'Amit', '10A', 78, 'Math'),
(2, 'Neha', '10A', 85, 'Science'),
(3, 'Raj', '10B', 92, 'Math'),
(4, 'Sneha', '10B', 66, 'Science'),
(5, 'Karan', '10C', 74, 'Math'),
(6, 'Meena', '10A', 89, 'Science'),
(7, 'Vikas', '10B', 55, 'Math'),
(8, 'Pooja', '10C', 95, 'Science'),
(9, 'Simran', '10C', 81, 'Math');

select * from students;

-- Find the average marks per class. Show only classes with avg marks > 80.
select class, avg(marks) as avg_marks from students group by class having avg(marks) > 80;

-- Find the total marks per class. Show only those with total marks > 200.
select class, sum(marks) as total_marks from students group by class having sum(marks) > 200;

-- Count the number of students per class. Show only classes with more than 2 students.
select class, count(*) as total_students from Students group by class having count(*) > 2;

-- Find the highest marks per class. Show only classes with max marks > 90.
select class, max(marks) as max_marks from Students  group by class having max(marks) > 90;

create table products (
    prod_id int,
    prod_name varchar(50),
    brand varchar(50),
    price decimal(10,2),
    stock int
);

insert into products values
(1, 'iPhone', 'Apple', 80000, 5),
(2, 'MacBook', 'Apple', 120000, 3),
(3, 'Galaxy S23', 'Samsung', 70000, 6),
(4, 'TV', 'Samsung', 45000, 10),
(5, 'ThinkPad', 'Lenovo', 60000, 4),
(6, 'Yoga', 'Lenovo', 55000, 5),
(7, 'Pixel', 'Google', 65000, 7),
(8, 'Nest Hub', 'Google', 12000, 8);

select * from Products;

-- Find the average price per brand. Show only brands with avg price > 50,000.
select brand, avg(price) as avg_price from Products group by brand having avg(price) > 50000;

 -- Find the total stock per brand. Show only brands with total stock > 5.
select brand, sum(stock) as total_stock from Products group by brand having sum(stock) > 5;

-- Count the number of products per brand. Show only brands having more than 1 product.
select brand, count(*) as total_products from Products group by brand having count(*) > 1;

-- Find the maximum product price per brand. Show only brands with max price > 60,000.
select brand, max(price) as max_price from Products group by brand having max(price) > 60000;