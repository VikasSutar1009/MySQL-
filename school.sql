CREATE DATABASE school;

USE school;

CREATE TABLE students(
id int,
name VARCHAR(50),
department VARCHAR(50),
marks int
);

INSERT INTO students(id,name,department,marks) values(1,'john','BCA',65);
INSERT INTO students(id,name,department,marks) values(2,'bob','bcom',64);
INSERT INTO students(id,name,department,marks) values(3,'charlie','bsc',70);
INSERT INTO students(id,name,department,marks) values(4,'jenney','ba',58);
INSERT INTO students(id,name,department,marks) values(5,'sam','ma',76);

select * from students;

select * from students where marks >60;

select * from students where department = 'bca';

select * from students ORDER BY marks asc;

select * from students ORDER BY marks desc;

select name, MIN(marks) as min_marks ,MAX(marks) as max_marks from students GROUP BY name;

UPDATE students set department='bca' where department='ma';

DELETE from students where marks <60;

select MIN(marks) as min_marks from students;

select MAX(marks) as maz_marks from students;

select AVG(marks) as avg_marks from students;

select COUNT(*) AS total_rows from students;

select SUM(marks) as sum_marks from students;

select department, MIN(marks) as min_marks from students GROUP BY department HAVING MIN(marks) > 50;

select name, avg(marks) as avg_marks from students GROUP BY name HAVING avg(marks);