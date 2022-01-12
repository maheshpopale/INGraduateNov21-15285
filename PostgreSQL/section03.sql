--select All Records
--select from Orders Table
SELECT * FROM Orders;
--select from Customers Table
SELECT * FROM Customers;
--select from Employees Table
SELECT * FROM employees;
--select from Categories Table
SELECT * FROM Categories;
--select from Products Table
SELECT * FROM Products;
--select from suppliers Table
SELECT * FROM Suppliers;


/* Selecting Specific Fields*/

--select name,city,country from suppliers Table
SELECT companyname,city,country FROM Suppliers;

--selecting categorynam,description from categories Table
SELECT categoryname,description FROM Categories;

--selecting contactname,address,city and country from Customers Table
SELECT contactname,address,city,country FROM Customers;

--selecting firstname,lastname and city from Employees Table
SELECT firstname,lastname,city FROM Employees;

/* Selecting Distinct Values*/

--Selecting Distinct country from Customers Table
SELECT DISTINCT country FROM Customers;

--Selecting Distinct city from Customers Table
SELECT DISTINCT city,country FROM Customers;

--Selecting Distinct regions from Suppliers Table
SELECT DISTINCT region FROM Suppliers;

/*Counting Results*/

--Selecting No of Records in Customers
SELECT COUNT(*) FROM Customers; --output-91

--Count the Distinct City from Suppliers
SELECT COUNT(DISTINCT city) FROM Suppliers;
--Selecting No of Records from Products Table
SELECT COUNT(*) FROM Products; --output-77

--selecting No of Records from Orders Table
SELECT COUNT(*) FROM Orders; --output-830

--selecting No of Records from Categories Table
SELECT COUNT(*) FROM Categories;

--Count No of Products ordered from order_details Table
SELECT COUNT(DISTINCT ProductId) FROM Order_Details;

/*Combingin Fields*/
SELECT customerId,shippeddate-orderdate from Orders;
--Selecting Total amount price*quanityt
SELECT orderId,unitprice*quantity FROM Order_Details;