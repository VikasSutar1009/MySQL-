-- 1
CREATE DATABASE company_db;

-- 2
USE company_db;

-- 3
CREATE TABLE employees(
	emp_id INT,
    name VARCHAR(100),
    email VARCHAR(100),
    salary INT,
    department VARCHAR(50),
    join_date DATE
);

-- 4. Add a primary key to emp_id.
ALTER TABLE employees ADD PRIMARY KEY (emp_id);

-- 5. Modify salary column to allow decimal values.
ALTER TABLE employees MODIFY salary DECIMAL(10,2);

-- 6. Add a new column status with default value ACTIVE.
ALTER TABLE employees ADD status VARCHAR(20) DEFAULT 'ACTIVE';

-- 7. Rename column name to emp_name.
ALTER TABLE employees RENAME COLUMN name TO emp_name;

-- 8. Rename table employees to employee_master.
ALTER TABLE employees RENAME TO employee_master;

-- 9. Drop the column status.
ALTER TABLE employee_master DROP COLUMN status;

-- 10. Delete the table employee_master
DROP TABLE employee_master;

-- 11.Insert one record into employees.
INSERT INTO employees VALUES( 101, 'Amit', 'amit@gmail.com', 50000, 'IT', '2023-01-10');

-- 12. Insert multiple records in a single query.
INSERT INTO employees VALUES
(102,'Neha', 'neha@gmail.com', 60000, 'HR', '2022-05-12'),
(103,'Raj', 'raj@gmail.com', 70000, 'IT', '2021-03-15');

-- 13. Insert data using column names.
INSERT INTO employees (emp_id, emp_name, salary)
values (104, 'Sita', 45000);

-- 14. Insert a record without specifying column names.
INSERT INTO employees VALUES
(105, 'Ravi', 'ravi@gmail.com', 40000, 'Finance', '2020-11-20');

-- 15. Insert a record with current date as join_date
INSERT INTO employees VALUES
(106, 'Anil', 'anil@gmail.com', 55000, 'IT', CURDATE());

-- 16. Insert only selected columns.
INSERT INTO employees (emp_id, emp_name)
VALUES (107, 'Pooja');

-- 17. Insert data from another table.
INSERT INTO employees_archive
SELECT * FROM emplpyees;

-- 18. Insert a record where salary is NULL.
INSERT INTO employees VALUES
(108, 'Karan', NULL, NULL, NULL, NULL);

-- 19. Insert a record using DEFAULT value
INSERT INTO employees VALUES
(109, 'Meera', 'meera@gmail.com', DEFAULT, 'HR', '2024-02-01');

-- 20. Insert duplicate record and observe behavior
INSERT INTO employees VALUES
(101, 'Duplicate', 'dup@gmail.com', 30000, 'IT', '2023-01-01');

-- 21. Display all records from employees.
SELECT * FROM employees;

-- 22. Display only emp_name and salary.
SELECT emp_name, salary FROM employees;

-- 23. Display unique departments.
SELECT DISTINCT department FROM employees;

-- 24. Display employees with salary greater than 50,000
SELECT * FROM employees WHERE salary > 50000;

-- 25. Display employees whose department is IT.
SELECT * FROM employees WHERE department = 'IT';

-- 26. Display employees joined after 2023-01-01.
SELECT * FROM employees WHERE join_date > '2023-01-01';

-- 27. Display employees sorted by salary (ascending)
SELECT * FROM employees ORDER BY salary ASC;

-- 28. Display employees sorted by join date (descending)
SELECT * FROM employees ORDER BY join_date DESC;

-- 29. Display top 5 highest paid employees.
SELECT * FROM employees ORDER BY salary DESC LIMIT 5;

-- 30. Display employees with NULL salary.
SELECT * FROM employees WHERE salary IS NULL;

-- 31. Display employees with salary between 30,000 and 80,000
SELECT emp_name, salary FROM employees WHERE salary between 3000 and 80000;

-- 32. Display employees whose department is IT or HR.
SELECT emp_name, department FROM employees WHERE department IN ('IT','HR');

-- 33. Display employees whose salary is NOT 50,000.
SELECT * FROM employees WHERE salary != 50000;

-- 34. Display employees whose name starts with A.
SELECT * FROM employees WHERE emp_name LIKE 'A%';

-- 35. Display employees whose name ends with n.
SELECT * FROM employees WHERE emp_name LIKE '%n';

-- 36. Display employees whose name contains ar.
SELECT * FROM employees WHERE emp_name LIKE '%ar%';

-- 37. Display employees with department IN (IT, Finance).
SELECT * FROM employees WHERE department IN ('IT','Finance');

-- 38. Display employees NOT IN HR.
SELECT * FROM employees WHERE department NOT IN ('HR');

-- 39. Display employees where email is NULL
SELECT * FROM employees WHERE email IS NULL;

-- 40. Display employees where email is NOT NULL.
SELECT * FROM employees WHERE email IS NOT NULL;

-- 41. Find total number of employees.
SELECT COUNT(*) AS total_employees FROM employees;

-- 42. Find average salary of employees.
SELECT AVG(salary) AS avg_salary FROM employees;

-- 43. Find highest salary.
SELECT MAX(salary) FROM employees;

-- 44. Find lowest salary.
SELECT MIN(salary) FROM employees;

-- 45. Find department-wise employee count.
SELECT department, COUNT(*) as total_employees FROM employees GROUP BY department;

-- 46. Find department-wise average salary.
SELECT department, AVG(salary) as avg_salary from employees GROUP BY department;

-- 47. Display departments having more than 3 employees.
SELECT department FROM employees GROUP BY department having count(*) > 3;

-- 48. Display total salary paid per department.
SELECT department, SUM(salary) FROM employees GROUP BY department;

