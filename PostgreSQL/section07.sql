--Order By Clause
SELECT DISTINCT country
FROM suppliers
ORDER BY country ASC;

--get productname and unit prices order by price 
--highest to lowest
--productnames a to z;
SELECT * FROM products;
SELECT productname,unitprice FROM products
ORDER BY unitprice DESC,productname ASC;

/* MIN AND MAX*/
SELECT MIN(orderdate)
FROM orders
WHERE shipcountry='Italy';

--last order placed to canada
SELECT MAX(orderdate)
FROM orders
WHERE shipcountry='Canada';

slowest order placed to france
SELECT MAX(shippeddate-orderdate)
FROM orders
WHERE shipcountry='France';

--AVG AND SUM
--AVG freight order to Brazil
SELECT AVG(freight)
FROM orders
WHERE shipcountry='Brazil';
select * from order_details where orderid=5;
--find how many individual items ordered of product id=14
SELECT SUM(quantity) 
FROM order_details
WHERE productid=14;

--Avg quantity of product id=35
SELECT AVG(quantity)
FROM order_details
WHERE productid=35;

--like Operator
--Select the customer whose name starts with D?
SELECT companyname,contactname FROM customers
WHERE contactname LIKE 'D%';

--select the suppliers whoose compnay name have "or"
--on second and third position
SELECT companyname,contactname 
FROM suppliers
WHERE companyname LIKE '_or%';

--Find the customer whose companyname ends with 'er'
SELECT contactname,companyname
FROM suppliers
WHERE companyname LIKE '%er';

--AS alice
--Select unitprice*quantity as TotalSpent
--from order_details
SELECT unitprice*quantity AS TotalPrice
FROM order_details
ORDER BY TotalPrice desc;


--Select unitprice and unitsinstock as TotalInventory
SELECT unitprice*unitsinstock
 AS TotalInventory
 FROM products 
 ORDER BY TotalInventory DESC;
 
 --LIMIT Clause
 SELECT productid,unitprice*quantity As TotalCost
 FROM order_details
 ORDER BY TotalCost DESC
 LIMIT 3;
 
 SELECT productname,unitprice*unitsinstock AS TotalInventory
 FROM products
 ORDER BY TotalInventory DESC
 LIMIT 2;
 
 /*NULL VALUE*/
 SELECT COUNT(*) FROM customers
 WHERE region IS NULL; --NULL
 
 SELECT COUNT(*) 
 FROM suppliers
 WHERE region IS NOT NULL;
 
 SELECT COUNT(*)
 FROM orders
 WHERE shipregion IS NULL;