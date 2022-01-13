--INNER JOIN
SELECT companyname,orderdate,shipcountry
FROM orders
JOIN customers ON customers.customerid=orders.customerid;

SELECT firstname,lastname,orderdate
FROM orders
JOIN employees ON employees.employeeid=orders.employeeid;

SELECT companyname,unitprice,unitsinstock
FROM suppliers
JOIN products ON products.supplierid=suppliers.supplierid;

--Grabbing from multiple tables
SELECT companyname,productname,orderdate,order_details.unitprice,quantity
FROM customers
JOIN Orders ON customers.customerid=orders.customerid
JOIN Order_details ON orders.orderid=order_details.orderid;

--connecting products table
SELECT companyname,productname,orderdate,order_details.unitprice,quantity
FROM customers
JOIN Orders ON customers.customerid=orders.customerid
JOIN Order_details ON orders.orderid=order_details.orderid
JOIN Products ON order_details.productid=products.productid;

--connecting category table
SELECT companyname,productname,categoryname,orderdate,order_details.unitprice,quantity
FROM customers
JOIN Orders ON customers.customerid=orders.customerid
JOIN Order_details ON orders.orderid=order_details.orderid
JOIN Products ON order_details.productid=products.productid
JOIN Categories ON categories.categoryid=products.categoryid;

--Adding WHERE Clause
SELECT companyname,productname,categoryname,orderdate,order_details.unitprice,quantity
FROM customers
JOIN Orders ON customers.customerid=orders.customerid
JOIN Order_details ON orders.orderid=order_details.orderid
JOIN Products ON order_details.productid=products.productid
JOIN Categories ON categories.categoryid=products.categoryid
WHERE categoryname='Seafood' AND order_details.unitprice*quantity>=500;


/*LEFT JOIN*/
SELECT companyname,orderid
FROM customers
LEFT JOIN Orders
ON orders.customerid=customers.customerid;

SELECT productname,orderid
FROM products
LEFT JOIN order_details
ON products.productid=order_details.productid;

/*Right JOIN*/
SELECT companyname,orderid
FROM orders
RIGHT JOIN customers
ON customers.customerid=orders.customerid;

/*FULL JOINS*/
SELECT companyname,orderid
FROM orders
FULL JOIN customers
ON customers.customerid=orders.customerid;


--FULL JOIN Products and categories
SELECT productname,categories.categoryid
FROM products
FULL JOIN categories
ON products.categoryid=categories.categoryid;





