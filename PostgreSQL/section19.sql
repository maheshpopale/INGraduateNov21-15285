
/*CREATING VIEWS*/

CREATE VIEW CUSTOMER_ORDER_DETAILS AS
SELECT COMPANYNAME,ORDERS.CUSTOMERID,EMPLOYEEID,
REQUIREDDATE,SHIPPEDDATE,SHIPVIA,FREIGHT,SHIPNAME,SHIPCITY,
SHIPREGION,SHIPPOSTALCODE,SHIPCOUNTRY,ORDER_DETAILS.*
FROM CUSTOMERS
JOIN ORDERS ON
CUSTOMERS.CUSTOMERID=ORDERS.CUSTOMERID
JOIN ORDER_DETAILS
ON ORDERS.ORDERID=ORDER_DETAILS.ORDERID;

--RETRIVING FROM VIEWS

SELECT * FROM CUSTOMER_ORDER_DETAILS;


CREATE VIEW SUPPLIER_ORDER_DETAILS AS
SELECT COMPANYNAME,SUPPLIERS.SUPPLIERID,
PRODUCTS.PRODUCTID,PRODUCTNAME,
ORDER_DETAILS.UNITPRICE,QUANTITY,DISCOUNT,
ORDERS.*
FROM SUPPLIERS
JOIN PRODUCTS ON SUPPLIERS.SUPPLIERID=
PRODUCTS.SUPPLIERID
JOIN ORDER_DETAILS ON ORDER_DETAILS.PRODUCTID=PRODUCTS.PRODUCTID
JOIN ORDERS ON ORDERS.ORDERID
=ORDER_DETAILS.ORDERID;

--RETRIVING DATA FROM VIEW

SELECT * FROM SUPPLIER_ORDER_DETAILS;


--MODIFYING VIEWS


CREATE OR REPLACE VIEW public.customer_order_details
 AS
 SELECT customers.companyname,
    orders.customerid,
    orders.employeeid,
    orders.requireddate,
    orders.shippeddate,
    orders.shipvia,
    orders.freight,
    orders.shipname,
    orders.shipcity,
    orders.shipregion,
    orders.shippostalcode,
    orders.shipcountry,
    order_details.orderid,
    order_details.productid,
    order_details.unitprice,
    order_details.quantity,
    order_details.discount,
   customers.contactname
   FROM customers
     JOIN orders ON customers.customerid = orders.customerid
     JOIN order_details ON orders.orderid = order_details.orderid;

ALTER TABLE public.customer_order_details
    OWNER TO postgres;




CREATE OR REPLACE VIEW public.supplier_order_details
 AS
 SELECT suppliers.companyname,
    suppliers.supplierid,
    products.productid,
    products.productname,
    order_details.unitprice,
    order_details.quantity,
    order_details.discount,
    orders.orderid,
    orders.customerid,
    orders.employeeid,
    orders.orderdate,
    orders.requireddate,
    orders.shippeddate,
    orders.shipvia,
    orders.freight,
    orders.shipname,
    orders.shipaddress,
    orders.shipcity,
    orders.shipregion,
    orders.shippostalcode,
    orders.shipcountry,
	suppliers.phone
   FROM suppliers
     JOIN products ON suppliers.supplierid = products.supplierid
     JOIN order_details ON order_details.productid = products.productid
     JOIN orders ON orders.orderid = order_details.orderid;

ALTER TABLE public.supplier_order_details
    OWNER TO postgres;


--ALTER THE VIEW

ALTER VIEW CUSTOMER_ORDER_DETAILS
RENAME TO CUSTOMER_ORDER_DETAILED;

ALTER VIEW SUPPLIER_ORDER_DETAILS
RENAME TO SUPPLIER_ORDERS;

--CREATING UPDATABLE VIEWS

CREATE VIEW NORTH_AMERICA_CUSTOMERS
AS
SELECT * FROM CUSTOMERS
WHERE COUNTRY IN('USA','CANADA','MEXICO');

--INSERT INTO VIEW
INSERT INTO NORTH_AMERICA_CUSTOMERS
(CUSTOMERID,COMPANYNAME,CONTACTNAME,CONTACTTITLE,ADDRESS,CITY,REGION,POSTALCODE,COUNTRY,PHONE,FAX)
VALUES('CFDCM','CATFISHDOTCOM','WILL BONKAR','PRESIDENT','OLD COUNTRY ROAD',
'LILA VILLAGE','AR','77777','MEXICO','555-555-555',NULL);

--SELECT FROM VIEW
SELECT * FROM NORTH_AMERICA_CUSTOMERS

--UPDATE VIEW
UPDATE NORTH_AMERICA_CUSTOMERS
SET FAX='555-444'
WHERE CUSTOMERID='CFDCM';


CREATE VIEW PROTIEN_PRODUCTS
AS 
SELECT * FROM PRODUCTS
WHERE CATEGORYID IN(4,5,6);

--SELECT FROM VIEW

SELECT * FROM PROTIEN_PRODUCTS;

--UPDATE VIEW
UPDATE PROTIEN_PRODUCTS
SET PRODUCTNAME='ABC_PRODUCT'
WHERE PRODUCTID=22;

SELECT * FROM PROTIEN_PRODUCTS
WHERE PRODUCTID=22;

DELETE  FROM CUSTOMERS
WHERE CUSTOMERID='CFDCM';


--USING WITH CHECK OPTION
CREATE OR REPLACE VIEW NORTH_AMERICA_CUSTOMERS
AS
SELECT * FROM 
CUSTOMERS
WHERE COUNTRY IN('USA','CANADA','MEXICO')
WITH LOCAL CHECK OPTION


/*DROP VIEWS*/
DROP VIEW IF EXISTS CUSTOMER_ORDER_DETAILED;

DROP VIEW IF EXISTS SUPPLIER_ORDERS;

