CREATE DATABASE Office;

USE Office;

CREATE TABLE EmployeeAttendance(
employee_name VARCHAR(50),
department VARCHAR(50),
hours_worked int,
work_date DATE
);

INSERT INTO EmployeeAttendance (employee_name, department, hours_worked, work_date) VALUES('Alice', 'HR', 8, '2024-09-01');

INSERT INTO EmployeeAttendance (employee_name, department, hours_worked, work_date) VALUES('Bob', 'IT', 9, '2024-09-01');

INSERT INTO EmployeeAttendance (employee_name, department, hours_worked, work_date) VALUES('Charlie', 'Finance', 7, '2024-09-01');

INSERT INTO EmployeeAttendance (employee_name, department, hours_worked, work_date) VALUES('Alice', 'HR', 8, '2024-09-02');

INSERT INTO EmployeeAttendance (employee_name, department, hours_worked, work_date) VALUES('Bob', 'IT', 10, '2024-09-02');

INSERT INTO EmployeeAttendance (employee_name, department, hours_worked, work_date) VALUES('David', 'IT', 6, '2024-09-02');

INSERT INTO EmployeeAttendance (employee_name, department, hours_worked, work_date) VALUES('Charlie', 'Finance', 9, '2024-09-02');

INSERT INTO EmployeeAttendance (employee_name, department, hours_worked, work_date) VALUES('Eve', 'HR', 7, '2024-09-01');

INSERT INTO EmployeeAttendance (employee_name, department, hours_worked, work_date) VALUES('Eve', 'HR', 6, '2024-09-02');

SELECT * FROM EmployeeAttendance;

-- 1 Find the total number of attendance records.
select COUNT(*) AS total_records FROM EmployeeAttendance;

-- 2 Find the minimum and maximum hours worked by any employee on any day.
select MAX(hours_worked) AS max_hours_worked, MIN(hours_worked) AS min_hours_worked from EmployeeAttendance;

-- 3 What is the total number of hours worked by all employees?
select SUM(hours_worked) AS sum_hours_worked from EmployeeAttendance;

-- 4 Show the average hours worked per record.
select AVG(hours_worked) AS avg_hours_worked_per_record from EmployeeAttendance;

-- 5 Show total hours worked by each employee.
SELECT employee_name, sum(hours_worked) AS sum_hours_worked FROM employeeattendance GROUP BY employee_name;

-- 6 Show average daily hours per department.
SELECT department, AVG(hours_worked) AS avg_hours_worked FROM employeeattendance GROUP BY department;

-- 7 Count how many records each department has.
select department, count(*) AS total_rows from employeeattendance group by department;

-- 8 Show departments with total hours worked more than 15.
select department, sum(hours_worked) as sum_hours_worked from employeeattendance group by department having sum(hours_worked) > 15;

-- 9 Find the employee(s) who worked more than 8 hours in a day.
select employee_name, hours_worked, work_date from employeeattendance where hours_worked > 8;

-- 10 For each department, show the maximum hours worked in a single day.
select department, MAX(hours_worked) AS max_daily_hours FROM employeeattendance GROUP BY department;