CREATE DATABASE Home_Work;

USE Home_Work;

CREATE TABLE Students (
    student_id INT,
    name VARCHAR(50),
    course VARCHAR(50),
    marks INT,
    city VARCHAR(50)
);

INSERT INTO Students VALUES
(101, 'Raj', 'Math', 85, 'Pune'),
(102, 'Simran', 'Science', 92, 'Delhi'),
(103, 'Aman', 'History', 76, 'Mumbai'),
(104, 'Neha', 'Math', 65, 'Pune'),
(105, 'Arjun', 'Science', 55, 'Chennai');

SELECT * FROM Students;

-- Find students who scored more than 80 marks.
SELECT * FROM Students WHERE marks > 80;

-- List students from Pune.
SELECT *  FROM Students WHERE city = "Pune";

-- Show students who scored between 60 and 90.
SELECT * FROM Students WHERE marks BETWEEN 60 AND 90;

-- Get all students who study Science or Math.
SELECT * FROM Students WHERE course IN ("Science" AND "Math");

-- Find students whose name ends with “n”.
SELECT * FROM Students WHERE name LIKE '%n';


CREATE TABLE Products (
    product_id INT,
    name VARCHAR(50),
    category VARCHAR(50),
    price INT,
    stock INT
);

INSERT INTO Products VALUES
(1, 'Laptop', 'Electronics', 60000, 10),
(2, 'Mobile', 'Electronics', 25000, 20),
(3, 'Table', 'Furniture', 7000, 15),
(4, 'Chair', 'Furniture', 3000, 25),
(5, 'Book', 'Stationery', 500, 50);

SELECT * FROM Products;


-- Find all products with price greater than 10,000.
SELECT * FROM Products WHERE price > 10000;

-- List all furniture items.
SELECT * FROM products WHERE category = 'furniture';

-- Show products with stock less than 20.
SELECT * FROM Products WHERE stock < 20;

-- Find items whose name contains “a”.
SELECT * FROM Products WHERE name LIKE "%a%";

-- Show products in category Electronics or Stationery.
SELECT * FROM Products WHERE category IN ("Electronics" AND "Stationery");


CREATE TABLE Orders (
    order_id INT,
    customer_name VARCHAR(50),
    product VARCHAR(50),
    quantity INT,
    order_date DATE
);

INSERT INTO Orders VALUES
(201, 'Ramesh', 'Laptop', 1, '2023-03-10'),
(202, 'Sita', 'Book', 5, '2023-04-12'),
(203, 'Aman', 'Mobile', 2, '2023-05-15'),
(204, 'Neha', 'Chair', 4, '2023-06-18'),
(205, 'Vikas', 'Table', 1, '2023-07-20');

SELECT * FROM Orders;

-- Find orders placed after June 2023.
SELECT * FROM Orders WHERE order_date > '2023-06-30';

-- List all customers who bought more than 2 items.
SELECT * FROM Orders WHERE quantity > 2;

-- Show orders where product is Laptop or Mobile.
SELECT * FROM Orders WHERE product IN ("Laptop", "Mobile");

-- Find orders by customer whose name starts with “A”.
SELECT * FROM Orders WHERE customer_name LIKE "A%";

-- Show all orders not containing “Book”.
SELECT * FROM Orders WHERE product <> "Book";



CREATE TABLE Library (
    book_id INT,
    title VARCHAR(100),
    author VARCHAR(50),
    genre VARCHAR(50),
    price INT
);

INSERT INTO Library VALUES
(1, 'The Alchemist', 'Paulo Coelho', 'Fiction', 400),
(2, 'Wings of Fire', 'A.P.J. Abdul Kalam', 'Autobiography', 350),
(3, 'Rich Dad Poor Dad', 'Robert Kiyosaki', 'Finance', 500),
(4, '1984', 'George Orwell', 'Fiction', 300),
(5, 'Clean Code', 'Robert C. Martin', 'Programming', 800);

SELECT * FROM Library;

-- Find all books priced above 400.
SELECT * FROM Library WHERE price > 400;

-- List books of genre Fiction.
SELECT * FROM Library WHERE genre = "Fiction";

-- Show books written by authors whose name starts with “R”.
SELECT * FROM Library WHERE author LIKE "R%";

-- Find books not in genre Programming.
SELECT * FROM Library WHERE genre <> "Programming";

-- Show books with price between 300 and 600.
SELECT * FROM Library WHERE price IN ("300" , "600");