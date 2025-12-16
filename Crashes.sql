CREATE DATABASE Crashes;

USE Crashes;

SELECT * FROM `somerville crashes_cleaned`;

-- BASIC LEVEL (Foundational – Industry Style)

--  1.  Retrieve all crash records that occurred in the year 2022.
SELECT 
  MIN(date_and_time_of_crash) AS min_date,
  MAX(date_and_time_of_crash) AS max_date
FROM `somerville crashes_cleaned`;

SELECT *
FROM `somerville crashes_cleaned`
WHERE YEAR(date_and_time_of_crash) = 2022;

--  2.	Count the total number of crashes in the dataset.
select count(*) as total_number_of_crash from `somerville crashes_cleaned`;

-- 	3.	List unique weather conditions during crashes.
select distinct `weather_conditions` from `somerville crashes_cleaned`;

-- 	4.	Find all crashes that occurred during the Day Shift (8AM – 4PM).
select * from `somerville crashes_cleaned` where `date_and_time_of_crash` between '08:00:00' and '15:59:59';

-- 	5.	Count crashes grouped by police shift.
select police_shift, count(*) as crash_count from `somerville crashes_cleaned` group by police_shift;

-- 	6.	Get crashes where light conditions were DAYLIGHT.
select * from `somerville crashes_cleaned` where `light_conditions`= 'DAYLIGHT';

-- 	7.	Find crashes where the road surface was WET.
select * from `somerville crashes_cleaned` where `road_surface`= 'WET';

-- 	8.	Display all hit-and-run cases.
select `hit_and_run_flag` from `somerville crashes_cleaned` ;

-- 	9.	Count crashes per ward.
select ward, count(*) as total_crashes from `somerville crashes_cleaned` group by ward;

-- 	10.	Retrieve crashes where speed limit is greater than 40.
SELECT *
FROM `somerville crashes_cleaned`
WHERE speed_limit > 40;
