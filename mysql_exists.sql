create database mysql_exists;

use mysql_exists;

create table customers(
customer_id int,
name varchar(50),
city varchar(50)
);

create table orders(
order_id int,
customer_id int,
product varchar(50),
amount decimal(10,2)
);

insert into customers values
(1, 'Amit', 'Pune'),
(2, 'Sneha', 'Mumbai'),
(3, 'Rahul', 'Delhi'),
(4, 'Priya', 'Bengalore');

insert into orders values
(101, 1, 'Laptop', 55000),
(102, 1, 'Mouse', 500),
(103, 2, 'Mobile', 20000),
(104, 4, 'Tablet', 15000);

select * from customers;

select * from orders;

--  Find customers who have placed at least one order
select name, city 
from customers c 
where exists(
select 1 from orders o 
where o.customer_id = c.customer_id);

-- Find customers who have not placed any order
select name, city
from customers c 
where not exists(
select 1 
from orders o 
where o.customer_id = c.customer_id
);

create table student(
student_id int,
name varchar(50),
department varchar(50)
);

create table enrollments(
enroll_id int,
student_id int,
course varchar(50)
);

insert into student values
(1, 'Amit', 'Computer Science'),
(2, 'Sneha', 'Electronics'),
(3, 'Rahul', 'Mechanical'),
(4, 'Priya', 'Computer Science'),
(5, 'Karan', 'Civil');

insert into enrollments values
(101, 1, 'Database System'),
(102, 1, 'Operating System'),
(103, 2, 'Microprocessors'),
(104, 4 , 'Artificial Intelligence');

select * from student;

select * from enrollments;

-- Find all students who are enrolled in at least one course
select name, department
from student s 
where exists(
select 1 
from enrollments e
where e.student_id = s.student_id);

-- Find all students who are not enrolled in any course
select name, department
from student s 
where not exists(
select 1 
from enrollments e 
where e.student_id = s.student_id);

-- Find all students from computer science who are enrolled in at least course
select name 
from student s 
where department = 'Computer Science'
and exists(
select 1 
from enrollments e 
where e.student_id = s.student_id
);

-- Find all students who are enrolled in a course named 'Database Systems'.
select name 
from student s 
where exists(
select 1
from enrollments e 
where e.student_id = s.student_id
and e.course = 'Database System'
);

-- Find all students from Electronics department who are not enrolled in any course.
select name 
from student s 
where department = 'Electronics'
and not exists(
select 1 
from enrollments e 
where e.student_id = s.student_id
);