-- 49. Display departments with average salary greater than 60,000
SELECT department FROM employees GROUP BY department having avg(salary) > 60000;

-- 50. Count employees joined in each year.
SELECT YEAR(join_date), COUNT(*) FROM employees GROUP BY YEAR(join_date);

-- 51. Update salary of employee with emp_id = 101.
UPDATE employees SET salary = 60000 WHERE emp_id = 101;

-- 52. Increase salary by 10% for IT department
UPDATE employees set salary = salary * 1.10 where department = 'IT';
select * from employees;

-- 53. Update department to Admin where department is NULL
UPDAtE employees SET department = 'Admin' where department IS NULL;
SELECT * FROM employees;

-- 54. Update multiple columns in a single query.
UPDATE employees SET salary = 50000, department ='HR' WHERE emp_id = 107;

-- 55. Set salary to NULL for employees in HR.
UPDATE employees SET salary = NULL WHERE department = 'HR';

-- 56. Delete employee with emp_id = 110.
DELETE FROM employees WHERE emp_id =110;

-- 57. Delete employees with salary less than 20,000
DELETE FROM employees WHERE salary < 20000;

-- 58. Delete employees whose department is NULL.
DELETE FROM employees WHERE department IS NULL;

-- 59. Delete all employees (without dropping table)
DELETE FROM employees;

-- 60. Delete employees joined before 2020-01-01.
DELETE FROM employees WHERE join_date < '2020-01-01';

select * from employees;

-- SECTION 7: Constraints & Keys.
-- 61. Create table with PRIMARY KEY and NOT NULL.
CREATE TABLE test1(
id INT PRIMARY KEY,
name VARCHAR(50) NOT NULL
);

-- 62. Create table with UNIQUE email constraint.
CREATE TABLE test2(
email VARCHAR(100) UNIQUE
);

-- 63. Create table with DEFAULT salary.
CREATE TABLE test3(
salary INT DEFAULT 30000
);

-- 64. Create table with CHECK constraint on salary.
CREATE TABLE test4(
salary INT CHECK (salary > 0)
);

-- 65. Add FOREIGN KEY between employees and departments.
ALTER TABLE employees
ADD CONSTRAINT fk_dept
FOREIGN KEY( department) REFERENCES departments(dept_name);

-- 66. Insert data violating PRIMARY KEY.
INSERT INTO test1 values(1,'A');
INSERT INTO test1 values(1,'B');

-- 67. Insert data violating UNIQUE constraint.
INSERT INTO test2 values('a@gmail.com');
INSERT INTO test2 values('a@gmail.com');

-- 68. Insert data violating FOREIGN KEY.
INSERT INTO employees values(200, 'X', 'x@gmail.com', 40000, 'Unknown','2023-01-01');

-- 69. Drop a constraint from a table.
ALTER TABLE employees DROP FOREIGN KEY fk_dept;

-- 70. Disable foreign key checks temporarily.
SET FOREIGN_KEY_CHECKS = 0;

-- SECTION 8: JOINS
-- 71. Create departments table.
CREATE TABLE departments(
dept_id INT,
dept_name VARCHAR(50)
);

CREATE TABLE employees(
emp_id      INT,
emp_name    VARCHAR(50),
dept_id     INT,
manager_id  INT,
salary      INT
);

-- 72. Display employees with their department names using INNER JOIN.
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
INNER JOIN departments d 
ON e.dept_id = d.dept_id;

-- 73. Display all employees even if department is missing (LEFT JOIN).
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

-- 74. Display all departments even if no employees (RIGHT JOIN).
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

-- 75. Display matching records using NATURAL JOIN.
SELECT emp_id, emp_name, dept_name
FROM employees 
NATURAL JOIN departments;

-- 76. Display all combinations of employees and departments.
SELECT * FROM employees CROSS JOIN departments;

-- 77. Find employees working in IT.
SELECT * FROM employees WHERE department = 'IT';

-- 78. Count employees per department using JOIN.
SELECT d.dept_name, COUNT(*)
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- 79. Display employees whose department does not exist.
SELECT *
FROM employees e
LEFT JOIN departments d
ON e.department = d.dept_id
WHERE d.dept_name IS NULL;


-- 80. Join same table to find manager-employee relation.
SELECT e1.emp_name, e2.emp_name AS manager
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.emp_id;


-- SECTION 9: Subqueries
-- 81. Display employee with highest salary.
SELECT * FROM employees
WHERE salary = (select max(salary) from employees);

-- 82. Display employees earning more than average salary.
SELECT * FROM employees 
WHERE salary > (select avg(salary) from employees);

-- 83. Display employees from department having highest average salary.
SELECT * FROM employees 
WHERE dept_name = 
	(select dept_name from employees 
    GROUP BY dept_name ORDER BY avg(salary) desc limit 1);

-- 84. Display employees whose salary equals max salary.
SELECT * FROM employees 
where salary = (select max(salary) from employees);

-- 85. Display department with maximum employees.
SELECT dept_name FROM employees
GROUP BY dept_name ORDER BY COUNT(*) DESC LIMIT 1;

-- 86. Display employees not in IT department using subquery.
SELECT * FROM employees 
WHERE dept_name NOT IN (select dept_name from employees where dept_name ='IT');

-- 87. Display employees joined in latest year.
SELECT * FROM employees 
WHERE YEAR(join_date) = (select max(YEAR(join_date)) FROM employees);

-- 88. Display second highest salary.
select max(salary) FROM employees 
where salary < (select max(salary) from employees);

-- 89. Display employees earning more than department average.
select * from employees e
where salary > (select avg(salary) from employees where dept_name = e.dept_name);

-- 90. Delete employees earning below average salary.
DELETE FROM employees
where salary < (select avg(salary) from employees);