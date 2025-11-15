CREATE DATABASE stored_procedure_flask;

USE stored_procedure_flask;

CREATE TABLE Employees(
EmpID INT PRIMARY KEY,
EmpName varchar(100),
Department varchar(50),
Salary decimal(10,2)
);

DELIMITER $$

CREATE PROCEDURE ShowAllEmployees()
BEGIN
	SELECT * FROM Employees;
END$$

DELIMITER ;

CALL ShowAllEmployees();
