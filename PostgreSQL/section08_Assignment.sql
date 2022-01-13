--1.)

SELECT firstname,middlename,lastname,phonenumber
FROM person.person
JOIN person.businessentity
ON person.person.businessentityid=person.businessentity.businessentityid
JOIN person.personphone
ON person.personphone.businessentityid=person.businessentity.businessentityid;

--2.)
SELECT production.productmodel.name,productdescription,production.culture.name
FROM production.productmodel
JOIN production.productmodelproductdescriptionculture
ON production.productmodel.productmodelid=
production.productmodelproductdescriptionculture.productmodelid
JOIN production.productdescription
ON production.productmodelproductdescriptionculture.productdescriptionid=
production.productdescription.productdescriptionid
JOIN production.culture
ON production.culture.cultureid=
production.productmodelproductdescriptionculture.cultureid;


--3.)

--4.)
SELECT name,rating,comments FROM
production.product
LEFT JOIN production.productreview
ON production.product.productid=production.productreview.productid
ORDER BY rating ASC;

--5.)
SELECT 	production.product.productid,name,orderqty,scrappedqty
FROM production.workorder
RIGHT JOIN production.product
ON production.workorder.productid=production.product.productid;
