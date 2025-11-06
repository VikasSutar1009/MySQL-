create database MySQL_REGEXP_practice;

use MySQL_REGEXP_practice;

create table employees(
emp_id int,
emp_name varchar(50),
department varchar(30)
);

insert into employees values
(1, 'Anita', 'HR'),
(2, 'Suresh', 'Finance'),
(3, 'Omkar', 'Sales'),
(4, 'Isha', 'IT'),
(5, 'Deepak', 'Admin'),
(6, 'Umesh', 'Support');

select * from employees;

-- Find all employee names that start with a vowel.
select * from employees where emp_name regexp '^[AEIOUaeiou]';

-- Find all employee names that end with a vowel.
select * from employees where emp_name regexp '[AEIOUaeiou]$';

-- Find all employee names that do not start with a vowel.
select * from employees where emp_name not regexp '^[AIOUaeiou]';

-- Create cities table
create table cities(
city_id int,
city_name varchar(50)
);

insert into cities values
(1, 'Indore'),
(2, 'Ahmedabad'),
(3, 'Pune'),
(4, 'Udaipur'),
(5, 'Bhopal'),
(6, 'Chennai');

select * from cities;

-- List all cities that contain at least one vowel.
select * from cities where city_name  regexp '[AEIOUaeiou]{1}';

-- List all cities that start and end with vowels.


-- Find all cities that have double vowels (like "oo", "aa", "ee").


-- create student table
create table Students(
roll_no int,
name varchar(50)
);

insert into Students values
(1, 'Aarav'),
(2, 'Esha'),
(3, 'Kunal'),
(4, 'Oviya'),
(5, 'Riya'),
(6, 'Utkarsh');

select * from Students;

-- Find names where the second letter is a vowel
select * from Students where name regexp '^.[AEIOUaeiou]';

-- Find names containing a vowel followed by “y”.
select * from Students where name regexp "[AEIOUaeiou]y";

-- Find names that end with a vowel but do not start with one.


-- create product table
create table products(
pid int,
pname varchar(50)
);

insert into products values
(1, 'Oil'),
(2, 'Apple'),
(3, 'Umbrella'),
(4, 'Ink'),
(5, 'Soap'),
(6, 'Egg');

select * from products;

-- Find product names starting with a vowel.
select * from products where pname regexp '^[AEIOUaeiou]';

-- Find products that end with “a”.
select * from products where pname regexp 'a$';

-- Find product names that contain more than one vowel.
select * from products where pname regexp '[AEIOUaeiou]{,2}';

-- create contries table
create table countries(
cid int,
country_name varchar(50)
);

insert into countries values
(1, 'India'),
(2, 'Australia'),
(3, 'Egypt'),
(4, 'Oman'),
(5, 'Ukraine'),
(6, 'Nepal');

select * from countries;

-- List countries starting with vowels.
select * from countries where country_name regexp '^[AEIOUaeiou]';

-- List countries ending with vowels.
select * from countries where country_name regexp '[AEIOUaeiou]$';

-- Find countries where the third letter is a vowel.


-- create movies table
create table movies(
movie_id int,
title varchar(50)
);

insert into movies values
(1, 'Avatar'),
(2,  'Eternals'),
(3, 'Ironman'),
(4, 'Ocean'),
(5, 'Up'),
(6, 'Dune');

select * from movies;

-- Find movies starting with a vowel.
select * from movies where title regexp'^[AEIOUaeiou]';

-- Find movies that contain consecutive vowels.


-- Find movies ending with a vowel.
select * from movies where title regexp '[AEIOUaeiou]$';