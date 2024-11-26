/*
** Name: Mariah Anjannelle Quinquito
** Assignment: SQL Competency E
** Date: '2024-02-13 09:58:03'
** History: YYYY-MM-DD
** 			Description and list of changes
** 			- change 1
** 			- change 2
** 			- change n
**
** 			YYYY-MM-DD
** 			Latest description and list of changes
** 			- latest change n
**/


-- -------------------------------------------------------------------
-- MariaDB paths and versions: 11.4
-- BINDIR
C:\Program Files\MariaDB 11.4\bin
-- DATADIR
C:\Program Files\MariaDB 11.4\data

-- -------------------------------------------------------------------
-- login to mysql

PS C:\Users\AJ> mysql -u root -p
Enter password: ******
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 3
Server version: 11.4.0-MariaDB mariadb.org binary distribution


-- -------------------------------------------------------------------
-- COMMENTS
-- This is single line comment
/* this is a multi-line comment, best used at the start of your
documents, to identify, your name, student number, course, etc.
and temporarily within your code, to block out entire sections of
code, while testing scripts, this comment style should be used
very sparingly */


-- -------------------------------------------------------------------
-- list of databases
SHOW DATABASES;
SHOW schemas;

-- Use <database_name>
USE information_schema;

-- Selecting the DATABASE
SELECT DATABASE();

-- Show tables of the selected database
SHOW tables;

-- Describe <table_name>
DESCRIBE collations;

-- Sample actual query
SELECT collation_name, character_set_name
FROM collations
WHERE character_set_name='utf8mb4'
ORDER BY collation_name;

-- Create database & charset/collate
CREATE DATABASE database_name
				CHARSET='utf8mb4'
COLLATE='utf8mb4_unicode_ci';


-- -------------------------------------------------------------------
-- DROP/CREATE/USE syntax DATABASE block
USE sys;

-- Drop database
DROP DATABASE IF EXISTS database_name;

-- DROP/CREATE DATABASE syntax
CREATE DATABASE IF NOT EXISTS	database_name
								CHARSET='utf8mb4'
COLLATE='utf8mb4_unicode_ci';

USE database_name;


-- -------------------------------------------------------------------
-- CREATE TABLE
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE your_table_name (
    column1 datatype1,
    column2 datatype2,
    column3 datatype3,
    -- Add more columns as needed
);


-- -------------------------------------------------------------------
-- insert new records in a table.
INSERT INTO students 	(first_name, last_name) VALUES
						('AJ', 'Quinquito'),
						('Mariah', 'Quinquito');
INSERT INTO your_table_name (column1, column2, column3, ...)
VALUES	(value1, value2, value3, ...),
		(value4, value5, value6, ...),
    -- Add more rows as needed;

-- -------------------------------------------------------------------
-- TRUNCATE table
TRUNCATE TABLE your_table_name;

-- -------------------------------------------------------------------
-- C.1 - Database Basics - SELECT, Data-Types w/ Conditionals
SELECT column1, column2 ... , columnN
FROM table_view_subquery_temp_result_set
WHERE filter_conditional;
ORDER BY column_name, ....; -- by default ascending
ORDER BY column_name, ...., DESC; -- descending

SELECT column1, column2, column3, ...
FROM your_table_name
WHERE your_condition;

-- -------------------------------------------------------------------
-- Data Types
-- BIT/boolean is actually a TINYINT(1) or
-- INT(1) only accepting 0 or 1 (FALSE or TRUE)
-- as values
SELECT FALSE AS b0, TRUE AS b1;


-- -------------------------------------------------------------------
-- FALSE returns 0
-- TRUE returns 1
-- b0 and b1 are called labels
-- the results returned after executing this
-- SQL query are a result set
-- using the temp result set as a subquery
-- in the FROM to do some conditionals in
-- the SELECT


-- -------------------------------------------------------------------
-- 
SELECT	trs.b0
	, b1
	, b0=b1, b0<>b1, b0!=b1, b0=b0
	, trs.b1=TRUE
FROM (SELECT FALSE AS b0, TRUE AS b1) trs;

