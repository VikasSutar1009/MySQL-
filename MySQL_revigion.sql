CREATE DATABASE MySQL_revigion;

USE MySQL_revigion;

CREATE TABLE students(
id INT,
name VARCHAR(50)
);

CREATE TABLE classes(
id INT,
class VARCHAR(20)
);

INSERT INTO students values
(1, 'Gaurav'),
(2, 'Raju'),
(3, 'Sam');

INSERT INTO classes values
(1, '10th'),
(3, '12th'),
(4, '9th');

select * from students;

select * from classes;

-- INNER JOIN (only matching ids)
select students.id, name, class
from students
inner join classes
on students.id = classes.id;

-- Left join
select students.id, name, class
from students
left join classes
on students.id = classes.id;

-- Right join
select students.id, name, class
from students 
right join classes
on students.id = classes.id;

-- Full join
select students.id, name, class
from students
left join classes
on students.id = classes.id
union
select students.id, name, class
from students 
right join classes
on students.id = classes.id;