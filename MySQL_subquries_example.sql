CREATE DATABASE MySQL_subquries_example;

USE MySQL_subquries_example;

CREATE TABLE customers(
customer_id int primary key,
customer_name varchar(50),
region varchar(20)
);

CREATE TABLE orders(
order_id int primary key,
customer_id int,
order_date date,
category varchar(20),
sales decimal(10,2),
foreign key (customer_id) references customers(customer_id)
);

INSERT INTO customers values
(1, 'Rohit Sharma', 'West'),
(2, 'Amit Verma', 'East'),
(3, 'Priya Singh', 'South'),
(4, 'Neha Patel', 'West');

INSERT INTO orders values
(101, 1, '2025-01-10', 'Furniture', 1500),
(102, 1, '2025-01-12', 'Office Supplies', 500),
(103, 2, '2025-01-15', 'Technology', 2500),
(104, 3, '2025-01-17', 'Furniture', 300),
(105, 4, '2025-01-18', 'Technology', 900),
(106, 4, '2025-01-18', 'Office Supplies', 200);

select * from customers;

select * from orders;

-- Find customers whose total sales > 2000
select customer_name from customers
where  customer_id in (
	select customer_id 
    from orders 
    group by customer_id 
    having sum(sales) > 2000
);


-- Show customer + total spend in one query
select customer_name, 
	(select sum(sales)
    from orders o
    where o.customer_id = c.customer_id)
as total_sales
from customers c;

-- Find each order’s % contribution to customer sales
select order_id, customer_id, sales,
sales / (
	select sum(sales)
    from orders o
    where o.customer_id = orders.customer_id
) * 100 as percent_of_customer_sales
from orders;

-- Top spending customer
select customer_name, total_sales
from (
	select customer_id , sum(sales) as total_sales 
    from orders 
    group by customer_id
) t
join customers c on c.customer_id = t.customer_id 
order by total_sales desc limit 1;


CREATE TABLE mobile_sales (
    sale_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    mobile_brand VARCHAR(30),
    quantity INT,
    price DECIMAL(10,2)  -- price per mobile
);

INSERT INTO mobile_sales VALUES
(1,'Ravi','Samsung',1,15000),
(2,'Asha','Apple',2,60000),
(3,'Ravi','Vivo',1,12000),
(4,'Sanjay','Samsung',3,14000),
(5,'Asha','Samsung',1,15000),
(6,'Neha','Vivo',2,12000);

select * from mobile_sales;

-- 1️ Find customers who bought Samsung
select customer_name, mobile_brand from mobile_sales where mobile_brand = 'Samsung';

SELECT customer_name
FROM mobile_sales
WHERE customer_name IN (
      SELECT customer_name
      FROM mobile_sales
      WHERE mobile_brand = 'Samsung'
);

-- 2 Count total Samsung mobiles sold
select count(quantity) as total from mobile_sales where mobile_brand = 'Samsung';

SELECT (
    SELECT distinct SUM(quantity)
    FROM mobile_sales
    WHERE mobile_brand = 'Samsung'
) AS total_samsung_sales;

-- 3 Customers who purchased more than 1 quantity in a single order
select customer_name from mobile_sales where quantity > 1;

SELECT customer_name
FROM mobile_sales
WHERE sale_id IN (
    SELECT sale_id
    FROM mobile_sales
    WHERE quantity > 1
);

-- 4 Customers whose total quantity purchased > 2
select customer_name from mobile_sales where quantity > 2;

SELECT DISTINCT customer_name
FROM mobile_sales
WHERE customer_name IN (
    SELECT customer_name
    FROM mobile_sales
    GROUP BY customer_name
    HAVING SUM(quantity) > 2
);

-- 5 Get each customer’s total spending
select customer_name, sum(quantity) as total from mobile_sales group by customer_name;

SELECT 
    customer_name,
    (SELECT SUM(quantity*price)
     FROM mobile_sales ms2
     WHERE ms2.customer_name = ms1.customer_name) AS total_spent
FROM mobile_sales ms1
GROUP BY customer_name;

-- 6 Find max price among all mobiles
select max(price) as max_price from mobile_sales ;
SELECT *
FROM mobile_sales
WHERE price = (
      SELECT MAX(price)
      FROM mobile_sales
);

-- 7 Find orders higher than avg mobile price
select * 
from mobile_sales
where price > (
	select avg(price) as avg_price from mobile_sales
);

-- 8 Find customers who bought Vivo
select customer_name from mobile_sales where mobile_brand = 'Vivo';


-- 9 Find brands whose avg price > Rs 20,000
select mobile_brand ,
avg(price) as avg_price
from mobile_sales
group by mobile_brand
having avg(price) > 20000;

SELECT DISTINCT mobile_brand
FROM mobile_sales
WHERE mobile_brand IN (
      SELECT mobile_brand
      FROM mobile_sales
      GROUP BY mobile_brand
      HAVING AVG(price) > 20000
);

-- 10 Count how many customers purchased each brand
select mobile_brand, count(*) as total from mobile_sales group by mobile_brand;

SELECT m1.mobile_brand,
       (SELECT COUNT(DISTINCT customer_name)
        FROM mobile_sales m2
        WHERE m2.mobile_brand = m1.mobile_brand) AS customer_count
FROM mobile_sales m1
GROUP BY mobile_brand;