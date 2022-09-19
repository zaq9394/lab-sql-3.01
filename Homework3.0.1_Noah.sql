use sakila;
-- A1.Drop column picture from staff.
ALTER TABLE staff DROP COLUMN picture;

-- A2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
INSERT INTO staff
VALUES
(3,'TAMMY','SANDERS',79,'TAMMY.SANDERS@sakilacustomer.org',2,1,'TAMMY',NULL,'2006-02-15 04:57:20');

-- SELECT * from customer
-- where first_name='TAMMY';
SELECT * from rental;
-- A3.Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1
INSERT INTO rental
VALUES
(16050,'2022-09-19 17:32:10',1,130,null,1,'2022-09-20 21:30:53');

-- select customer_id from sakila.customer
-- where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

-- select * from sakila.inventory
-- where film_id=1;

-- select film_id from sakila.film
-- where title='Academy Dinosaur';
SELECT * from rental;

