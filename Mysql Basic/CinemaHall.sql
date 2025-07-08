CREATE DATABASE CinemaHall;

USE CinemaHall;

CREATE TABLE Movies(
movie_code int,
title VARCHAR(255),
director VARCHAR(255),
release_year YEAR,
rating DECIMAL(6,1)
);

INSERT INTO Movies(movie_code,title,director,release_year,rating) values(201,'Inception','Christopher Nolan',2010,8.8);
INSERT INTO Movies(movie_code,title,director,release_year,rating) values(202,'The Matrix','Lana Wachowski',1999,8.7);
INSERT INTO Movies(movie_code,title,director,release_year,rating) values(203,'Intersteller','Christopher Nolan',2014,8.6);
INSERT INTO Movies(movie_code,title,director,release_year,rating) values(204,'Parasite','Bong Joon-ho',2019,8.5);
INSERT INTO Movies(movie_code,title,director,release_year,rating) values(205,'Tenet','Christopher Nolan',2020,7.8);
INSERT INTO Movies(movie_code,title,director,release_year,rating) values(206,'Avatar','James Cameron',2009,7.9);

select * from Movies;

-- ORDER BY
select * from Movies ORDER BY rating desc;

select * from Movies ORDER BY release_year desc;

-- UPDATE 
UPDATE Movies SET rating= rating + 0.2 WHERE director = 'Christopher Nolan';

UPDATE Movies SET rating= 8.1 WHERE title= 'Tenet';

-- DELETE
DELETE FROM Movies Where release_year < 2010;

DELETE FROM Movies Where rating < 8;

-- LIMIT
select * from Movies ORDER BY rating DESC LIMIT 3;

SELECT * FROM Movies ORDER BY release_year DESC LIMIT 1,2;

