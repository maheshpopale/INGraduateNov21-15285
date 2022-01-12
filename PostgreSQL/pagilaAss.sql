--Select All from Actor Table

SELECT * FROM Actor;

--Select All From Film Table
SELECT * FROM Film;

--Select All From Staff Table
SELECT * FROM Staff;

-- Selet Address and District Column from Address Table
SELECT address,District FROM Address;

--select title and description from film table
SELECT title,description FROM film;

--select city and country_id from city table
SELECT city,country_id FROM city;

--select distinct lastname from customer table
SELECT DISTINCT(last_name) FROM Customer;

--select distinct first_name from actor table
SELECT DISTINCT(first_name) FROM actor;

--Select all distinct invertory_id from rental table
SELECT DISTINCT(inventory_id) from rental;

--Find No of films
SELECT COUNT(*) from Film;
--Find No of categories
SELECT COUNT(category_id) FROM category;
--Find No of Distinct first_names from Actor Table
SELECT COUNT(DISTINCT first_name) FROM Actor;
--Select rental-id and difference between return-date-rental-date
SELECT rental_id,return_date-rental_date from rental;