create database subqueries_example3;

use subqueries_example3;

CREATE TABLE carsshowroom (
    Carname VARCHAR(50),
    Brand VARCHAR(50),
    Price INT,
    City VARCHAR(50)
);

INSERT INTO carsshowroom (Carname, Brand, Price, City) VALUES
('Swift', 'Maruti', 600000, 'Mumbai'),
('Baleno', 'Maruti', 800000, 'Pune'),
('Creta', 'Hyundai', 1200000, 'Delhi'),
('Venue', 'Hyundai', 1100000, 'Mumbai'),
('Fortuner', 'Toyota', 3500000, 'Bangalore'),
('Innova', 'Toyota', 2500000, 'Pune'),
('City', 'Honda', 1500000, 'Delhi'),
('Amaze', 'Honda', 900000, 'Mumbai');

select * from carsshowroom;

select Carname,Brand, Price
from carsshowroom
where price > (select avg(price) from carsshowroom);

select Carname, city
from carsshowroom 
where city = (select city from carsshowroom where Carname='Fortuner');

-- Cars with the highest price
select Carname, Brand, Price
from carsshowroom
where price = (select max(Price) from carsshowroom);

--  Cars cheaper thab any Honda car
select Carname, Brand, Price
from carsshowroom
where price < (select min(Price) from carsshowroom where Brand = 'Honda');

-- Brands that have cars in mumbai
select Brand, City
from carsshowroom
where City in (select City from carsshowroom where City= 'Mumbai');