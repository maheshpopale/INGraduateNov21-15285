/*GROUP BY*/
SELECT COUNT(*),country
FROM customers 
GROUP BY country
ORDER BY country;

/*No of products for each Category*/

SELECT COUNT(*),categoryname
FROM categories
JOIN products
ON products.categoryid=categories.categoryid
GROUP BY categoryname
ORDER BY COUNT(*) DESC;

SELECT productname,ROUND(AVG(quantity))
FROM products
JOIN order_details
ON products.productid=order_details.productid
GROUP BY productname
ORDER BY AVG(quantity) DESC;

/*How Many Suppliers in each country*/
SELECT country,COUNT(*)
FROM suppliers 
GROUP BY country
ORDER BY country ASC;

/*HAVING CLAUSE*/
SELECT productname,SUM(quantity*order_details.unitprice) AS AmountBought
FROM products
JOIN order_details
ON order_details.productid=products.productid
GROUP BY productname
HAVING SUM(quantity*order_details.unitprice)<2000
ORDER BY AmountBought ASC;

/* Find customers that have
bought more than 5000 of products*/

SELECT companyname,SUM(quantity*order_details.unitprice) AS TotalBought
FROM customers
NATURAL JOIN orders
NATURAL JOIN order_details
GROUP BY companyname
HAVING SUM(quantity*order_details.unitprice)>5000
ORDER BY TotalBought ASC;

/*Limiting By WHERE Clause*/
SELECT companyname,SUM(quantity*order_details.unitprice) AS TotalBought
FROM customers
NATURAL JOIN orders
NATURAL JOIN order_details
WHERE orderdate BETWEEN '1997-01-01' AND '1997-06-30'
GROUP BY companyname
HAVING SUM(quantity*order_details.unitprice)>5000
ORDER BY TotalBought ASC;


/*Grouping sets*/
 SELECT categoryname,productname,SUM(od.unitprice*quantity)
 FROM categories
 NATURAL JOIN products
 NATURAL JOIN order_details AS od
 GROUP BY GROUPING SETS((categoryname),(productname))
 ORDER BY categoryname,productname;
 
 SELECT  c.companyname As buyer,s.companyname AS supplier,SUM(od.unitprice*quantity)
 FROM customers AS c
 NATURAL JOIN orders
 NATURAL JOIN order_details AS od
 JOIN products USING(productid)
 JOIN suppliers AS s USING(supplierid)
 GROUP BY GROUPING SETS((buyer),(buyer,supplier))
 ORDER BY buyer,supplier;
 
 SELECT companyname,categoryname,SUM(od.unitprice*quantity)
 FROM customers AS c
 NATURAL JOIN orders
 NATURAL JOIN order_details AS od
 JOIN products USING(productid)
 JOIN categories AS s USING(categoryid)
 GROUP BY GROUPING SETS ((companyname),(companyname,categoryname))
 ORDER BY companyname,categoryname NULLS FIRST;
 
 
 
 