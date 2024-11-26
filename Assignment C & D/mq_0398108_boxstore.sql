/*
** Name: Mariah Anjannelle Quinquito
** Assignment: SQL Competency C & D
** Date: '2024-01-24 03:36:00'
** History: 2024-01-24
**          DROP TABLE IF EXISTS
** 			Created a table to hold the CSV data
**          TRUNCATE TABLE
** 			Load data from CSV into the temporary table
** 			SELECT data from the table
**
**/


-- -------------------------------------------------------------------
-- DROP/CREATE/USE syntax DATABASE block
USE sys;

DROP DATABASE IF EXISTS mq_0398108_boxstore;
CREATE DATABASE IF NOT EXISTS mq_0398108_boxstore
CHARSET='utf8mb4'
COLLATE='utf8mb4_unicode_ci';

USE mq_0398108_boxstore;



-- -------------------------------------------------------------------
-- people TABLE

DROP TABLE IF EXISTS people;
CREATE TABLE IF NOT EXISTS people (
    p_id      MEDIUMINT    UNSIGNED AUTO_INCREMENT
  , full_name VARCHAR(100) NOT NULL
  , CONSTRAINT people_PK PRIMARY KEY (p_id) 
);

TRUNCATE TABLE people;
INSERT INTO people (full_name) VALUES ('Brad Vincelette')
                                    , ('Mariah Quinquito');
-- 
LOAD DATA INFILE 
'C:/Program Files/MariaDB 11.4/data/imports/10000_people_10000.csv'
INTO TABLE people
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES 
(full_name);

SELECT p_id, full_name
FROM people;
