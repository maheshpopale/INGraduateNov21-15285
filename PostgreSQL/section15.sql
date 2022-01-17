/*Creating Tables*/

 CREATE TABLE subscribers
 (
subId int CONSTRAINT PK_SUBID PRIMARY KEY,
 firstName VARCHAR(200),
 lastName VARCHAR(200),
 email VARCHAR(200),
 signupdate timestamp,
 frequency integer,
 iscustomer boolean)
 
 CREATE TABLE returns(
 returnid serial,
	 customerid char(5),
	 datereturned timestamp,
	 productid int,
	 quantity smallint,
	 orderid integer
 )
 
 /*ALTER TABLE*/
 --ALTER FIELD NAME
 ALTER TABLE subscribers
 RENAME firstname TO first_name;
 
ALTER TABLE returns
RENAME datereturned TO return_date;

--ALTER TABLE NAME
ALTER TABLE subscribers
RENAME TO email_Subscribers;

ALTER TABLE returns 
RENAME TO bad_returns;

--ADD FIELD TO TABLE
ALTER TABLE email_subscribers
ADD  COLUMN last_visit_date TIMESTAMP;

ALTER TABLE bad_returns
ADD COLUMN reason VARCHAR(50);

--DELETE FIELD
ALTER TABLE email_subscribers
DROP COLUMN last_visit_date;

ALTER TABLE bad_returns
DROP COLUMN reason;

--CHANGING DATATYPE
ALTER TABLE email_subscribers
ALTER COLUMN email SET DATA TYPE VARCHAR(225);

ALTER TABLE bad_returns
ALTER COLUMN quantity SET DATA TYPE INTEGER;


--DROP TABLE
DROP TABLE email_subscribers;

DROP TABLE bad_returns;
