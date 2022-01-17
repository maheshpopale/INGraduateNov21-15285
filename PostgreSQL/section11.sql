/*Subquery with EXISTS*/
--Find the customer having 
--orders in April 1997
SELECT companyname
FROM customers
WHERE EXISTS(SELECT customerid FROM orders 
WHERE orders.customerid=customers.customerid AND
orderdate BETWEEN '1997-04-01' AND '1997-04-30');

--Find Customer NOT having orders in April 1997
SELECT companyname
FROM customers
WHERE NOT EXISTS(SELECT customerid FROM orders 
WHERE orders.customerid=customers.customerid AND
orderdate BETWEEN '1997-04-01' AND '1997-04-30');

/*Product of not having order in April 1997*/

SELECT productname
FROM products
WHERE NOT EXISTS(SELECT productid FROM order_details
			 JOIN orders ON order_details.orderid=orders.orderid
WHERE order_details.productid=products.productid
AND orderdate BETWEEN '1997-04-01' AND '1997-04-30');

/*Find out suppliers with product having costs more than 200*/

SELECT companyname
FROM suppliers
WHERE EXISTS(SELECT productid FROM products
WHERE products.supplierid=suppliers.supplierid
AND unitprice>200);

/*Find suppliers who are not
having orders in December 1996 */
SELECT companyname
FROM suppliers
WHERE NOT EXISTS(SELECT products.productid FROM products
JOIN order_details ON products.productid=order_details.productid
JOIN orders ON orders.orderid=order_details.orderid
WHERE products.supplierid=suppliers.supplierid
AND orderdate BETWEEN '1996-12-01' AND '1996-12-31');;

/*SubQuery Using ANY and ALL*/
SELECT companyname
FROM customers
WHERE customerid=ANY(SELECT customerid FROM orders
JOIN order_details ON orders.orderid=order_details.orderid
WHERE quantity>50);

--Find suppliers that have had an order
--with 1 item
SELECT companyname
FROM suppliers
WHERE supplierid=ANY(SELECT supplierid FROM order_details
JOIN products ON products.productid=order_details.productid
WHERE quantity=1);


SELECT DISTINCT productname 
FROM products
JOIN order_details ON products.productid=order_details.productid
WHERE order_details.unitprice*quantity >ALL
(SELECT AVG(order_details.unitprice*quantity)
FROM order_details
GROUP By productid);

SELECT companyname
FROM customers
JOIN orders ON orders.customerid=customers.customerid
JOIN order_details ON orders.orderid=order_details.orderid
WHERE order_details.unitprice*quantity > ALL
(SELECT AVG(order_details.unitprice*quantity)
FROM order_details JOIN orders
ON order_details.orderid=orders.orderid
GROUP BY orders.customerid);

/*IN with Subquery*/
--find all customers that are 
--in the same country as suppliers
SELECT companyname
FROM customers
WHERE country IN(SELECT country FROM suppliers);

--find all suppliers that are 
--in the same city as customers

SELECT companyname
FROM suppliers
WHERE city IN(SELECT city FROM customers);