CREATE DATABASE In_Between;

USE In_Between;

CREATE TABLE orders(
order_id int,
customer_name VARCHAR(50),
order_amount DECIMAL(10,2),
order_date date
);

INSERT INTO orders (order_id,customer_name,order_amount,order_date) values(201,'Alice',1200.50,'2024-01-15');
INSERT INTO orders (order_id,customer_name,order_amount,order_date) values(202,'Bob',800.00,'2024-01-18');
INSERT INTO orders (order_id,customer_name,order_amount,order_date) values(203,'Charlie',1500.00,'2024-02-01');
INSERT INTO orders (order_id,customer_name,order_amount,order_date) values(204,'David',2500.75,'2024-02-10');
INSERT INTO orders (order_id,customer_name,order_amount,order_date) values(205,'Eve',950.00,'2024-03-05');
INSERT INTO orders (order_id,customer_name,order_amount,order_date) values(206,'Alice',1100.25,'2024-03-10');

select * from orders;

-- Using IN : Get orders by Alice or Eve
select * from orders WHERE customer_name IN ('Alice','Eve');

-- using BETWEEN : Get orders between 1000 and 2000
select * from orders WHERE order_amount BETWEEN 1000 AND 2000;

-- Using BETWEEN with dates: february 2024 orders
select * from orders WHERE order_date BETWEEN '2024-02-01' AND '2024-02-29';