ALTER TABLE EMPLOYEES
ADD COLUMN last_update timestamp;

CREATE OR REPLACE FUNCTION employees_timestamp()
RETURNS TRIGGER AS $$
BEGIN
NEW.last_update:=now();
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--creating trigger
DROP TRIGGER IF EXISTS employee_timestamp ON employees;

CREATE TRIGGER employees_timestamp BEFORE INSERT OR 
UPDATE ON employees
FOR EACH ROW EXECUTE FUNCTION employees_timestamp();

SELECT last_update,*
from employees
WHERE employeeid=1;

update employees
set address='jdflkdaf'
where employeeid=1;


-----add last_updated to products
-- create function and trigger that
--updates the field every time there
-- is change

--alter table products
ALTER TABLE products
ADD COLUMN last_updated timestamp;
--CREATING FUNCTION FOR PRODUCTS_TIMESTAMP
CREATE OR REPLACE FUNCTION products_timestamp()
RETURNS TRIGGER AS $$
BEGIN
NEW.last_updated:=now();
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--CREATING TRIGGER ON PRODUCTS
--ON INSERT OR UPDATE
CREATE TRIGGER products_timestamp BEFORE INSERT
OR UPDATE ON products
FOR EACH ROW EXECUTE FUNCTION products_timestamp();


SELECT last_updated,*
from products
where productid=2;

--now update products for id=2
UPDATE products
SET productname='terris'
WHERE productid=2;


----STATEMENT TRIGGERS------------
CREATE TABLE order_details_audit(
operation char(1) NOT NULL,
userid text NOT NULL,
stamp timestamp NOT NULL,
orderid smallint NOT NULL,
productid smallint NOT NULL,
unitprice real NOT NULL,
quantity smallint NOT NULL,
discount real
);

CREATE OR REPLACE FUNCTION audit_order_details()
RETURNS TRIGGER AS $$
BEGIN
	IF(TG_OP='DELETE') THEN
	INSERT INTO order_details_audit
	SELECT 'D',user,now(),o.*FROM old_table o;
	
	ELSEIF(TG_OP='UPDATE') THEN
	INSERT INTO order_details_audit
	SELECT 'U',user,now(),o.*FROM new_table o;
	
	ELSEIF(TG_OP='INSERT') THEN
	INSERT INTO order_details_audit
	SELECT 'I',user,now(),o.*FROM new_table o;
	END IF;
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER audit_order_details_insert AFTER INSERT ON order_details
REFERENCING NEW TABLE AS new_table
FOR EACH STATEMENT EXECUTE FUNCTION audit_order_details();
drop trigger if exists audit_order_detials_update ON order_details;
CREATE TRIGGER audit_order_details_update AFTER UPDATE on order_details
REFERENCING OLD TABLE AS new_table
FOR EACH STATEMENT EXECUTE FUNCTION audit_order_details();

CREATE TRIGGER audit_order_detials_delete AFTER DELETE on order_details
REFERENCING OLD TABLE AS old_table
FOR EACH STATEMENT EXECUTE FUNCTION audit_order_details();

INSERT INTO order_details
values(10248,3,10,5,0);

--update 
UPDATE order_details
SET discount=0.05
WHERE orderid=10248 AND productid=3



select * from order_details_audit;
