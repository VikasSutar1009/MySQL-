create database flask_api_demo;

use flask_api_demo;

create table users(
id int,
name varchar(100),
email varchar(100)
);

insert into users (name, email) values
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com');

select * from users;