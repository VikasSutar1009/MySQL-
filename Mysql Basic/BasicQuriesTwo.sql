CREATE DATABASE BsicQuriesTwo;

USE BsicQuriesTwo;

CREATE TABLE books(
book_id int,
title VARCHAR(100),
author VARCHAR(100),
price DECIMAL(6,2),
quantity int
);

INSERT INTO books(book_id,title,author,price,quantity) Values (101,'The silent Sea','Clive Cussler',399.99,10);
INSERT INTO books(book_id,title,author,price,quantity) Values (102,'Digitle Fortrees','Dan Brown',299.50,5);
INSERT INTO books(book_id,title,author,price,quantity) Values (103,'Zero to One','Peter Thiel',250.00,8);
INSERT INTO books(book_id,title,author,price,quantity) Values (104,'The Alchemist','Paulo Coelho',199.00,15);
INSERT INTO books(book_id,title,author,price,quantity) Values (105,'Inferno','Dan Brown',349.99,3);

select * from books;

select * from books ORDER BY price ASC;

select * from books ORDER BY quantity DESC;

-- UPDATE the price of 'Digital Fortrees' to 320.00
UPDATE books SET price = 320.00 WHERE title ='Digitle Fortrees';

UPDATE books SET quantity= quantity + 2 WHERE title = 'Zero to One';

DELETE FROM books WHERE  author ='Dan Brown';

DELETE FROM books WHERE quantity < 5;

-- show top 3 cheapest books
select * from books ORDER BY price ASC LIMIT 2;

select * from books ORDER BY price DESC LIMIT 1,2;