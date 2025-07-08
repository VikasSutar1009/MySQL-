CREATE DATABASE BasicQuries3;

USE BasicQuries3;

CREATE TABLE SalesData(
product_name VARCHAR(50),
category VARCHAR(50),
price DECIMAL(10,2),
quantity int
);

INSERT INTO SalesData(product_name,category,price,quantity) values('pen','stationery',10.00,100);
INSERT INTO SalesData(product_name,category,price,quantity) values('notebook','stationery',50.00,200);
INSERT INTO SalesData(product_name,category,price,quantity) values('mouse','electronics',400.00,50);
INSERT INTO SalesData(product_name,category,price,quantity) values('keyboard','electronics',800.00,30);
INSERT INTO SalesData(product_name,category,price,quantity) values('chair','furniture',1500.00,10);
INSERT INTO SalesData(product_name,category,price,quantity) values('desk','furniture',3000.00,5);
INSERT INTO SalesData(product_name,category,price,quantity) values('pen','stationery',10.00,50);

select * from SalesData;

-- minimum price
select MIN(price) AS min_price FROM SalesData;

-- maximum price
select MAX(price) AS max_price FROM SalesData;

-- total quantity sold
select SUM(quantity) AS total_quaantity FROM SalesData;

-- average price
select AVG(price) AS average_price FROM SalesData; 

-- count of records
select COUNT(*) AS total_rows FROM SalesData;

-- bonus:aggregate grouped by category
select category,
	MIN(price) AS min_price, 
    MAX(price) AS max_price, 
    SUM(quantity) AS tital_quantity,
    AVG(price) AS average_price, 
    COUNT(*) AS record_count
FROM SalesDAta 
GROUP BY category;
