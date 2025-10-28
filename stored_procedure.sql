create database stored_procedure;

use stored_procedure;

create table employee(
impid int primary key,
empname varchar(100),
department varchar(50),
salary decimal(10,2)
);

select * from employee;   -- without sp
-- with sp
delimiter $$

create procedure showallemployee()
begin
	 select * from employee;
end$$

delimiter ;

call showallemployee();

INSERT INTO employee (impid, empname, department, salary)VALUES
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

delimiter $$
create procedure salary()
begin 
	select * from employee where salary between 75000 and  100000;
end $$
 
delimiter ;

call salary();


-- Procedure with input parameter

--  Let's say you want employees from  a specific department:

DELIMITER $$

CREATE PROCEDURE Getemployeebydept(IN DeptName varchar(50))
BEGIN 
	SELECT* FROM employee
    where department = DeptName;
END $$

DELIMITER ;

CALL Getemployeebydept('IT');

-- Procedure with  Multiple parameters

DELIMITER $$

CREATE PROCEDURE GetemployeebynameAndDept(
	IN p_empname varchar(100),
    IN p_Deptname varchar(50)
)
BEGIN
	SELECT * FROM employee
    where empname = p_empname and department = p_Deptname;
END $$

DELIMITER ;

CALL GetemployeebynameAndDept('Amit Sharma', 'IT');


-- Procedure with output parameter

DELIMITER $$

CREATE PROCEDURE GetemployeeSalary(
	IN  p_impid int,
    out p_Salary DECIMAL(10,2)
)
BEGIN
	SELECT Salary into p_salary
    from employee
    where impid = p_impid ;
END $$

DELIMITER ;

SET @sal = 0;
CALL GetemployeeSalary(3, @sal);
select @sal as employeeSalary;


-- Update
DELIMITER $$

CREATE PROCEDURE Updateemployeesalary(
	IN p_impid int,
    IN p_newsalary decimal(10,2)
)
BEGIN
	UPDATE employee
    SET salary = p_newsalary
    where impid = p_impid;
END$$

DELIMITER ;

CALL Updateemployeesalary(5, 95000.00);

select * from employee where impid = 5;

-- Procedure to delete data

DELIMITER $$

CREATE PROCEDURE Deleteemployee(
	IN p_impid int
)
BEGIN 
	DELETE FROM employee
    where impid = p_impid;
END$$

DELIMITER ;

CALL Deleteemployee(10);

SELECT * FROM employee where impid = 10;