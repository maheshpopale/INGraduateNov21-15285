/*Insert Into orders*/

INSERT INTO orders(orderid,customerid,employeeid,orderdate,requireddate,shippeddate,shipvia,freight,shipname,shipaddress,shipcity,shippostalcode,shipcountry)
VALUES( 11078,'VINET',4,'2017-09-16','2017-09-30','2017-09-25',3,42.5,'vinns at elcools chevalier','hdlkfhdh','Columbo','5100','France');

/*Insert into order_details*/
INSERT INTO order_details
(orderid, productid, unitprice,quantity,discount)
VALUES (11078,11,14,20,0);


/*Update Table*/
UPDATE orders
SET requireddate='2017-09-20',freight=50
WHERE orderid=11078;

/*Update order_details*/
UPDATE order_details
SET quantity=40,discount=.05
WHERE orderid=11078 AND productid=11;


/*Delete Table*/
DELETE FROM order_details
WHERE orderid=11078 AND productid=11;

DELETE FROM orders
WHERE orderid=11078;

/*SELECT INTO*/
SELECT * INTO suppliers_northAmerica
FROM suppliers
WHERE country IN('Canada','USA');

SELECT * INTO orders_1997
FROM orders
WHERE orderdate BETWEEN '1997-01-01' AND '1997-12-31';

/*INSERT INTO SELECT*/

INSERT INTO suppliers_northAmerica
SELECT * FROM suppliers
WHERE country IN('Brazil','Argentina');

INSERT INTO orders_1997
SELECT * FROM orders
WHERE orderdate BETWEEN '2016-12-01' AND '2016-12-31';

/*Returning */
INSERT INTO employees
(firstname,lastname,address,city,country,postalcode,homephone,title,employeeid,reportsto)
VALUES
('Bob','Smith','463-4613 Ipsum Street','New Orleans','USA','73-638','741-0423','Chief Strategy',50,NULL)
RETURNING employeeid;

INSERT INTO orders (customerid,employeeid,requireddate,shippeddate,orderid)
VALUES ('VINET',5,'1996-08-01','1996-08-10',500) RETURNING orderid;


UPDATE products
SET unitprice = unitprice * 1.2
WHERE productid=1
RETURNING productid,unitprice AS new_price;

UPDATE order_details
SET quantity = quantity * 2
WHERE orderid=10248 AND productid=11
RETURNING quantity AS new_quantity;

DELETE FROM employees
WHERE employeeid=50
RETURNING *;

DELETE FROM orders
WHERE orderid=500
RETURNING *;