CREATE DATABASE Pitchers;

USE Pitchers;

CREATE TABLE pitchers (
movie_code int,
title VARCHAR(255),
director VARCHAR(255),
release_year YEAR,
rating DECIMAL(6,1)
);

INSERT INTO Movie (Movie_code, title, director, release_year, rating) VALUES(101, 'Inception', 'Christopher Novel', 2010, 8.8);

INSERT INTO Movie (Movie_code, title, director, release_year, rating) VALUES(102, 'The Matrix', 'Lana Wachowski', 1999, 8.7);

INSERT INTO Movie (Movie_code, title, director, release_year, rating) VALUES(103, 'Intersteller', 'Christopher Nolan', 2014, 8.6);

INSERT INTO Movie (Movie_code, title, director, release_year, rating) VALUES(104, 'Parasite', 'Bong joon-ho', 2019, 8.5);

INSERT INTO Movie (Movie_code, title, director, release_year, rating) VALUES(105, 'tenet', 'Christopher Nolan', 2020, 7.8);

INSERT INTO Movie (Movie_code, title, director, release_year, rating) VALUES(106, 'Avtar', 'James Cameron', 2009, 7.9);

Select * From Movie;

-- ORDER BY
Select * from Movie ORDER BY rating desc;

Select * From Movie ORDER BY release_year desc;

-- UPDATE BY
Update movie set rating = rating + 0.2 Where director = 'christopher nolan';

Update movie set rating = 8.1 Where title = 'tenet';

-- DELETE BY
Delete From movie Where release_Year < 2010;

Delete From Movie Where rating < 8;

-- LIMITS
Select * From Movie ORDER BY rating DESC LIMIT 3;

Select * From Movie ORDER BY release_year DESC LIMIT 2,3;
