CREATE DATABASE SQL_TEST1;

USE SQL_TEST1;

CREATE TABLE student(
name VARCHAR(50),
age int,
grade CHAR(1)
);

INSERT INTO student(name, age, grade) VALUES('pranav dhuri', 18, 'A');

INSERT INTO student(name, age, grade) VALUES('Raju Narve', 22, 'C');

INSERT INTO student(name, age, grade) VALUES('Sushant Kapse', 43, 'A');

SELECT * FROM student;

SELECT * FROM student Where age > 15;

SELECT * FROM student order by name DESC;

SELECT * FROM student Where age between 13 AND 18 AND grade IN ('A,B');