create database mysql_advanced_concept;

use mysql_advanced_concept;

create table employees (
emp_id int,
emp_name varchar (50),
department varchar (30),
salary decimal (10,2),
hire_date date

);

insert into employees values 
(101, "Amit", "Sales", 45000, "2020-01-15"),
(102, "Priya", "IT", 60000, "2019-11-10"),
(103, "Ravi", "HR", 50000, "2021-05-20"),
(104, "Sneha", "IT", 65000, "2018-09-12"),
(105, "Vikas", "Sales", 48000, "2022-02-01");

select * from employees;

select emp_name, salary from employees where department = "IT";

select emp_name, Salary from employees where salary > 50000;

select count(*) as total_empoyees from employees;

select avg(salary) as avg_salary from employees;

select max(salary) as max_salary from employees;

select min(salary) as min_salary from employees;

select sum(salary) as total_salary from employees;






create table sales (
sale_id int,
emp_id int,
sale_amount decimal (10,2),
sale_date date 

);


insert into sales values 
(1, 101, 5000, "2024-01-10"),
(2, 101, 7000, "2024-02-15"),
(3, 102, 8000, "2024-03-15"),
(4, 103, 3000, "2024-01-20"),
(5, 105, 9000, "2024-03-10"),
(6, 105, 4000, "2024-03-30");

select * from sales;

-- total sales by each employee
select emp_id, sum(sale_amount) as total_sales
from sales
group by emp_id;

-- only those who said more than 10000
select emp_id, sum(sale_amount) as total_sales
from sales 
group by emp_id
having sum(sale_amount) > 10000;




create table departments (
dept_name varchar(30),
manager_name varchar (50),
location varchar (30)
);

insert into departments values 
("Sales", "Rajesh", "Mumbai"),
("IT", "Karan", "Pune"),
("HR", "Simran", "Delhi"),
("Finance", "Aarti", "Chennai");


select * from departments; 

-- INNER JOIN
-- Returns only matching records from both tables.
select e.emp_name, e.department, d.manager_name, d.location
from employees e 
inner join departments d 
on e.department = d.dept_name;


-- LEFT JOIN
-- Returns all rows from the left table, even if there is no match in the right table.
select e.emp_name, e.department, d.manager_name
from employees e 
left join departments d 
on e.department = d.dept_name;


-- RIGHT JOIN
-- Opposite of LEFT JOIN. Returns all rows from the right table.
select e.emp_name, e.department, d.manager_name 
from employees e 
right join departments d 
on e.department = d.dept_name;


-- FULL JOIN (if your DB supports it)
-- Returns all records from both sides (MySQL doesn’t have FULL JOIN directly — we simulate it using UNION).
select e.emp_name, e.department, d.manager_name
from employees e 
left join departments d 
on e.department = d.dept_name

union 

select e.emp_name, e.department, d.manager_name 
from employees e 
right join departments d 
on e.department = d.dept_name;


create table projects (
project_id int,
project_name varchar (50),
emp_id int,
budget decimal(10,2)
);

insert into projects values
(1, "CRM System", 102, 150000),
(2, "HR Portal", 103, 80000),
(3, "Sales Dashbord", 101, 120000),
(4, "Cloud Migration", 104, 200000),
(5, "Customer Feedback", 105, 70000);

select * from projects;


-- Subquery in WHERE
-- Find employees who earn more than the average salary.
select emp_name, salary 
from employees 
where salary > (select avg(salary) from employees);


-- Subquery in FROM
-- Calculate total project budgets by department using a subquery.
select department, sum(total_budget) as dept_total_budget
from (
select e.department, p.budget as total_budget
from employees e 
join projects p on e.emp_id = p.emp_id
) as sub
group by department;


-- Subquery with IN
-- Find employees who are working on projects with budgets above 100000.
select emp_name 
from employees 
where emp_id in (
select emp_id from projects where budget > 100000
);


-- CASE Expression
select emp_name,
 department,
 salary, 
case
when salary > 60000 then "High Earner"
when salary between 45000 and 60000 then "mid Earner"
else "Low Earner"
end as salary_level
 from employees ;



-- String & Date Functions
SELECT emp_name, SYSDATE() AS system_time FROM employees;












-- Advance MySQL Begins
CREATE TABLE sales_data (
    sale_id INT,
    emp_id INT,
    sale_amount DECIMAL(10,2),
    sale_month VARCHAR(20)
);

INSERT INTO sales_data VALUES
(1, 101, 5000, 'Jan'),
(2, 101, 7000, 'Feb'),
(3, 102, 8000, 'Jan'),
(4, 102, 6000, 'Feb'),
(5, 103, 4000, 'Jan'),
(6, 103, 9000, 'Feb'),
(7, 101, 10000, 'Mar'),
(8, 102, 9000, 'Mar'),
(9, 103, 5000, 'Mar');

select * from sales_data;

-- ROW_NUMBER()
-- Gives a unique sequence number for each row within a partition.

select emp_id, sale_month, sale_amount,
row_number() over (partition by emp_id order by sale_amount desc) as row_num
from sales_data;


-- RANK() leaves gaps if there are ties.
-- DENSE_RANK() does not.
select emp_id, sale_month, sale_amount,
rank () over (partition by emp_id order by sale_amount desc) as rank_no,
dense_rank () over (partition by emp_id order by sale_amount desc) as dense_rank_no
from sales_data;


-- SUM() OVER
-- Running total (cumulative sum).
SELECT emp_id, sale_month, sale_amount,
SUM(sale_amount) OVER (PARTITION BY emp_id ORDER BY sale_month) AS running_total
FROM sales_data;


-- CTE – Common Table Expressions
-- CTEs are like temporary named result sets you can reuse within a query.
with high_sales as (
select emp_id, sum(sale_amount) as total_sales
from sales_data
group by emp_id
)
select * from high_sales where total_sales > 15000;


-- Multiple CTEs
WITH emp_total AS (
    SELECT emp_id, SUM(sale_amount) AS total_sales
    FROM sales_data
    GROUP BY emp_id
),
emp_rank AS (
    SELECT emp_id, total_sales,
           RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
    FROM emp_total
)
SELECT * FROM emp_rank WHERE sales_rank <= 2;