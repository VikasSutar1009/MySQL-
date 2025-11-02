CREATE DATABASE Python_stored_procedure;

use Python_stored_procedure;

create table Employee(
empid int primary key,
empname varchar(100),
department varchar(50),
salary decimal(10,2)
);

INSERT INTO employee (empid, empname, department, salary)VALUES
(1,'Amit Sharma', 'IT', 75000.00),
(2,'Priya Singh', 'HR',60000.00),
(3,'Rahul Verma','Finance', 82080.00),
(4,'Neha Gupta', 'Marketing', 55000.00),
(5,'Ravi Patel','IT',90000.00),
(6,'Simran Kaur','HR',65000.00),
(7,'Ankit Mehra','Sales', 58000.00),
(8,'Sneha Das','Finance', 72000.00),
(9,'Karan Joshi','IT',99000.00),
(10,'Pooja Nair','Marketing',61000.00);

select * from employee;

DELIMITER $$
CREATE PROCEDURE ShowAllEmoloyee()
BEGIN
	SELECT * FROM Employee;
END $$

DELIMITER ;

call ShowAllEmoloyee()

DELIMITER $$
CREATE PROCEDURE GetEmployeeByDept( IN p_DeptName varchar(50))
BEGIN 
	SELECT * FROM Employee where Department = p_DeptName;
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE GetEmployeeSalary(
IN p_empid int,
OUT p_Salary DECIMAL(10,2)
)
BEGIN
	SELECT Salary INTO p_Salary from Employee where empid = p_empid;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE AddEmployee(
	IN p_empid int,
	IN p_empname varchar(100),
	IN p_dept varchar(50),
	IN p_salary decimal(10,2)
)


BEGIN
	INSERT INTO Employees VALUES (p_empid, p_empname, p_dept, p_salary);
END $$

DELIMITER ;

drop procedure AddEmployee;

DELIMITER $$

CREATE PROCEDURE AddEmployee(
    IN p_EmpID INT,
    IN p_EmpName VARCHAR(100),
    IN p_Dept VARCHAR(50),
    IN p_Salary DECIMAL(10,2)
)
BEGIN
    INSERT INTO Employee (EmpID, EmpName, Department, Salary)
    VALUES (p_EmpID, p_EmpName, p_Dept, p_Salary);
END$$

DELIMITER ;
drop procedure AddEmployee;

call ShowAllEmoloyee()