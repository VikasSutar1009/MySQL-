CREATE DATABASE SQL_Challenge_Practice_For_ZV;

USE SQL_Challenge_Practice_For_ZV;

CREATE TABLE owners(
owner_id int primary key,
owner_name varchar(100),
owner_email varchar(100)
);

INSERT INTO owners (owner_id, owner_name, owner_email) VALUES
(1, 'Rajesh Sharma', 'rajesh@homes.com'),
(2,'Anita Mehra', 'anita@rentals.com'),
(3,'John Peterson', 'john@estatehub.com');

CREATE TABLE properties(
property_id int primary key,
owner_id int,
address varchar(200),
city varchar(100),
nightly_rate decimal(10,2),
property_type varchar(50),
created_at date,
foreign key (owner_id) references owners(owner_id)
);

INSERT INTO properties values
(101, 1, '12 MG Road', 'Mumbai', 4500, 'Apartment', '2024-01-10'),
(102, 1, '55 Hillside View', 'Pune', 3500, 'Villa', '2024-03-22'),
(103, 2, '89 Pearl Residency', 'Delhi', 4000, 'Apartment', '2024-02-15'),
(104, 3, '77 Riverwalk Homes', 'Bengaluru', 3800, 'Studio', '2024-04-08'),
(105, 3, '120 Palm Street', 'Chennai', 3200, 'Apartment', '2024-05-20');

CREATE TABLE guests(
guest_id int primary key,
guest_name varchar(100),
guest_email varchar(100),
country varchar(50)
);

INSERT INTO guests values
(501, 'Arjun Verma', 'arjunv@mail.com', 'India'),
(502, 'Maria Lopez', 'maria.lopez@mail.com', 'Spain'),
(503, 'Chen Wei', 'chewei@mail.com', 'Chaina'),
(504, 'Sarah Collins', 'sarahc@mail.com', 'USA');

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    property_id INT,
    guest_id INT,
    start_date DATE,
    end_date DATE,
    total_price DECIMAL(10,2),
    FOREIGN KEY (property_id) REFERENCES properties(property_id),
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id)
);

INSERT INTO bookings (booking_id, property_id, guest_id, start_date, end_date, total_price) VALUES
(9001, 101, 501, '2024-06-01', '2024-06-05', 18000),
(9002, 102, 502, '2024-06-10', '2024-06-15', 17500),
(9003, 101, 503, '2024-07-02', '2024-07-05', 13500),
(9004, 104, 504, '2024-07-18', '2024-07-20', 7600),
(9005, 105, 501, '2024-08-01', '2024-08-04', 9600);

CREATE TABLE reviews(
review_id int primary key,
property_id int,
guest_id int,
rating int,
review_text varchar(300),
created_at date,
foreign key (property_id) references properties(property_id),
foreign key (guest_id) references guests(guest_id)
);

INSERT INTO reviews values
(3001, 101, 501, 4, 'Great stay!', '2024-06-06'),
(3002, 102, 502, 5, 'Very peaceful villa.', '2024-06-16'),
(3003, 101, 503, 3, 'Room was small.', '2024-07-06'),
(3004, 104, 504, 4, 'Good location', '2024-07-22');

select * from owners;
select* from properties;
select*from guests;
select*from bookings;
select*from reviews;

-- 1. List all properties with their owners’ names.
select p.address, p.city, o.owner_name
from properties p 
join owners o 
on o.owner_id = p.owner_id;

-- 2. Find the total number of bookings per property.
select p.property_id, p.address, count(b.booking_id)as total_bookings
from properties p 
left join bookings b 
on p.property_id = b.property_id
group by p.property_id, p.address;

-- 3. Get the number of guests from each country.
select country, count(*) as total_guests 
from guests 
group by country;

-- 4. Get city-wise average nightly rate.
select city, avg(nightly_rate) as avg_rate
from properties
group by city;


-- Advanced
-- Q1: Show all properties in Mumbai OR Pune with a nightly rate greater than 4000.
select *
from properties
where city in('Mumbai' or 'Pune')
and nightly_rate > 4000;

-- Q2: List all properties ordered by nightly_rate descending.
select * from properties order by nightly_rate desc;

-- Q3: Insert a new guest named Priya Nair, from India, email: priya@mail.com, guest_id 505.
insert into guests values
(505, 'Priya Nair', 'priya@mail.com', 'India');

select * from guests;

-- Q4: Select all guests whose country value is NULL.
select * from guests where country = null;

-- Q5: Update the nightly rate of property 103 to 4200.
update properties 
set nightly_rate = 4200
where property_id = 103;
select * from properties;

-- Q6: Delete the review with review_id = 3003.
delete from reviews where review_id = 3003;
select * from reviews;

-- Q7: Show the top 2 most expensive properties by nightly rate.
select * from properties
order by nightly_rate desc limit 2;

-- Q8: Find the minimum and maximum nightly rate among all properties.
select min(nightly_rate), max(nightly_rate)
from properties;

-- Q9: Calculate the average rating for property 101.
select property_id, avg(rating) as avg_rate
from reviews
where property_id = 101;

-- Q10: Show all guests whose name starts with 'A'.
select * from guests where guest_name like 'A%';

-- Q11: Find all properties where the address contains the word 'Road'.
select * from properties where address like '%Road%';

-- Q12: Show all bookings for properties located in ('Mumbai', 'Pune', 'Delhi').
select p.city, b.*
from bookings b 
join properties p 
on b.property_id = p.property_id
where city in ('Mumbai', 'Pune', 'Delhi');

-- Q13: Count how many properties exist in each city.
select city, count(property_id) as total_properties
from properties
group by city;

-- Q14: Show cities that have more than 1 property.
select city, count(property_id)
from properties
group by city
having count(property_id) >1;

-- Q15: Show all guests who have at least one booking.
select g.guest_name, b.booking_id, b.start_date, b.end_date, b.total_price
from guests g
inner join bookings b
on g.guest_id = b.guest_id;