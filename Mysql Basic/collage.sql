CREATE DATABASE College;
USE Collage;
CREATE TABLE Students (
id int,
Name VARCHAR(255),
Roll_No int,
Department VARCHAR(225),
Marks int
);

select * from students;

INSERT INTO Students(id,Name,Roll_No,Department,Marks) Values (1,'Vikas_Sutar',101,'BCA',505);
INSERT INTO Students(id,Name,Roll_No,Department,Marks) Values (2,'sushant_gurav',102,'BCA',534);
INSERT INTO Students(id,Name,Roll_No,Department,Marks) Values (3,'Pankaj_Jadhav',103,'BCA',507);
INSERT INTO Students(id,Name,Roll_No,Department,Marks) Values (4,'Sahil_Patil',104,'BCA',508);
INSERT INTO Students(id,Name,Roll_No,Department,Marks) Values (5,'Kartik_Desai',105,'BCA',510);

select * from Students;
