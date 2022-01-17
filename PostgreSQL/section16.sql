--NOT NULL CONSTRAINT
CREATE TABLE PRACTICES(
PRACTICEID INTEGER PRIMARY KEY,
PRACTICE_FIELD VARCHAR(50) NOT NULL
)

ALTER TABLE PRODUCTS
ALTER UNITPRICE SET NOT NULL;

ALTER TABLE EMPLOYEES
ALTER LASTNAME SET NOT NULL;

--UNIQUE CONTSTRAINT

DROP TABLE PRACTICES;
CREATE TABLE PRACTICES(
PRACTICEID INTEGER UNIQUE,
PRACTICE_FIELD VARCHAR(50) NOT NULL
)
--CREATING NEW TABLE NAMED 
--PETS WITH UNIQUE AND NOT NULL CONSTRAINTS
CREATE TABLE PETS(
PETID INTEGER UNIQUE,
NAME VARCHAR(50) NOT NULL
)

ALTER TABLE REGION
ADD CONSTRAINT REGION_DESC UNIQUE(REGIONDESCRIPTION)

ALTER TABLE SHIPPERS
ADD CONSTRAINT COMPANY_NAME UNIQUE(COMPANYNAME);


/*PRIMARY KEY CONSTRAINT*/
CREATE TABLE PRACTICES(
PRACTICEID INTEGER PRIMARY KEY,
PRACTICE_FIELD VARCHAR(50) NOT NULL
)
INSERT INTO PRACTICES VALUES(NULL,'PRACTID 1');
--ERROR:  syntax error at or near "NULL"
LINE 1: INSERT INTO PRACTICES(NULL,'PRACTID 1');

INSERT INTO PRACTICES 
VALUES(1,'RED');

INSERT INTO PRACTICES
VALUES(1,'GREEN');	--ERROR:  duplicate key value 
--violates unique constraint "practices_pkey"

DROP TABLE PETS;
--CREATING PETS TABLE WITH
--PRIMARY KEY AND NOT NULL CONTSTRAINTS

CREATE TABLE PETS(
PETID INTEGER PRIMARY KEY,
NAME VARCHAR(50) NOT NULL
)

/*DROP PRIMARY KEY CONSTRAINT*/
ALTER TABLE PRACTICES
DROP CONSTRAINT PRACTICES_PKEY;

--ADDING PRIMARY KEY TO PRACTICES TABLE
ALTER TABLE PRACTICES
ADD PRIMARY KEY(PRACTICEID);

--DROP PRIMARY KEY OF PETS AND RECREATE
ALTER TABLE PETS
DROP CONSTRAINT PETS_PKEY;

ALTER TABLE PETS
ADD PRIMARY KEY(PETID);

/*FOREIGN KEY CONSTRAINT*/
DROP TABLE PRACTICES;

CREATE TABLE PRACTICES(
PRACTICEID INTEGER PRIMARY KEY,
PRACTICE_FIELD VARCHAR(50) NOT NULL,
EMPLOYEEID INTEGER NOT NULL,
FOREIGN KEY(EMPLOYEEID) REFERENCES EMPLOYEES(EMPLOYEEID)
)

--ADDING FOREIGN KEY TO PETS TABLE
DROP TABLE PETS;

CREATE TABLE PETS(
PETID INTEGER PRIMARY KEY,
NAME VARCHAR(50) NOT NULL,
CUSTOMERID CHAR(5) NOT NULL,
FOREIGN KEY(CUSTOMERID) REFERENCES CUSTOMERS(CUSTOMERID)
)

--DROP FOREIGN KEY CONSTRAINT
ALTER TABLE PRACTICES
DROP CONSTRAINT PRACTICES_EMPLOYEEID_FKEY;

ALTER TABLE PRACTICES
ADD CONSTRAINT PRACTICES_EMPLOYEEID_FKEY
FOREIGN KEY(EMPLOYEEID) REFERENCES EMPLOYEES(EMPLOYEEID);

DROP TABLE PETS;

CREATE TABLE PETS(
PETID INTEGER PRIMARY KEY,
NAME VARCHAR(50) NOT NULL,
CUSTOMERID CHAR(5) NOT NULL,
FOREIGN KEY(CUSTOMERID) REFERENCES CUSTOMERS(CUSTOMERID)
) 

ALTER TABLE PETS
DROP CONSTRAINT PETS_CUSTOMERID_FKEY;

ALTER TABLE PETS
ADD CONSTRAINT PETS_CUSTOMERID_FKEY
FOREIGN KEY(CUSTOMERID) REFERENCES CUSTOMERS(CUSTOMERID);


/*CHECK CONSTRAINT*/
DROP TABLE PRACTICES;

CREATE TABLE PRACTICES(
PRACTICEID INTEGER PRIMARY KEY,
PRACTICE_FIELD VARCHAR(50) NOT NULL,
EMPLOYEEID INTEGER NOT NULL,
COST INTEGER CONSTRAINT PRACTICES_COST CHECK(COST >0 AND COST<=1000),
FOREIGN KEY(EMPLOYEEID) REFERENCES EMPLOYEES(EMPLOYEEID)
)

INSERT INTO PRACTICES
VALUES(1,'SOMETONE',2,2000);	--ERROR CHECK CONSTRIANT

--ADDING CHECK CONSTRAINT TO THE PETS TABLE

DROP TABLE PETS;
CREATE TABLE PETS(
PETID INTEGER PRIMARY KEY,
NAME VARCHAR(50) NOT NULL,
CUSTOMERID CHAR(5) NOT NULL,
WEIGHT INTEGER CONSTRAINT PETS_WEIGHT CHECK(WEIGHT>0 AND WEIGHT<=200),
FOREIGN KEY(CUSTOMERID) REFERENCES CUSTOMERS(CUSTOMERID)
)

INSERT INTO PETS
VALUES(1,'ELEPHANT','ANTON',159);

ALTER TABLE PRODUCTS
ALTER COLUMN REORDERLEVEL
SET DEFAULT 5;

--CHANGE DEFAULT VALUE
ALTER TABLE PRODUCTS
ALTER COLUMN REORDERLEVEL
SET DEFAULT 8;


/*ADDING AND REMOVING COLUMN CONSTRAINTS*/

UPDATE PRODUCTS
SET REORDERLEVEL=1
WHERE REORDERLEVEL IS NULL OR REORDERLEVEL<=0;

ALTER TABLE PRODUCTS
ADD CHECK (REORDERLEVEL>0);

ALTER TABLE PRODUCTS
ALTER COLUMN DISCONTINUED SET NOT NULL;


ALTER TABLE PRODUCTS
DROP CONSTRAINT PRODUCTS_REORDERLEVEL_CHECK; 

ALTER TABLE PRODUCTS
ALTER COLUMN DISCONTINUED DROP NOT NULL;
