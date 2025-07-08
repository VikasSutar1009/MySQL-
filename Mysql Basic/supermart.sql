CREATE DATABASE supermart;

USE supermart;

CREATE TABLE products(
productname VARCHAR(100),
catgory VARCHAR(50),
brand VARCHAR(50),
quantity int,
price DECIMAL(10,2)
);


INSERT INTO products(productname,catgory,brand,quantity,price) values('milk 1l','dairy','Amul',50,55.00);
INSERT INTO products(productname,catgory,brand,quantity,price) values('bread loaf','bakery','Britannia',40,35.00);
INSERT INTO products(productname,catgory,brand,quantity,price) values('basmati rice 1kg','grocery','Daawat',30,120.00);
INSERT INTO products(productname,catgory,brand,quantity,price) values('toothpaste 100g','personal care','Colgate',60,45.00);
INSERT INTO products(productname,catgory,brand,quantity,price) values('shampoo 20ml','personal care','Dove',35,180.00);
INSERT INTO products(productname,catgory,brand,quantity,price) values('eggs pack of 6','poultry','Localfarm',25,65.00);
INSERT INTO products(productname,catgory,brand,quantity,price) values('butter 500h','dairy','Amul',20,250.00);
INSERT INTO products(productname,catgory,brand,quantity,price) values('datergent 1kg','household','Surf Excel',45,210.00);
INSERT INTO products(productname,catgory,brand,quantity,price) values('tomato ketchup 500g','grocery','Kissan',55,95.00);
INSERT INTO products(productname,catgory,brand,quantity,price) values('mineral water 1L','beverages','Bisleri',80,20.00);

select * from products;

select MIN(price) as min_price from products;

select MAX(price) as max_price from products;

select COUNT(*) as total_rows from products;

select AVG(quantity) as avg_quantity from products;

select SUM(quantity) as sum_quantity from products;

select * from products ORDER BY price asc limit 5;

select * from products where catgory='personal care';

select * from products ORDER BY quantity desc;

update products set price=40 where productname='basmati rice 1kg';

DELETE from products where catgory='grocery';

select * from products where quantity BETWEEN 40 AND 80;