CREATE DATABASE Laptop_sales;

USE Laptop_sales;

SELECT * FROM Laptop;

--  1.	Display all laptop models with their price and rating.
select Model, Price, Rating from Laptop;

-- 	2.	Find all laptops running on Windows 11 OS.
select * from Laptop where OS = 'Windows 11 OS';

-- 	3.	List laptops with a rating greater than 70.
select * from Laptop where Rating > 70;

-- 	4.	Show laptops priced below ₹30,000.
select *
from Laptop
where Price < 30000;

-- 	5.	Count the total number of laptops in the dataset.
select count(*) as total_laotops
from Laptop;

-- 	6.	List all distinct processor generations available.
select distinct Generation from Laptop ;

-- 	7.	Find laptops that have 8 GB RAM.
select * 
from Laptop
where Ram = 8;

-- 	8.	Display all laptops with Intel graphics.
select *
from Laptop
where Graphics like '%Intel%';

-- 	9.	Find laptops with 1 Year Warranty.
select * 
from Laptop 
where Warranty = 1 ;

-- 	10.	Sort laptops by price in ascending order.
select *
from Laptop
order by Price asc ;

--  11.	Find the average price of all laptops.
select avg(Price) as avg_price 
from Laptop ;

-- 	12.	Find the maximum and minimum laptop price.
Select 
Min(Price) as min_price,
max(Price) as max_price
from Laptop;

-- 	13.	Count how many laptops belong to each OS.
select OS, 
count(*) as total_laptops
from Laptop
group by OS;

-- 	14.	Find the average rating per processor generation.
select Generation,
avg(Rating) as avg_rating
from Laptop
group by Generation;

-- 	15.	Count laptops grouped by RAM configuration.
select Ram,
count(*) as total_laptops
from Laptop
group by Ram;

-- 	16.	Find the total number of laptops with SSD ≥ 512 GB.
select count(*) as total_laptops 
from laptop
where SSD >= 512;

-- 	17.	Display the average price for each graphics type.
select Graphics,
 avg(Price) as avg_price 
from Laptop
group by Graphics;

-- 	18.	Find the number of laptops for each warranty type.
select Warranty,
count(*) as total_laptops
from Laptop
group by Warranty;

-- 	19.	Show processor generations having more than 2 laptops.
select Generation,
count(*) as total_laptop
from Laptop
group by Generation
having count(*) > 2;

-- 	20.	Find the highest-rated laptop.
select Rating
from Laptop
order by Rating desc
limit 1;

--  21.	Find laptops whose model name contains “Gaming”.
select *
from Laptop
where Model like '%Gaming%';

-- 	22.	Display laptops with AMD Ryzen processors.
select *
from Laptop
where Generation like '%AMD Ryzen%';

-- 	23.	Find laptops that have NVIDIA graphics.
select * 
from Laptop
where Graphics like '%NVIDIA%';

-- 	24.	List laptops with Touch Screen display.
select *
from Laptop
where Display like'%Touch%';

-- 	25.	Find laptops with rating between 60 and 80.
select *
from Laptop
where Rating between 60 and 80;

-- 	26.	Display laptops priced between ₹40,000 and ₹70,000.
select *
from Laptop
where Price between 40000 and 70000;

-- 	27.	Find laptops with Quad Core or higher processors.
select *
from Laptop
where Generation >= 4;

-- 	28.	Show laptops where RAM is greater than 8 GB.
select *
from Laptop
where Ram > 8;

-- 	29.	Find laptops having RTX series graphics.
select *
from Laptop
where Graphics like '%RTX%';

-- 	30.	Display laptops whose display size is 15.6 inches.
select *
from Laptop
where Display = 15.6;
