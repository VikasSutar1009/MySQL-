create database sql_keys_example;

use sql_keys_example;

create table department(
dept_id int primary key,
dept_name varchar(50)
);

insert into department (dept_id, dept_name) values
(1, 'HR'),
(2, 'Finance'),
(3, 'IT');

select * from department;

create table employees(
emp_id int primary key,
emp_name varchar(50),
salary decimal(10,2),
dept_id int,
foreign key(dept_id) references department(dept_id)
);

insert into employees values
(101, 'John', 55000, 1),
(102, 'Priya', 60000, 3),
(103, 'Ravi', 48000, 2),
(104, 'Meena', 70000, 3);

select * from employees;

create table studentCourse (
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    PRIMARY KEY (student_id , course_id)
);

insert into studentCourse (student_id, course_id, enrollment_date)
VALUES
(1, 101, '2025-01-10'),
(1, 102, '2025-02-15'),
(2, 101, '2025-03-12');

select * from studentCourse;



-- Student table
CREATE TABLE student_inf (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    roll_no INT,
    mobile_no BIGINT,     
    department VARCHAR(50)
);

-- Departments table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES student_inf(id)
); 


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

DELIMITER //

CREATE PROCEDURE AddProduct(
    IN p_name VARCHAR(50),
    IN p_category VARCHAR(50),
    IN p_price DECIMAL(10,2),
    IN p_stock INT
)
BEGIN
    INSERT INTO products (product_name, category, price, stock)
    VALUES (p_name, p_category, p_price, p_stock);
END //

DELIMITER ;


CALL AddProduct('Milk', 'Dairy', 50.00, 100);
CALL AddProduct('Apple', 'Fruits', 120.00, 50);
