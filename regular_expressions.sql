create database regular_expressions;

use regular_expressions;

CREATE TABLE Employees (
  id INT,
  name VARCHAR(50),
  department VARCHAR(50)
);

INSERT INTO Employees VALUES
(1, 'Alice', 'Sales'),
(2, 'Bob', 'HR'),
(3, 'Charlie', 'Finance'),
(4, 'David', 'Sales'),
(5, 'Eve', 'Support'),
(6, 'Annie', 'Admin'),
(7, 'Amit', 'Finance');

select * from Employees;

select id 
from Employees 
where id regexp 'pattern' ;

-- Match beginning of a string -^
select * from Employees where name regexp'^A';

-- Match end of a string -$
select * FROM Employees where name regexp 'e$';

-- Match any one character - .
select * from Employees where name regexp'^A.e';

-- Match multiple possible characters - []
select * from Employees where name regexp '^[CD]';

-- Match character ranges
select * from Employees where name regexp '^[A-M]';

-- Match one of multiple strings - |
select * from Employees where department regexp'Sales|Support';

-- Match repeating patterns - +, *, {n}
-- Match words anywhere in text
select * from Employees where department regexp'[[:<:]]Sales[[:>:]]';
-- Match words anywhere in text
SELECT * FROM Employees
WHERE department REGEXP '[<:]Sales[:>]';

-- Case-insensitive (default)

-- MySQL regex is case-insensitive by default.
-- If you need case-sensitive, use:
select * from Employees where binary name regexp '^A';

-- create student table
CREATE TABLE Students (
  id INT,
  name VARCHAR(50)
);

INSERT INTO Students VALUES
(1, 'Amit'),
(2, 'Esha'),
(3, 'Ira'),
(4, 'Omkar'),
(5, 'Uday'),
(6, 'Kiran'),
(7, 'Rahul'),
(8, 'Anil'),
(9, 'Oliver'),
(10, 'Sneha');

select * from Students;

-- Names starting with a vowel
select * from Students where name regexp '^[AEIOUaeiou]';


-- Names ending with a vowel
select * from Students where name regexp '[AEIOUaeiou]$';

-- Names containning vowels anywhere
select * from Students where name regexp '[AEIOUaeiou]';


-- Names with two consecutive vowels
select * from Students where name regexp '^[AEIOUaeiou]{2}';

-- Names not starting with a vowel
select * from Students where name not regexp '^[AEIOUaeiou]';

-- Names where second letter is a vowel
select * from Students where name regexp '^.[AEIOUaeiou]';

-- Names having vowel + n pattern (like An, In, On, etc.)
select * from Students where name regexp '[AEIOUaeiou]n';