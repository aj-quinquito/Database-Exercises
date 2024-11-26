/*
** Name: Mariah Anjannelle Quinquito
** Assignment: SQL Competency A
** Date: '2024-01-04 09:17:03'
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

-- login to mysql
/*
PS C:\Users\AJ> mysql -u root -p
Enter password: ******
Welcome to the MariaDB monitor....
*/

-- This is single line comment
/* this is a multi-line comment, best used at the start of your
documents, to identify, your name, student number, course, etc.
and temporarily within your code, to block out entire sections of
code, while testing scripts, this comment style should be used
very sparingly */

-- list of databases
SHOW databases;
SHOW schemas;

-- Use <database_name>
USE information_schema;

-- Selecting the DATABASE
SELECT DATABASE();

-- Show tables of the selected database
SHOW  tables;

-- Describe <table_name>
DESCRIBE collations;

-- Sample actual query
SELECT collation_name, character_set_name
FROM collations
WHERE character_set_name='utf8mb4'
ORDER BY collation_name;

-- Create database & charset/collate
CREATE DATABASE mq_0398108_boxstore
CHARSET='utf8mb4'
COLLATE='utf8mb4_unicode_ci';

-- Drop database
DROP DATABASE IF EXISTS mq_0398108_boxstore;

-- DROP/CREATE DATABASE syntax
CREATE IF NOT EXISTS DATABASE mq_0398108_boxstore
CHARSET='utf8mb4'
COLLATE='utf8mb4_unicode_ci';

USE mq_0398108_boxstore;

-- CREATE TABLE
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);

-- insert new records in a table.
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);

