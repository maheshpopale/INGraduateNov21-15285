START TRANSACTION;

UPDATE orders
SET requireddate=requireddate + INTERVAL '1 DAY'
WHERE orderdate BETWEEN '1997-12-01' AND '1997-12-31';

UPDATE orders
SET requireddate=requireddate - INTERVAL '1 DAY'
WHERE orderdate BETWEEN '1997-11-01' AND '1997-11-30'

COMMIT;

--ROLLBACK AND SAVEPOINT

START TRANSACTION;

UPDATE orders
SET orderdate=orderdate + INTERVAL '1 YEAR';

ROLLBACK

START TRANSACTION;

INSERT INTO employees(employeeid,lastname,firstname,title,birthdate,hiredate)
VALUES(501,'Sue','Jones','Operations Assistant','1999-05-23','2017-06-13');


SAVEPOINT inserted_employee;

UPDATE employees
SET birthdate='2025-07-11';

ROLLBACK TO inserted_employee;

UPDATE employees
SET birthdate='1998-05-23'
where employeeid=501;

COMMIT;

SELECT * FROM employees
where employeeid=501;

--TRANSACTION ISOLATION
