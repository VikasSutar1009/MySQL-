CREATE DATABASE company_db;
USE company_db;

CREATE TABLE employees (
EmpID INT PRIMARY KEY,
EmpName VARCHAR(100),
Department VARCHAR(50),
Salary DECIMAL(10,2)
);

CREATE DATABASE school_db;
USE school_db;

CREATE TABLE students (
StudentID INT PRIMARY KEY,
StudentName VARCHAR(100),
Course VARCHAR(50),
Marks INT
);

DELIMITER $$
CREATE PROCEDURE ShowAllStudents()
BEGIN 
SELECT * FROM students;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE AddStudent(IN p_ID INT, IN p_Name VARCHAR(100), IN p_Course VARCHAR(50), IN p_Marks INT)
BEGIN
INSERT INTO students VALUES (p_ID, p_Name, p_Course, p_Marks);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE GetStudentById(IN p_ID INT)
BEGIN 
SELECT * FROM students WHERE StudentID = p_ID;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE UpdateStudent(IN p_ID INT, IN p_Name VARCHAR(100), IN p_Course VARCHAR(50), IN p_Marks INT)
BEGIN
UPDATE students SET StudentName = p_Name, Course = p_Course, Marks = p_Marks WHERE StudentID = p_ID;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE DeleteStudent(IN p_ID INT)
BEGIN
DELETE FROM students WHERE StudentID = p_ID;
END$$
DELIMITER ;

CREATE DATABASE store_db;
USE store_db;

CREATE TABLE products (
ProductID INT PRIMARY KEY,
ProductName VARCHAR(100),
Category VARCHAR(50),
Price DECIMAL(10,2)
);

SHOW TABLE

--  Stored Procedure of Company DB
-- SHOW ALL
DELIMITER $$
CREATE PROCEDURE ShowAllEmployees()
BEGIN
SELECT * FROM employees;
END$$
DELIMITER ;

-- ADD

DELIMITER $$

CREATE PROCEDURE AddEmployees(
	IN p_EmpID INT,
	IN p_EmpName VARCHAR(100),
	IN p_Dept VARCHAR(50),
	IN p_Salary DECIMAL(10,2)
)


BEGIN
	INSERT INTO employees (EmpID, EmpName, Department, Salary)
	VALUES (p_EmpID, p_EmpName, p_Dept, p_Salary);
END$$

DELIMITER ;

CALL AddEmployees();

drop PROCEDURE AddEmployees;
-- GET BY ID
DELIMITER $$
CREATE PROCEDURE GetEmployeesById(IN p_EmpID INT) 
BEGIN
SELECT * FROM employees WHERE EmpID = p_EmpID;
END$$
DELIMITER ;

-- UPDATE 
DELIMITER $$
CREATE PROCEDURE UpdateEmployee(IN p_EmpID INT, IN p_EmpName VARCHAR(100), IN p_Dept VARCHAR(50), IN p_Salary DECIMAL(10,2))
 BEGIN 
 UPDATE employees SET EmpName = p_EmpName, Department = p_Dept, Salary = p_Salary WHERE EmpID = p_EmpID;
 END$$
 DELIMITER ;
 
 -- DELETE 
 DELIMITER $$
 CREATE PROCEDURE DeleteEmployees(IN p_EmpID INT)
 BEGIN 
 DELETE FROM employees WHERE EmpID = p_EmpID;
 END$
 DELIMITER ;
 
 SELECT DATABASE();
 
 SHOW PROCEDURE STATUS WHERE db="company_db";
 
 USE company_db;

DELIMITER //
CREATE PROCEDURE ShowAllEmployees()
BEGIN
    SELECT * FROM Employees;
END //
DELIMITER ;

SHOW TABLES;

call AddEmployees();

SHOW PROCEDURE STATUS WHERE Db = 'company_db';

SHOW PROCEDURE STATUS WHERE Db = 'Company_db' AND Name = 'AddEmployee';

DROP PROCEDURE IF EXISTS AddEmployee;