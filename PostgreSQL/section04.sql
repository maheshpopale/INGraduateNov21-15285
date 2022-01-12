-- Where clause
SELECT * FROM suppliers 
WHERE city='Berlin';

select city 
from customers;
--Selecting companyname and contactname of contry Mexico
SELECT companyname,contactname 
FROM Customers
WHERE country='Mexico';

--searching numeric Field
SELECT employeeid
FROM Employees;

SELECT * FROM Employees 
WHERE employeeid=4;

SELECT * FROM Employees 
WHERE employeeid=5;

SELECt * FROM Employees
WHERE employeeid<=5;

--selecting orders where quantity>20
SELECT * FROM Order_details 
WHERE quantity>20;
--selecting freight>250
SELECT COUNT(*) FROM Orders 
WHERE freight>=250;

--Selecting Dates
SELECT COUNT(*) FROM Orders 
WHERE Orderdate>='1998-01-01';

-- Orders Shipped before July 5,1997
SELECT COUNT(*) FROM Orders
WHERE shippeddate<'1997-07-05';

--WHERE using AND
SELECT COUNT(*) FROM Orders 
WHERE shipcountry='Germany'
AND freight>100;

SELECT DISTINCT(Customerid) FROM Orders
WHERE shipcountry='Brazil'
AND shipvia=2;

--Logical OR
--Selecting Customers from USA AND Canada

SELECT COUNT(*) FROM Customers 
WHERE country='USA' 
OR country='Canada';
--Select how many suppliers do we have in Germany and spain

SELECT COUNT(*) FROM Suppliers 
WHERE country='Germany' 
OR country='Spain';

--Select how many orders shipped to USA,Brazil and Argentina
SELECT COUNT(*) FROM Orders
WHERE shipcountry='USA' 
OR Shipcountry='Brazil' 
OR shipcountry='Argentina';

--NOT Operator
--selecting customers who are not from France
SELECT COUNT(*) FROM customers
WHERE NOT country='France';

--selecting suppliers who are not from USA
SELECT COUNT(*) FROM Suppliers 
WHERE NOT country='USA';

--Combining AND,OR,NOT
--select order shipped to Germany and freight<50 or >175
SELECT COUNT(*) FROM Orders 
WHERE shipcountry='Germany' 
AND (freight<50 OR freight>175);

SELECT COUNT(*) FROM Orders
WHERE (shipcountry='Canada'OR shipcountry='Spain')
AND shippeddate>'1997-05-01';

/*Using BETWEEN */
--select records from orders where freight between 50 and 100
SELECT * FROM Orders
WHERE freight 
BETWEEN 50 AND 100;

--select how many orders shipped between June 1,1996 and Sept 30,1996
SELECT COUNT(*) FROM Orders 
WHERE shippeddate BETWEEN '1996-06-01' AND '1996-09-30';

/*using IN Oprator*/
SELECT COUNT(*) FROM Suppliers
WHERE country IN('USA','France','Germany');


--select no of products of categories 1,4,6,7
SELECT COUNT(*) FROM Products 
WHERE categoryid IN(1,4,6,7);