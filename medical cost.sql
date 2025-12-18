CREATE DATABASE Medical_cost;

USE Medical_cost;

select *  from medical_cost;

-- 1. Display all records from the dataset
select * 
from medical_cost;

--  2. Show only age, sex, bmi and charges columns
select age, 
gender, 
bmi, 
annual_medical_cost 
from medical_cost;

--  3. Find all records where the person is a smoker
select * 
from medical_cost 
where smoker = 'yes';

--  4. List all unique regions available in the dataset
select distinct city_type 
from medical_cost;

--  5. Count the total number of records
select count(*) as total_records 
from medical_cost;

--  6. Find the average medical charges
select avg(annual_medical_cost) as avg_charges 
from medical_cost;

--  7. Display records where bmi is greater than 30
select * 
from medical_cost 
where bmi > 30;

--  8. Count how many males and females are in the dataset.
select gender,
count(*) as total 
from medical_cost 
group by gender;

--  9. show all records where the number of children is 0
select * 
from medical_cost 
where children = 0;

--  10. Find the minimum and maximum medical charges
select 
	min(annual_medical_cost) as min_charges,
    max(annual_medical_cost) as max_charges
from medical_cost;


-- 11. Find the average charges for smoker and non-smoker separately
select smoker, 
avg(annual_medical_cost)  
from medical_cost 
group by smoker;


-- 12. Count how many people belong to each region
select city_type, 
count(*) as total_people 
from medical_cost 
group by city_type;

-- 13. Find the average BMI for males and females
select gender,
avg(bmi) as avg_bmi 
from medical_cost 
group by gender;

-- 14. List records where age is between 25 and 40
select * 
from medical_cost 
where age between 25 and 40;

-- 15. Show all records where charges exceed 50,000.
select *
from medical_cost 
where annual_medical_cost > 50000;

-- 16. Calculate total medical charges per region
select city_type,
 sum(annual_medical_cost) as total_charges 
 from medical_cost
 group by city_type;

-- 17. Find the average charges for people having at least 2 children
 SELECT AVG(charges) AS avg_charges
    FROM medical_costs
    WHERE children >= 2;

-- 18. Display records sorted by charges in desc order
select *
from medical_cost
order by annual_medical_cost desc;

-- 19. Count how many smokers are there in each region
select distinct city_type, count(*) as smoker_count
from medical_cost
where smoker = 'yes'
group by city_type;

-- 20. Find the average age of people who are smokers.
select avg(age) as avg_age 
from medical_cost 
where smoker= 'yes';