CREATE DATABASE Sql_test;

USE Sql_test;

CREATE TABLE students(
name VARCHAR(50),
age int,
grade CHAR(1)
);

INSERT INTO students(name,age,grade) values('Alice',12,'A');
INSERT INTO students(name,age,grade) values('Bob',16,'B');
INSERT INTO students(name,age,grade) values('Eve',18,'C');

select * from students;
-- select with where
select * from students where age > 15;

-- order by
select * from students order by name  desc;

-- IN and BETWEEN
select * from students where age between 13 and 18 AND  grade in ('A','B');