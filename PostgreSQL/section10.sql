/*UNION*/
SELECT companyname 
FROM customers
UNION
SELECT companyname 
FROM suppliers;

SELECT city
FROM customers
UNION
SELECT city
FROM suppliers;

/*UNION ALL */
SELECT city
FROM customers
UNION ALL
SELECT city
FROM suppliers;

--Find Distinct countries of 
--customers and suppliers in alphabetical
--order
SELECT country
FROM customers
UNION
SELECT country
FROM suppliers
ORDER BY country ASC;

/*List of countries of suppliers 
and customers with a record for 
each one*/
SELECT country
FROM customers
UNION ALL
SELECT country
FROM suppliers
ORDER BY country ASC;

/*Intersect*/
SELECT country 
FROM customers
INTERSECT
SELECT country 
FROM suppliers;
 
SELECT  country
FROM customers
INTERSECT ALL
SELECT country
FROM suppliers;
 
 /*Get Distinct cities that we have a supplier and customer*/
 SELECT city
 FROM Customers
 INTERSECT
 SELECT city
 FROM Suppliers
 
 /* Count the no of customers and suppliers from the same city*/
 SELECT COUNT(*)
 FROM (SELECT city FROM customers INTERSECT
	  SELECT city FROM suppliers) AS Same_City;
	  
/*Except*/
SELECT country 
FROM customers
EXCEPT
SELECT country
FROM suppliers;

SELECT COUNT(*)
FROM(SELECT country 
FROM customers
EXCEPT ALL
SELECT country
FROM suppliers) AS lonely_customers;

--cities we have a supplier with no cusotmer
SELECT city
FROM suppliers
EXCEPT
SELECT city 
FROM customers;

/*How many customers 
we have in cities without suppliers*/
SELECT COUNT(*)
FROM
(SELECT city
FROM customers
EXCEPT ALL
SELECT city 
FROM suppliers) AS lonely_customers;