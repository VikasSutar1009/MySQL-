CREATE DATABASE store_procedure;

USE store_procedure;

CREATE TABLE employees(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary INT
);

-- Create stored procedure to insert data
DELIMITER $$

CREATE PROCEDURE AddEmployee(
IN emp_name VARCHAR(100),
IN emp_dept VARCHAR(50),
IN emp_salary INT
)
BEGIN 
INSERT INTO employees(name, department, salary)
VALUES(emp_name, emp_dept, emp_salary);
END $$

DELIMITER $$

CALL AddEmployee('Gaurav', 'IT', 50000);
CALL AddEmployee('Rahul', 'HR', 35000);
CALL AddEmployee('Sneha', 'Finance', 45000);

SELECT * FROM employees;


DELIMITER $$

CREATE PROCEDURE CreateAndInsert()
BEGIN
	CREATE TABLE IF NOT EXISTS students(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO students(name) VALUES('Amit');
END $$

DELIMITER $$

CALL CreateAndInsert();

