CREATE DATABASE Ai_developer;

USE Ai_developer;

SELECT * FROM AI_Developer;

-- Get all records where Sleep_Hours is less than 5 hours.
select * from AI_Developer where Sleep_Hours < 5;

-- Get rows where Stress_Level is greater than 90.
select * from AI_Developer where Stress_Level > 90;

-- Show developers who fixed more bugs than they found.
select * from AI_Developer where Bugs_Fixed > Bugs_Found;

-- List records where Coffee_Intake equals 0.
select * from AI_Developer where Coffee_Intake = 0;

-- Fetch developers whose Task_Success_Rate is between 80 and 100.
select * from AI_Developer where Task_Success_Rate between  80 and 100;

-- Find the average number of Commits across developers.
select avg(Commits) as avg_commit from AI_Developer;

-- Get the maximum Hours_Coding recorded.
select max(Hours_Coding) as max_coding from AI_Developer;

-- Calculate the total Lines_of_Code written by all developers.
select sum(Lines_of_Code) as total from AI_Developer;

-- Find the minimum Stress_Level.
select min(Stress_Level) as min_Level from AI_Developer;

-- Get average Errors grouped by Cognitive_Load level.
select Cognitive_Load, avg(Errors) as avg_errors
from AI_Developer 
group by Cognitive_Load;

-- Count how many rows where AI_Usage_Hours > 5.
select count(*) as total_rows from AI_Developer where AI_Usage_Hours > 5;

-- Show top 10 rows sorted by highest Bugs_Found.
select * from AI_Developer order by Bugs_Found desc limit 10;

-- Show 5 developers with lowest Sleep_Hours.
select * from AI_Developer order by Sleep_Hours asc limit 5;

-- Sort developers by Stress_Level descending.
select * from AI_Developer order by Stress_Level desc;

-- Show developers sorted by most Task_Duration_Hours.
select * from AI_Developer order by Task_Duration_Hours desc;

-- Group records by Coffee_Intake and count number of developers per intake.
select Coffee_Intake, count(*) as total
from AI_Developer
group by Coffee_Intake;

-- Group by Stress_Level ranges (e.g. 0–50, 51–80…) and calculate average Sleep_Hours.
select Stress_Level, avg(Sleep_Hours) as avg_hours
from AI_Developer
group by Stress_Level;

-- Group by AI_Usage_Hours and compute average Task_Success_Rate.
select AI_Usage_Hours, avg(Task_Success_Rate) as avg_hours
from AI_Developer
group by AI_Usage_Hours;

-- Count number of developers grouped by Hours_Coding > 8 (using CASE).
select Hours_Coding,  count(*) as developers
from AI_Developer
group by Hours_Coding
having Hours_Coding > 8;

-- Group by Cognitive_Load and show only groups having more than 20 rows.
select Cognitive_Load, count(*) as total
from AI_Developer
group by Cognitive_Load
having count(*) > 20;

-- Calculate Bugs_Remaining = Bugs_Found – Bugs_Fixed for every developer.
select * , (Bugs_Found - Bugs_Fixed) as Bugs_Remaining
from AI_Developer;

-- Find % error rate = Errors / Lines_of_Code * 100.
select *,
       (Errors / NULLIF(Lines_of_Code, 0)) * 100 as Error_Rate_Percentage
from AI_Developer;


-- Show developers where Bugs_Found / Hours_Coding > 3.
select * from AI_Developer where Bugs_Found / Hours_Coding > 3;

-- Extract rows where Task_Duration_Hours per commit exceeds 0.5 hours.
select *
from AI_Developer
where Task_Duration_Hours / NULLIF(Commits, 0) > 0.5;


-- Compare Stress_Level vs Sleep_Hours to show developers with high stress but low sleep.
select * from AI_Developer where Stress_Level > 80 and Sleep_Hours < 5; 