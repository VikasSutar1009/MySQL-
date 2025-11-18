CREATE DATABASE superstore_db;

USE superstore_db;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    region VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO customers VALUES
(1, 'Amit Sharma', 'North', 'Delhi'),
(2, 'Neha Verma', 'South', 'Chennai'),
(3, 'Ravi Kumar', 'West', 'Mumbai'),
(4, 'Pooja Singh', 'East', 'Kolkata'),
(5, 'Ankit Patel', 'South', 'Bangalore');

select * from customers;

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

INSERT INTO categories VALUES
(1, 'Furniture'),
(2, 'Office Supplies'),
(3, 'Technology');

select * from categories;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10,2),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

INSERT INTO products VALUES
(101, 'Office Chair', 1, 3500),
(102, 'Desk', 1, 5000),
(103, 'Pen Set', 2, 200),
(104, 'Notebook', 2, 120),
(105, 'Laptop', 3, 55000),
(106, 'Printer', 3, 15000),
(107, 'Mouse', 3, 800);

select * from products;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders VALUES
(1001, 1, '2024-01-10', 5800),
(1002, 2, '2024-02-15', 56000),
(1003, 3, '2024-03-05', 15200),
(1004, 4, '2024-04-01', 130),
(1005, 5, '2024-05-12', 55200);

select * from orders;

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    discount DECIMAL(5,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items VALUES
(1, 1001, 101, 1, 0.10),
(2, 1001, 103, 2, 0.00),
(3, 1002, 105, 1, 0.05),
(4, 1003, 106, 1, 0.00),
(5, 1003, 107, 2, 0.00),
(6, 1004, 104, 1, 0.00),
(7, 1005, 105, 1, 0.10);

select * from order_items;

-- Customers whose total order amount is greater than average order value.
select customer_id, total_amount
from orders
where total_amount > (select avg(total_amount)
from orders);

-- Type 2: Multi-row Subquery (IN)

-- Get product names that are part of orders above ₹20,000.
select product_name
from products
where product_id in (
		select product_id
        from order_items
        where order_id in (select order_id from orders where total_amount > 20000)
);

-- Vowel or Consonant
-- Multi-column Subquery

-- Find product and category pairs that match the same combination as “Laptop”.
select product_name
from products
where (category_id, price) in(
	select category_id, price from products
    where product_name = 'Laptop'
);

-- outer query
-- Returns all products whose (category_id, price) matches any of those pairs
select product_id, product_name, category_id, price
from products 
where (category_id, price) in (
	select p.category_id, p.price
    from products p
    join order_items oi on p.product_id = oi.product_id
    join orders o on o.order_id = oi.order_id
    where o.total_amount > 20000
);