-- -------------------------------------------------------------------
-- trs needs to be specified here, this is a
-- table alias, it's an abbreviation of your
-- choice, I used trs to abbreviate temp result
-- set and also can be used on the columns in
-- the SELECT clause
--
-- So FROM trs, we are calling columns
-- b0 and b1, to display them, and compare them
-- via the:
--
-- b0=b1 returns 0 (FALSE) as TRUE equal to
-- FALSE is FALSE
--
-- b0<>b1 and b0!=b1 returns 1 (TRUE) as they do
-- not equal each other as FALSE does not equal
-- TRUE
--
-- b0=b0 returns 1 as b0 compared to itself with
-- values of FALSE are equal
-- equal TRUE
--
-- trs.b1=TRUE, where we use an alias-column
-- reference, that calls b1 from trs and then
-- comparing it to the value of TRUE, which
-- returns 1, as it b1 does equal TRUE


-- -------------------------------------------------------------------
-- 
SELECT 1.1, 'H1';


-- -------------------------------------------------------------------
-- returns for columns, w/ labels-values listed
SELECT 1 AS i1, 2 AS i2
	, 1.0 AS d1, 2.22 AS d2;


-- -------------------------------------------------------------------
-- again, taking this SELECT and using it as a
-- temporary result set
SELECT i1, i2, d1, d2 -- returns: 1, 2, 1.0, 2.22
	, i1<i2 -- returns 1 as 1<2 is TRUE
	, i1<=d1 -- returns 1 as 1<=2 is TRUE
	, i1=d1 -- returns 1 as 1=1.0 is TRUE
	, i1!=d1 -- returns 1 as 1!=1.0 is FALSE
	, i2>i1 -- returns 1 as 2>1 is TRUE
	, d2>=i2 -- returns 1 as 2.22>=2 is TRUE
	, 1.5 BETWEEN i1 AND d2 -- 1<=1.5<=2.22 TRUE
	, 2.22 BETWEEN i1 AND d2 -- 1<=2.22<=2.22 TRUE
	, 3 BETWEEN i1 AND d2 -- 1<=3<=2.22 is FALSE
FROM (SELECT 1 AS i1, 2 AS i2
	, 1.0 AS d1, 2.22 AS d2) trs2;
	
	
-- -------------------------------------------------------------------
-- = is equal to
-- < is less than, <= is less than equal to
-- > is greater than, >= is greater than equal to
-- != and <> are not equal to
-- value BETWEEN begin_value AND end_value
-- compares whether the value is within and/or
-- equals the begin and end values:
-- with i1=1 and d2=2.22
-- 1.5 BETWEEN 1 AND 2.22 is TRUE basically it is
-- the same as 1<=1.5 AND 1.5<=2.22
--
SELECT i1, d2
	, 1.5 BETWEEN i1 AND d2
	, i1<=1.5 AND 1.5<=d2 -- same as the between
FROM (SELECT 1 AS i1, 2 AS i2
	, 1.0 AS d1, 2.22 AS d2) trs3;
	
	
-- -------------------------------------------------------------------
-- column IN(value1, value2 ... , valueN) will
-- return 1 (TRUE) is the column value is
-- matching a value in the list:
--
SELECT i1 IN (1,2,3,4) -- TRUE 1
	, i2 IN (5,6,7,8) -- FALSE 0
	, d1 IN (1,2,3,4) -- TRUE 1
	, d2 IN (i1,i2,d1) -- FALSE 0
FROM (SELECT 1 AS i1, 2 AS i2
	, 1.0 AS d1, 2.22 AS d2) trs4;
	

-- -------------------------------------------------------------------
-- also, we can do some mathematics with numbers
-- add subtract times divide modulus
--
SELECT i1+i2, i1-i2, i1*i2, i1/i2, i1%i2
	, d1+d2, d1-d2, d1*d2, d1/d2, d1%d2
	, i1+d1, i1-d1, i1*d1, i1/d1, i1%d1
FROM (SELECT 1 AS i1, 2 AS i2
	, 1.0 AS d1, 2.22 AS d2) trs5;


