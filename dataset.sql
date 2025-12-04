CREATE DATABASE largedataset;

USE largedataset;

show tables;

-- 1. Write a query to show all records from the table.
select * from world_bank_data_sql;

-- 2. Display the list of all countries in the dataset.
select country_name from world_bank_data_sql;

-- 3. Show all unique years available in the dataset.
select distinct year from world_bank_data_sql;

-- 4. Find the GDP value for a specific country (example: India).
SELECT `GDP (Current USD)` FROM world_bank_data_sql WHERE country_name = 'India';

-- 5. Show the GDP and population for all countries in the year 2020.
SELECT `GDP (Current USD)`, `GDP per Capita (Current USD)` FROM world_bank_data_SQL WHERE year = 2020;

-- 6. Find all records where the population is greater than 10 million.
select * from world_bank_data_sql where `Gross national income (USD)` > 10000000;

-- 7. List the countries where GDP per capita is NOT NULL.
SELECT country_name, `GDP per Capita (Current USD)` FROM world_bank_data_SQL WHERE `GDP per Capita (Current USD)` IS NOT NULL;

-- 8. Show the inflation (CPI %) for all countries in 2015.
SELECT country_name, `Inflation (CPI %)` FROM world_bank_data_SQL WHERE year = 2015;

-- 9. Count how many records have NULL GDP.
SELECT COUNT(*) AS `null gdp count` FROM world_bank_data_sql WHERE `GDP (Current USD)` IS NULL;

-- 10. Find the total number of records for each country.
select distinct country_name, count(*) as total_resords from world_bank_data_sql group by country_name;

-- 11. Show the top 5 countries with the highest population.
SELECT country_name, year, `Gross National Income (USD)` FROM world_bank_data_sql ORDER BY `Gross National Income (USD)` DESC LIMIT 5;

-- 12. Display all records where GDP growth (%) is negative.
select * from world_bank_data_sql where `GDP Growth Annual` > 0;

-- 13. Show country, year, and GDP where GDP is above 1 trillion.
SELECT country_name, year, `GDP (Current USD)` FROM world_bank_data_sql WHERE `GDP (Current USD)` > 1000000000000;

-- 14. List the countries where tax revenue (% of GDP) is less than 5%.
SELECT DISTINCT country_name FROM world_bank_data_sql WHERE `Tax Revenue (% of GDP)` < 5;

-- 15. Find the records where inflation (CPI %) is equal to 0.
SELECT * FROM world_bank_data_sql WHERE `Inflation (CPI %)` = 0;
