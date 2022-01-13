--1.)
SELECT name,weight,productnumber
FROM production.product
ORDER BY weight ASC;

--2.)
SELECT * FROM Sales.salesorderdetail
WHERE productid=799
ORDER BY orderqty DESC;

--3.)
SELECT MAX(discountpct)
FROM sales.specialoffer;

--4.)
SELECT MIN(sickleavehours)
FROM humanresources.employee;

--5.)
SELECT MAX(rejectedqty)
FROM purchasing.purchaseorderdetail

--6.)
SELECT AVG(rate)
FROM humanresources.employeepayhistory;

--7.)
SELECT AVG(standardcost)
FROM production.productcosthistory;

--8.)
SELECT SUM(scrappedqty)
FROM production.workorder;

--9.)
SELECT name 
FROM purchasing.vendor
WHERE name LIKE 'G%';

--10.)
SELECT name 
FROM purchasing.vendor
WHERE name LIKE '%Bike%';

--11.)
SELECT firstname
FROM person.person
WHERE firstname LIKE '_t%';

--12.)
SELECT * 
FROM person.emailaddress
LIMIT 20;

--13.)
SELECT * 
FROM production.productcategory
LIMIT 2;

--14.)
SELECT COUNT(*)
FROM production.product
WHERE weight IS NULL;

--15.)
SELECT COUNT(*)
FROM person.person
WHERE additionalcontactinfo IS NOT NULL;





