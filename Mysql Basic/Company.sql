CREATE DATABASE Company;
USE Company;
Create table Emp(
id int,
Name VARCHAR(255),
Salary int,
Department VARCHAR(255),
Post VARCHAR(255)
);

INSERT INTO Emp(id,Name,Salary,Department,Post) Values (1,"Vikas Sutar",29000,"IT","Manager");
INSERT INTO Emp(id,Name,Salary,Department,Post) Values (2,"Sushant Gurav",30000,"Sales","Clerk");
INSERT INTO Emp(id,Name,Salary,Department,Post) values (3,"Pankaj Jadhav",28000,"Store","Keeper");
INSERT INTO Emp(id,Name,Salary,Department,Post) Values (4,"Omkar Kumbhar",31000,"Production","Team leader");
INSERT INTO Emp(id,Name,Salary,Department,Post) Values (5,"Pratik Bolke",27000,"Testing","QA");

select * from Emp;

-- Salary more than 30000;
select * from Emp where Salary > 30000;

select * from Emp where Post ="Manager";

select * from Emp where Salary between 10000 AND 30000;

select * from Emp where Post between "Team leader" AND "QA";

select * from Emp where Post between "Manager" AND "QA";