-- -------------------------------------------------------------------
-- so we can add(+) subtract(-) multiply(*)
-- divide(/) and modulus(%, returns remainder
-- simple strings, begins/ends with space, noting
-- data is usually trimmed and not stored this way
--
SELECT ' Hi ' AS s1
	, ' Bye ' AS s2;
	
	
-- -------------------------------------------------------------------
-- taking this into a temporary result set, we can perform 
-- several string functions
--
SELECT s1, s2 -- returns:
	, TRIM(s1), TRIM(s2) -- 'Hi' 'Bye'
	, LTRIM(s1), LTRIM(s2) -- 'Hi ' 'Bye '
	, RTRIM(s1), RTRIM(s2) -- ' Hi' ' Bye'
	, CONCAT(s1,'and',s2) -- ' Hi and Bye '
	, LENGTH(TRIM(s1)), LENGTH('HĬ') -- LENGTH in bytes
	, CHAR_LENGTH(TRIM(s1)), CHAR_LENGTH('HĬ') -- visual LENGTH
FROM (SELECT ' Hi ' AS s1
	, ' Bye ' AS s2) tsr6;


-- -------------------------------------------------------------------
-- usually, strings when stored in the database,
-- the values are TRIM'd, no need in storing
-- spaces, a CONCAT usually needs to account
-- for spaces
--
SELECT s1, s2 -- returns:
	, CONCAT(s1,' and ',s2) -- 'Hi and Bye'
FROM (SELECT 'Hi' AS s1
	, 'Bye' AS s2) tsr7;
	
	
-- -------------------------------------------------------------------
-- string comparisons and 'H' or 'i' patterns
SELECT s1, s2 -- returns:
	, s1=s2, s1<>s2 -- 0 (FALSE) | 1 (TRUE)
	, s1='Hi' -- 1
	, s1<>'Bye' -- 1
	, s1 LIKE 'H%' -- 1, % is 0 to many chars
	, s1 LIKE 'H_' -- 1, _ means must have 1
	, 'H' LIKE 'H%' -- 1
	, 'Hi' LIKE 'H%' -- 1
	, ' Hi' LIKE 'H%' -- 0 if pattern ' H%' then 1
	, 'H' LIKE 'H_' -- 0, means any 1 char after
	, s1 LIKE 'H__' -- 0, means any 2 chars after
	, s1 LIKE '_i' -- 1, means any 1 char before
	, s1 LIKE '__i' -- 0, means any 2 chars bef.
	, s1 LIKE '%i' -- 1, 0 to many chars bef.
	, s1 LIKE '%%i' -- 1, but pointless, NEVER DO
FROM (SELECT 'Hi' AS s1
	, 'Bye' AS s2) tsr8;
	
	
-- -------------------------------------------------------------------
-- string comparisons and patterns
SELECT s1, s2 -- returns:
	, s2='Bye' -- 1
	, s2!='Hi' -- 1
	, s2 LIKE 'B%' -- 1, % is 0 to many chars
	, s2 LIKE 'B_' -- 0, _ must have 1 only
	, 'B' LIKE 'B%' -- 1
	, 'Bye' LIKE 'B%' -- 1
	, ' Bye' LIKE 'B%'-- 0 if pattern ' B%' rtns: 1
	, 'B' LIKE 'B_' -- 0, means any 1 char after
	, s2 LIKE 'B__' -- 1, means any 2 chars after
	, s2 LIKE '_e' -- 0, means any 1 char before
	, s2 LIKE '__e' -- 1, means any 2 chars bef.
	, s2 LIKE 'B_e' -- 1, means 1 char in middle
	, s2 LIKE 'B%e' -- 1, 0 to many chars mid
	, s2 LIKE '_y_' -- 1, 1 char beg end, y mid
	, s2 LIKE '%y%' -- 1, chars beg end, y mid
	, 'y' LIKE '%y%' -- 1, 0 chars beg end, y mid
	, 'y' LIKE '_y_' -- 0, 1 char beg end, y mid
	, s2 LIKE '%%e' -- 1, but pointless, NEVER DO
	, s2 LIKE 'B%%' -- 1, but pointless, NEVER DO
FROM (SELECT 'Hi' AS s1
	, 'Bye' AS s2) tsr9;
	
	
-- -------------------------------------------------------------------
-- IN and NOT IN comma delimited list
SELECT s1, s2 -- returns:
	, s1 IN('Hi','Bye') -- 1
	, s2 IN('Hi','Bye') -- 1
	, s1 NOT IN('Hi','Bye') -- 0
	, s2 NOT IN('Hi','Bye') -- 0
	, 'Hello' IN('Hi','Bye') -- 0
	, 'Hello' IN(s1,s2) -- 0
	, 'Hi' IN(s1,s2) -- 1
FROM (SELECT 'Hi' AS s1
	, 'Bye' AS s2) tsr10;
	
	
-- -------------------------------------------------------------------
-- NULL checks, null does not mean empty string ''
SELECT s1, s2, s3 -- returns:
	, s1=s3 -- NULL
	, s2<>s3 -- NULL
	, s1=IFNULL(s3,'') -- 0 - workaround
	, s2<>IFNULL(s3,'') -- 1 - workaround
	, s3 IS NULL -- 1
	, s1 IS NOT NULL -- 1
	, NULL IN (s1,s2,s3) -- NULL
FROM (SELECT 'Hi' AS s1
	, 'Bye' AS s2
	, NULL AS s3) tsr11;
	
	
-- -------------------------------------------------------------------
-- AND operator, both conditionals must be TRUE
SELECT s1, s2 -- returns:
	, s1='Hi' AND s2='Bye' -- 1 TRUE+TRUE=TRUE
	, s1='Hi' AND s2='Hi' -- 0 TRUE+FALSE=FALSE
	, s1='Bye' AND s2='Bye' -- 0 FALSE+TRUE=FALSE
	, s1='Bye' AND s2='Hi' -- 0 FALSE+FALSE=FALSE
FROM (SELECT 'Hi' AS s1
	, 'Bye' AS s2) tsr12;
	
	
-- -------------------------------------------------------------------
-- OR operator, either conditional must be TRUE
SELECT s1, s2 -- returns:
	, s1='Hi' OR s2='Bye' -- 1 TRUE or TRUE=TRUE
	, s1='Hi' OR s2='Hi' -- 1 TRUE or FALSE=TRUE
	, s1='Bye' OR s2='Bye' -- 1 FALSE or TRUE=TRUE
	, s1='Bye' OR s2='Hi' -- 0 FALSE or FALSE=FALSE
FROM (SELECT 'Hi' AS s1
	, 'Bye' AS s2) tsr13;


-- -------------------------------------------------------------------
-- row will display
SELECT s1, s2
FROM (SELECT 'Hi' AS s1
	, 'Bye' AS s2) tsr14
WHERE s1='Hi';


-- -------------------------------------------------------------------
-- row will display
SELECT s1, s2
FROM (SELECT 'Hi' AS s1
	, 'Bye' AS s2) tsr15
WHERE s1='Hi' AND s2='Bye';


-- -------------------------------------------------------------------
-- row will not display
SELECT s1, s2
FROM (SELECT 'Hi' AS s1
	, 'Bye' AS s2) tsr16
WHERE s2='Hi' OR s1='Bye';


-- -------------------------------------------------------------------
-- row will display
SELECT s1, s2
FROM (SELECT 'Hi' AS s1
	, 'Bye' AS s2) tsr17
WHERE s1 IN ('Hi','Bye') AND s2 LIKE 'B%';


-- -------------------------------------------------------------------
-- row will display, noting that this is the same
-- as the previous query, as an IN is like doing an
-- OR comparison, since there is a second predicate
-- with the LIKE, we must put the OR checks in
-- brackets so it evaluates it like an IN and
-- doesn’t change the operations of the query, to
-- look for s1='Hi' then OR then
-- the query looking for s1='Bye' AND s2 LIKE 'B%'
-- as the next filter
--
SELECT s1, s2
FROM (SELECT 'Hi' AS s1
	, 'Bye' AS s2) tsr18
WHERE (s1='Hi' OR s1='Bye') AND s2 LIKE 'B%';


-- -------------------------------------------------------------------
-- row will display, not that the single digit:
-- month, day of month, hour, minute, second all
-- are padded by a zero and databases supports the
-- this constant length (19 characters for DATETIME
-- field) character format

-- -------------------------------------------------------------------
SELECT d1, d2
	, d1<=d2 -- 1
	, d1=d2 -- 0
	, d1>d2 -- 0
	, d1='2020-01-01 00:00:00' -- 1
	, d2='2020-01-01 00:00:00' -- 0
	, d1 BETWEEN '2019-01-01 00:00:00'
AND '2022-01-01 00:00:00' -- 1
	, d1 NOT BETWEEN '2019-01-01 00:00:00'
AND '2022-01-01 00:00:00' -- 0
FROM (SELECT '2020-01-01 00:00:00' AS d1
	, '2021-12-31 23:59:59' AS d2) tsr20;
	
	
-- -------------------------------------------------------------------
-- NOW function with date numeric functions
SELECT d1
	, QUARTER(d1) -- Date Quarter
	, YEAR(d1) -- Date Year0
	, MONTH(d1) -- Date Month
	, DAY(d1) -- Date Day
	, HOUR(d1) -- Date Hour
	, MINUTE(d1) -- Date Minute
	, SECOND(d1) -- Date Second
	, WEEKDAY(d1) -- 0 Mon thru 7 Sun
FROM (SELECT NOW() AS d1) tsr21;


-- -------------------------------------------------------------------
-- NOW and common string format functions (
-- https://www.w3schools.com/sql/func_mysql_date_format.asp
--
SELECT d1
	, MONTHNAME(d1) -- Date Month
	, DAYNAME(d1) -- Date Day
	, DATE_FORMAT(d1,'%a, %D of %b %Y %l:%i %p')
-- Date String
FROM (SELECT NOW() AS d1) tsr22;


-- -------------------------------------------------------------------
-- Module D.1 - Database Build - CREATE TABLE with 2 COLUMNs

-- -------------------------------------------------------------------
-- CREATE TABLE syntax (w/ DROP TABLE)
DROP TABLE IF EXISTS table_name;
CREATE TABLE IF NOT EXISTS table_name (
	colPK INTtype AUTO_INCREMENT
	, col2 DATAtype(size) NULL DEFAULT value
	...
	, colN DATAtype(size) NULL
	, colFKs INTtype NULL
	, p_id_user INTtype -- logged in user p_id
	, date_mod DATETIME DEFAULT NOW()
	, active BIT DEFAULT 1 -- 0 hide
	, CONSTRAINT table_name___PK PRIMARY KEY(colPK)
	, CONSTRAINT table_name___UK UNIQUE(col2,...colN)
);

-- -------------------------------------------------------------------
-- Insert the first 2 rows into our people table
-- replace Instructor Name and Your Name with
-- respective values
INSERT INTO people (full_name) VALUES ('Instructor Name');
INSERT INTO people (full_name) VALUES ('Your Name');
-- running it as a BULK INSERT
INSERT INTO people (full_name) VALUES ('Instructor Name')
	, ('Your Name');

-- verify your query works (returns 2 rows)
SELECT p_id, full_name
FROM people
WHERE 1=1;

-- -------------------------------------------------------------------
-- SELECT FROM syntax
SELECT DISTINCT column1, column2 ... , columnN
FROM table_name
WHERE filter_condition AND|OR second_condition
ORDER BY column2 DESC, ...
LIMIT rowoffset#, rowsperpage#(rpp);

-- -------------------------------------------------------------------
-- get all rows
--
SELECT p_id, full_name
FROM people
WHERE 1=1; -- condition: 1=1 evals to TRUE

-- -------------------------------------------------------------------
-- if a filter is being added
-- later in the query, just
-- put WHERE 1=1 as placeholder
-- get all columns, an asterisk means all
-- columns, though it is never wise to use
-- asterisks, most of the time you need only a
-- few columns to travel from the database
-- over the network, to the web or app pages
-- calling it, this fine for quick testing
-- only!!
--
SELECT *
FROM people;

-- -------------------------------------------------------------------
-- get first record
SELECT p_id, full_name
FROM people
WHERE p_id=1;

-- -------------------------------------------------------------------
-- get second record
SELECT p_id, full_name
FROM people
WHERE p_id=2;

-- -------------------------------------------------------------------
-- show first row, if 2, shows both rows
SELECT p_id, full_name
FROM people
LIMIT 1;

-- -------------------------------------------------------------------
-- would show second record only
SELECT p_id, full_name
FROM people
LIMIT 1,1;

-- -------------------------------------------------------------------
-- get your name record (replace Your Name)
SELECT p_id, full_name
FROM people
WHERE full_name='Your Name';

-- -------------------------------------------------------------------
-- get the instructor name record (replace
-- Instructor Name)
SELECT p_id, full_name
FROM people
WHERE full_name='Instructor Name';

-- -------------------------------------------------------------------
-- get your last name (replace only the Name in
-- the last name here, leave in the % and space)
SELECT p_id, full_name
FROM people
WHERE full_name LIKE '% Name';


-- -------------------------------------------------------------------
-- Module D.2 - Database Build – ALTER TABLE: Parsing String  
-- into 2 Columns

-- -------------------------------------------------------------------
-- ALTER TABLE syntax
ALTER TABLE table_name
ADD COLUMN column3 datatype(size) nullable
	, ADD COLUMN column4 datatype(size) nullable
	...
	, ADD COLUMN columnN datatype(size) nullable;
ALTER TABLE table_name
MODIFY COLUMN columnN datatype(size) nullable;

ALTER TABLE table_name
DROP COLUMN columnN;

-- can be done all together:
ALTER TABLE table_name
ADD COLUMN column3 datatype(size) nullable
MODIFY COLUMN columnN datatype(size) nullable;
DROP COLUMN columnN;

-- -------------------------------------------------------------------
-- alter people table, to add first_name
-- last_name columns
--
ALTER TABLE people
ADD COLUMN first_name VARCHAR(40) NULL
	, ADD COLUMN last_name VARCHAR(60) NULL;
-- view your people table structure mods
DESCRIBE people;
-- list instructor and your name rows
SELECT * FROM people WHERE p_id<=2;


-- -------------------------------------------------------------------
-- UPDATE / SET syntax
UPDATE table_name
SET column1=value1
	, column2=value2
	, ...
	, columnN=valueN
WHERE condition;

-- -------------------------------------------------------------------
-- Update the first 2 records of our people table
SELECT p_id, full_name, first_name, last_name
FROM people
WHERE p_id <= 2;

-- reset for rerun
UPDATE people
SET first_name=NULL
	, last_name =NULL
WHERE p_id IN (1,2);
-- value updates for p_id 1 and 2
UPDATE people
SET first_name='InstructorFirstName'
	, last_name ='InstructorLastName'
WHERE p_id=1;
UPDATE people
SET first_name='YourFirstName'
	, last_name ='YourLastName'
WHERE p_id=2;


-- -------------------------------------------------------------------
-- STRING FUNCTIONS

-- -------------------------------------------------------------------
-- 0 1 2 ruler tens
-- 012345678901234567890 ruler ones
-- 'FirstName LastName'
-- 1 ^?^ ^
-- |^|= space position (SP)
-- ? ? ? = LENGTH - SP
-- SP-1 SP+1
-- determine the position of the space
--
SELECT full_name
	, INSTR(full_name,' ') AS pos
	, INSTR(full_name,' ')-1 AS first_name_end_pos
	, INSTR(full_name,' ')+1 AS last_name_beg_pos
FROM people
WHERE p_id>=3;

-- -------------------------------------------------------------------
-- MID(string, start, length) = STRING
-- get first name, starts at position 1 and ends
-- at space position minus 1 (aka: length of
-- first name)
--
SELECT full_name
	, INSTR(full_name,' ')-1 AS first_name_end_pos
	, MID(full_name,1,INSTR(full_name,' ')-1) AS first_name
FROM people
WHERE p_id>=3;

-- the last name's first letter position is the
-- space's location plus 1
--
SELECT full_name
	, MID(full_name, 1, INSTR(full_name,' ')-1) AS first_name
	, INSTR(full_name,' ')+1 as last_name_beg
FROM people
WHERE p_id>=3;

-- MID function, starting at space plus 1, using
-- the column's max size as string length
--
SELECT full_name
	, MID(full_name, 1, INSTR(full_name,' ')-1 ) AS first_name
	, MID(full_name, INSTR(full_name,' ')+1 ,100) AS last_name
FROM people
WHERE p_id>=3;


-- -------------------------------------------------------------------
-- LENGTH(full_name)-INSTR(full_name,' ')
-- added length less space pos for last name
-- length
--
SELECT full_name
	, MID(full_name, 1,INSTR(full_name,' ')-1) AS first_name
	, MID(
	full_name
	, INSTR(full_name,' ')+1
	, LENGTH(full_name)-INSTR(full_name,' ')
) AS last_name
FROM people
WHERE p_id>=3;

-- updates first_name and last_name by splitting
-- up full_name column
--
UPDATE people
SET first_name = MID(full_name, 1, INSTR(full_name,' ')-1)
	, last_name = MID(
	full_name
	, INSTR(full_name,' ')+1
	, LENGTH(full_name)-INSTR(full_name,' ')
)
WHERE 1=1;

-- ie: first 2 rows: p_id<=2;
-- ie: after row 2 to the end p_id>=3;
-- always verify your changes:
SELECT * FROM people;

-- updates first_name and last_name by splitting
-- up full_name column
--
UPDATE people
SET first_name = NULL
	, last_name = NULL
WHERE 1=1;

-- updates first_name and last_name by splitting
-- up full_name column
--
UPDATE people
SET first_name = MID(full_name, 1, INSTR(full_name,' ')-1)
	, last_name = MID(
	full_name
	, INSTR(full_name,' ')+1
	, LENGTH(full_name)-INSTR(full_name,' ')
)
WHERE 1=1;

-- and again, always verify your changes:
SELECT * FROM people;


-- -------------------------------------------------------------------
-- QUERY CODE CLEANSING

-- short queries should be written on 1 line
--
SELECT first_name FROM people;
-- if you are requesting more than 1 column, then the
FROM
-- should be pushed to another line
--
SELECT first_name, last_name -- comma then space
FROM people;

- always start your code in position 1
SELECT ...
FROM ...
WHERE ...
ORDER BY ...;

-- if your line is going beyond 70 characters,
-- you continue from the next line, and put in
-- 4 spaces, then continue the query
-- acceptable form of query, in general, however
-- make the query more readable, as seen below
SELECT first_name, last_name
FROM people
WHERE first_name='Brad'
ORDER BY last_name;

-- now using a spaced out version, so columns, tables,
-- predicates, and sort columns, all line up at the
-- 10 position,
SELECT first_name, last_name
FROM people
WHERE first_name='Brad'
ORDER BY last_name;

-- if no ordering, your columns/table/predicate could
-- start at position 8
SELECT first_name, last_name
FROM people
WHERE first_name='Brad';
-- also, don’t add a -- comment line after the semi-colon
-- just do the comment on a separate line, if selected with
-- your query to be ran, it will return a syntax error:
SELECT first_name, last_name
FROM people
WHERE first_name='Brad'; -- Syntax Error if
						-- comment ran with
						-- query, only select
						-- up to semicolon

-- ALTER syntax
ALTER TABLE people DROP COLUMN full_name;

-- current final table query without full_name
-- adding table aliases in, when designing tables
-- we can shorten our queries with abbreviations
-- of our standard table names, people will be p
SELECT p.p_id, p.first_name, p.last_name
FROM people p;

-- -------------------------------------------------------------------
-- JOIN ON - Syntax
SELECT	a.column1, a.column2, ...
		b.column1, b.column2, ...
		c.column1, c.column2, ...
FROM atable a
JOIN btable b ON a.PK_FK_col=b.FK_PK_col
JOIN ctable c ON b.PK_FK_col=c.FK_PK_col;

SELECT	tableA.column1, tableA.column2, ...
	tableB.column1, tableB.column2, ...
FROM tableA
	JOIN tableB
		ON tableA.PrimaryKey=tableB.ForeignKey;

-- -------------------------------------------------------------------
-- JOIN ON - Example
SELECT *
FROM geo_region grg
	JOIN geo_country gco ON grg.co_id=gco.co_id;

-- -------------------------------------------------------------------
-- JOIN - Prefixing/Qualifying Table Names
SELECT grg.rg_id, grg.rg_name, grg.co_id
	, gco.co_id, gco.co_name
FROM geo_region grg
JOIN geo_country gco ON grg.co_id = gco.co_id;

-- -------------------------------------------------------------------
-- JOIN - Table Alias
SELECT grg.rg_id, grg.rg_name, grg.co_id
	, gco.co_id, gco.co_name
FROM geo_region grg
	JOIN geo_country gco ON grg.co_id = gco.co_id;

-- -------------------------------------------------------------------
-- JOIN - INNER JOIN
SELECT grg.rg_id, grg.rg_name, grg.co_id
	, gco.co_id, gco.co_name
FROM geo_region grg
	INNER JOIN geo_country gco ON grg.co_id=gco.co_id;
	
-- -------------------------------------------------------------------
-- JOIN - INNER JOIN - Practice
SELECT gtc.tc_id, gtc.tc_name, gtc.rg_id
	, grg.rg_id, grg.rg_name, grg.co_id
	, gco.co_id, gco.co_name, gco.co_abbr
FROM geo_towncity gtc
JOIN geo_region grg ON gtc.rg_id=grg.rg_id
JOIN geo_country gco ON grg.co_id=gco.co_id;