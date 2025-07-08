CREATE DATABASE BasicQuries4;

USE BasicQuries4;

CREATE TABLE students(
student_id int,
name VARCHAR(50),
city VARCHAR(50)
);

CREATE TABLE results(
student_id int,
subject VARCHAR(50),
marks int
);

INSERT INTO students(student_id,name,city) values(1,"Amit","delhi");
INSERT INTO students(student_id,name,city) values(2,"Sneha","Mumbai");
INSERT INTO students(student_id,name,city) values(3,"Ravi","Chennai");
INSERT INTO students(student_id,name,city) values(4,"Priya","Delhi");
INSERT INTO students(student_id,name,city) values(5,"Karan","Bangalore");

-- Results
INSERT INTO results(student_id,subject,marks) values(1,'Math',78);
INSERT INTO results(student_id,subject,marks) values(1,'Science',90);
INSERT INTO results(student_id,subject,marks) values(2,'Math',85);
INSERT INTO results(student_id,subject,marks) values(2,'Science',75);
INSERT INTO results(student_id,subject,marks) values(3,'Math',65);
INSERT INTO results(student_id,subject,marks) values(3,'Science',70);
INSERT INTO results(student_id,subject,marks) values(4,'Math',95);
INSERT INTO results(student_id,subject,marks) values(4,'Science',99);
INSERT INTO results(student_id,subject,marks) values(5,'Math',45);
INSERT INTO results(student_id,subject,marks) values(5,'Science',50);

select * from students;

select * from results;

-- 1 GROUP BY with HAVING(Get students whose average marks are more than 80.)
select student_id, AVG(marks) AS avg_marks from results GROUP BY student_id HAVING AVG(marks) > 80;

-- 2 EXISTS(List students who have marks in at least one subject.)
select name from students s where EXISTS(select 1 from results r where r.student_id = s.student_id);

-- 3 ANY(Find students who scored more than any of the marks scored by student ID 5.)
select * from results where marks > ANY (select marks from results where student_id = 5 );

-- 4 ALL(Find students who scored more than all of the marks scored by students ID 3.)
select * from results where marks > ALL ( select marks from results where student_id =3);
