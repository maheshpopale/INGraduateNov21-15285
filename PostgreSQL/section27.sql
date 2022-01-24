CREATE OR REPLACE FUNCTION MAX_PRICE()
RETURNS REAL AS $$
BEGIN
RETURN MAX(unitprice)
FROM products;
END;
$$ LANGUAGE plpgsql;

SELECT MAX_PRICE();

CREATE OR REPLACE FUNCTION LARGEST_ORDER()
RETURNS DOUBLE PRECISION AS $$
BEGIN
RETURN MAX(quantity*unitprice)
FROM order_details;
END;
$$ LANGUAGE plpgsql;

SELECT LARGEST_ORDER();

CREATE OR REPLACE FUNCTION BIGGEST_ORDER()
RETURNS DOUBLE PRECISION AS $$
BEGIN
RETURN MAX(amount) FROM
(SELECT SUM(quantity*unitprice) AS amount
FROM order_details
GROUP BY orderid) As Totals;
END;
$$ LANGUAGE plpgsql;

SELECT BIGGEST_ORDER();

---CREATE FUNCTION WITH ARGUMENTS

CREATE OR REPLACE FUNCTION SUM_N_PRODUCT(X INT,Y INT,OUT SUM INT,OUT PRODUCT INT)
AS $$
BEGIN
SUM:=X+Y;
PRODUCT:=X*Y;
RETURN;
END;
$$ LANGUAGE plpgsql;

--------SELECT FUNCTION------
SELECT (SUM_N_PRODUCT(5,20)).*; 

--CREATE FUNCTION THAT RETURNS SQUARE AND CUBE.
--IT TAKES A SINGLE INTEGER

CREATE OR REPLACE FUNCTION SQUARE_N_CUBE(X INT,OUT SQUARE INT,OUT CUBE INT)
AS $$
BEGIN
SQUARE:=X*X;
CUBE:=X*X*X;
RETURN;
END;
$$ LANGUAGE plpgsql;

SELECT (SQUARE_N_CUBE(55)).*;

-----USE OF SETOF AND RETURN QUERY FUNCTIONS----
DROP ROUTINE IF EXISTS SOLD_MORE_THAN();
CREATE OR REPLACE FUNCTION SOLD_MORE_THAN(Total_sales REAL)
RETURNS SETOF PRODUCTS AS $$
BEGIN
RETURN QUERY SELECT * FROM products
WHERE productid IN(
SELECT productid FROM
(SELECT SUM(quantity*unitprice),productid
FROM order_details
GROUP BY productid
HAVING (quantity*unitprice)>Total_sales)AS qualified_products
);
END;

$$ LANGUAGE plpgsql;

SELECT SOLD_MORE_THAN(25000);

drop routine if exists 
suppliers_to_order_from();
CREATE OR REPLACE FUNCTION suppliers_to_reorder_from()
RETURNS SETOF suppliers AS $$
BEGIN
RETURN QUERY SELECT* FROM suppliers
WHERE supplierid IN(
SELECT supplierid FROM PRODUCTS
	WHERE unitsinstock*unitsonorder<reorderlevel
);
END;
$$ LANGUAGE plpgsql;

SELECT (suppliers_to_reorder_from()).*;


/*declaring variables*/

CREATE OR REPLACE FUNCTION middle_priced()
RETURNS SETOF products AS $$
DECLARE 
	averageprice real;
	bottomprice real;
	topprice real;
BEGIN
	SELECT AVG(unitprice) INTO averageprice
	FROM products;
	
	bottomprice:=averageprice*0.75;
	topprice:=averageprice*1.25;
	
	RETURN QUERY SELECT * FROM products
	WHERE unitprice BETWEEN bottomprice and topprice;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM middle_priced();


-- IF THEN ELSE STATEMENTS
CREATE OR REPLACE FUNCTION product_price_category(price real)
RETURNS TEXT AS $$
BEGIN
	IF price>50.0 THEN
	RETURN 'LUXURY';
	ELSEIF price > 25.0 THEN
	RETURN 'CONSUMER';
	ELSE
	RETURN 'BARGAIN';
	END IF;
END;
$$ LANGUAGE plpgsql;

SELECT product_price_category(unitprice),*
from products;

CREATE OR REPLACE FUNCTION time_of_year(date_to_check timestamp)
RETURNS text AS $$
DECLARE
	month_of_year int:=EXTRACT(MONTH FROM date_to_check);
BEGIN
IF month_of_year >=3  AND month_of_year <=5 THEN
RETURN 'SPRING';
ELSEIF month_of_year >=6 AND month_of_year <=8 THEN
RETURN 'SUMMER';
ELSEIF month_of_year >=9 AND month_of_year<=11 THEN
RETURN 'FALL';
ELSE
RETURN 'WINTER';
END IF;
END;
$$ LANGUAGE plpgsql;

SELECT time_of_year(orderdate),*
from orders;


CREATE OR REPLACE FUNCTION sold_more_than(Total_sales real)
RETURNS SETOF products AS $$
BEGIN
RETURN QUERY SELECT * FROM products
WHERE productid IN(
SELECT productid FROM
	(SELECT SUM(quantity*unitprice),productid
	FROM order_details
	 GROUP BY productid
	HAVING SUM(quantity*unitprice)>Total_sales) 
	AS qualified_products
);

IF NOT FOUND THEN
RAISE EXCEPTION 'NO PRODUCTS HAD SALES HIGHER THAN %',Total_sales;
END IF;
END;
$$ LANGUAGE plpgsql;

SELECT productname,productid,supplierid
FROM sold_more_than(250000);


--loop and while loop

CREATE OR REPLACE FUNCTION factorial(x float)
RETURNS float AS $$
DECLARE 
	current_x float:=x;
	fact float:=1;
BEGIN
	LOOP
	fact=fact*current_x;
	current_x:=current_x-1;
	
	EXIT WHEN current_x<=0;
	END LOOP;
	
	RETURN fact;
END;
$$ LANGUAGE plpgsql;

SELECT factorial(25);

---using while loop
CREATE OR REPLACE FUNCTION factorial(x float)
RETURNS float AS $$
DECLARE 
	current_x float:=x;
	fact float:=1;
BEGIN
	WHILE current_x>=1 LOOP
	fact=fact*current_x;
	current_x:=current_x-1;
	
	END LOOP;
	
	RETURN fact;
END;
$$ LANGUAGE plpgsql;

SELECT factorial(20);
