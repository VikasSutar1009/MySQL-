create database subquries_example2;

use subquries_example2;

create table superstore(
order_id varchar(20),
order_date date,
customer_name varchar(50),
region varchar(50),
category varchar(50),
sub_category varchar(50),
product_name varchar(100),
sales decimal(10,2),
quantity int,
discount decimal(5,2),
profit decimal(10,2)
);

insert into superstore (order_id, order_date, customer_name, region, category, sub_category, product_name, sales, quantity, discount, profit) 
VALUES
('ORD001', '2025-01-10', 'Amit Sharma', 'West', 'Furniture', 'Chairs', 'Office Chair', 250.00, 2, 0.10, 40.00),
('ORD002', '2025-01-12', 'Sneha Patil', 'East', 'Technology', 'Phones', 'iPhone 15', 1200.00, 1, 0.00, 200.00),
('ORD003', '2025-01-15', 'Ravi Kumar', 'South', 'Office Supplies', 'Binders', 'Binder Pack', 50.00, 5, 0.20, 10.00),
('ORD004', '2025-01-18', 'Meena Joshi', 'West', 'Technology', 'Laptops', 'Dell Laptop', 900.00, 1, 0.05, 150.00),
('ORD005', '2025-01-20', 'Anil Singh', 'North', 'Furniture', 'Tables', 'Study Table', 450.00, 1, 0.15, 70.00),
('ORD006', '2025-01-22', 'Priya Desai', 'East', 'Office Supplies', 'Paper', 'A4 Paper', 30.00, 3, 0.00, 5.00),
('ORD007', '2025-01-25', 'Vikas Gupta', 'South', 'Furniture', 'Chairs', 'Recliner Chair', 600.00, 2, 0.10, 90.00);

select * from superstore;

-- find orders with sales above average
select order_id , customer_name, sales 
from superstore
where sales > (select avg(sales) from superstore);

select order_id, customer_name, sales
from superstore
where sales > (select min(sales) from superstore);

select order_id, customer_name, sales
from superstore
where sales < (select max(sales) from superstore);

-- customer who bought technology products
select customer_name
from superstore
where category in (select distinct category from superstore where category = 'technology');