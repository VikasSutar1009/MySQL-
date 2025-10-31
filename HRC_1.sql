CREATE DATABASE HRC_1;

USE HRC_1;

CREATE TABLE departments(
dept_id int primary key,
dept_name varchar(50) not null
);

CREATE TABLE employees(
emp_id int primary key,
emp_name varchar(50) not null,
gender char(1) CHECK(gender in ('M', 'F')),
dept_id int,
salary decimal(10,2),
hire_date date,
foreign key (dept_id) references departments (dept_id)
);

INSERT INTO departments (dept_id, dept_name) values
(10, 'IT'),
(20,'HR'),
(30, 'Sales');

SELECT * FROM departments;

INSERT INTO  employees (emp_id, emp_name, gender, dept_id, salary, hire_date) values
(101, 'Rahul', 'M', 10, 55000, '2019-03-15'),
(102, 'Priya', 'F', 20, 65000, '2020-07-10'),
(103, 'Suresh', 'M', 10, 48000, '2021-02-12'),
(104, 'Ananya', 'F', 30, 72000, '2018-11-01'),
(105, 'Kiran', 'M', 20, 51000, '2022-06-20');

SELECT * FROM employees;

-- 1. Show details of employees hired after 2020-01-01.
select * from employees where hire_date > '2020-01-01';

-- 2. Find the total number of employees in each department.
select count(emp_id) as total_employees from employees group by dept_id;

-- 3. List names and salaries of employees earning more than ₹50,000.
select emp_name, salary from employees where salary > 50000;

-- 4. Retrieve names of all female employees.
select emp_name from employees where gender = 'F';

-- 5. Show details of employees hired after 2020-01-01.
select * from employees where hire_date > '2020-01-01';

-- 6. Display all departments in alphabetical order.
select dept_name 
from departments 
order by dept_name asc;

-- 7. Calculate the average salary of employees in the IT department.
select avg(salary) as avg_salary 
from employees where dept_id = (
select dept_id from departments where dept_name ='IT');

-- 8. Display the department name and total salary paid per department.
select dept_name, sum(salary) as totalsalary
from employees e 
join departments d 
on e.dept_id = d.dept_id
group by dept_name;

-- 9. Count the number of male and female employees.
select gender, count(*) from employees group by gender;

-- 10. Find the highest and lowest salary in each department.
select dept_id, max(salary) as maxsalary, min(salary) as minsalary 
from employees 
group by dept_id;

-- 11. Find employees whose names start with the letter ‘A’
select * from employees where emp_name like 'A%';

-- 12. Retrieve details of employees whose salary is between ₹50,000 and ₹70,000.
select * from employees where salary between 50000 and 70000;

-- 13. Show all employees not in the HR department.
select * from employees where not dept_id = (
select dept_id from departments where dept_name = 'HR');

-- 14. Show department names with more than 1 employee.
select dept_id, count(*) from employees group by dept_id having count(*)>1;

-- 15. Write a query to print Department Name and Total Number of Employees, sorted by highest count first.
select d.dept_name, count(e.emp_id) as total_employees 
from employees e 
left join departments d
on e.dept_id = d.dept_id
group by d.dept_name
order by count(*) desc;

-- 16. List employees who earn more than the average salary of all employees.
select * from employees where salary > (select avg(salary) as avg_salary from employees);

-- 17. Display all employee names along with their department names
select d.dept_name, e.emp_name
from employees e
left join departments d
on e.dept_id = d.dept_id;

-- 18. Display employees hired in the last 2 years. (Cognizant)
select * from employees where hire_date >=date_sub(curdate(), interval 2 year);

UPDATE employees SET hire_date = '2023-11-27' WHERE emp_id = 105;

-- Employees hired in same year as ‘Rahul’
SELECT emp_name FROM employees WHERE YEAR(hire_date) = (
SELECT YEAR(hire_date) FROM employees WHERE emp_name='Rahul'); 

-- 19. Top 3 highest-paid employees
select emp_name, salary from employees order by salary desc limit 3;

-- 20. Most recent hire (youngest)
select emp_name, hire_date
from employees
order by hire_date desc limit 1;

-- Total payrol
select sum(salary) as total_payrol
from employees;

-- Employees whose names contain ‘r’
select emp_name from employees where emp_name like '%r%';

-- Departments with avg salary > 60k
select d.dept_name, avg(e.salary) as avg_salary
from employees e
left join departments d
on e.dept_id = d.dept_id
group by dept_name
having avg(e.salary) > 60000;

-- Write a query to display first three characters of each employee’s name.
select emp_name, substring(emp_name,1,3) as short_name from employees;

-- Show employee name, salary, and salary grade based on: Salary < 50,000 → Grade C 50,000–70,000 → Grade B 70,000 → Grade A#
select emp_name, salary, 
case
	when salary <50000 then 'grade C'
    when salary between 50000 and 70000 then 'grade B'
    else 'grade A'
END as salary_grade
from employees;

-- Retrieve employees whose department name ends with ‘S’.
select e.emp_name, d.dept_name
from employees e
join departments d
on e.dept_id = d.dept_id
where d.dept_name like '%s';

-- Find total number of employees joined each year.
select year(hire_date) as year_joined, count(*) total_employees
from employees 
group by year(hire_date);

-- Departments with male employees
select distinct d.dept_name
from employees e 
inner join departments d 
on e.dept_id = d.dept_id
where e.gender = 'M';  

-- Find Nth highest salary (use subquery or window function).
-- Example: Find 3rd highest salary
select distinct salary
from employees e1
where 3 = (
	select count(distinct e2.salary)
    from employees e2
    where e2.salary >= e1.salary
);

-- using window function
select emp_name, salary
from(
	select emp_name, salary,
		dense_rank() over (order by salary desc) as rank_pos
	from employees
) ranked
where rank_pos = 3;

-- Display department name having the maximum total salary payout.
select d.dept_name, sum(e.salary) as total_salary
from employees e
join departments d on e.dept_id = d.dept_id
group by d.dept_name
order by total_salary desc
limit 1;

-- Show employees hired before their department’s oldest employee (tricky join).
select e.emp_name, e.dept_id, e.hire_date
from employees e
where e.hire_date < (
	select min(e2.hire_date)
    from employees e2
    where e2.dept_id = e.dept_id
);

-- Finds employees earning within 10% of the top earner.
select emp_name, salary
from employees 
where salary >= 0.9 * (select max(salary) from employees);

-- Create a query to find duplicate salaries in the company.
select salary, count(*) as count_same
from employees 
group by salary
having count(*)>1;

-- Display department name, number of employees, and difference between max & min salary.
select d.dept_name,
		count(e.emp_id) as total_employees,
        (max(e.salary) - min(e.salary)) as salary_differences
from employees e
join departments d on e.dept_id = d.dept_id
group by d.dept_name;

-- Find employees with same salary as another employee.
select e1.emp_name, e1.salary
from employees e1
join employees e2 on e1.salary - e2.salary and e1.emp_id <> e2.emp_id
order by e1.salary;

-- Write a query to update the salary of all HR employees by 10%.
update employees 
set salary = salary * 1.10
where dept_id = (
	select dept_id from departments where dept_name = 'HR'
);

select * from employees;

-- Delete employees earning less than 40,000 (use DELETE).
delete from employees where salary < 40000;
select * from employees;

-- Add a new department named “FINANCE” (use INSERT).
insert into departments (dept_id, dept_name) values
(40,'Finance');
select * from departments;