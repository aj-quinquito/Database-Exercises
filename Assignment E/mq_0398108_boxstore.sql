/*
** Name: Mariah Anjannelle Quinquito
** Assignment: SQL Competency E
** Date: '2024-02-13 09:58:03'
** History: 2024-02-13
** 		- Added DROP/CREATE/USE mq_0398108_boxstore DATABASE section
** 		- Added TABLE geo_address_type creation and data insertion
**   	- Included address types: House, Apartment, PO Box, Other
**   	- Added appropriate data for address types
**   	- Created primary key for addr_type_id
**   	- Defined NOT NULL constraint for addr_type
**   	- Ensured data integrity
**/

-- -------------------------------------------------------------------


/*USE sys;

DROP DATABASE IF EXISTS mq_0398108_boxstore;

CREATE DATABASE mq_0398108_boxstore;*/

USE mq_0398108_boxstore;



-- -------------------------------------------------------------------

DROP TABLE IF EXISTS geo_address_type;
CREATE TABLE IF NOT EXISTS geo_address_type (
    addr_type_id    TINYINT     UNSIGNED AUTO_INCREMENT,
    addr_type       VARCHAR(15) NOT NULL,
    active          BIT         NOT NULL DEFAULT 1,
    CONSTRAINT gat_PK PRIMARY KEY (addr_type_id),
    CONSTRAINT gat_UK UNIQUE (addr_type ASC)
);

TRUNCATE TABLE geo_address_type;

INSERT INTO geo_address_type (addr_type) 
VALUES  ('Apartment'),
        ('Building'),
        ('Condominium'),
        ('Head Office'),
        ('House'),
        ('Other'),
        ('Townhouse'),
        ('Warehouse')
;

SELECT gat.addr_type_id, gat.addr_type, gat.active
FROM geo_address_type gat
WHERE gat.active = 1;



-- -------------------------------------------------------------------

DROP TABLE IF EXISTS geo_country;
CREATE TABLE IF NOT EXISTS geo_country (
    co_id 	TINYINT 	UNSIGNED AUTO_INCREMENT,
    co_name VARCHAR(60) NOT NULL,
	co_abbr CHAR(2) 	NOT NULL,
    active 	BIT 		NOT NULL  DEFAULT 1,
	CONSTRAINT gco_PK PRIMARY KEY (co_id),
	CONSTRAINT gco_UK_name UNIQUE (co_name ASC),
	CONSTRAINT gco_UK_abbr UNIQUE (co_abbr ASC)
);

TRUNCATE TABLE geo_country;

INSERT INTO geo_country (co_name, co_abbr) 
VALUES	('Canada',       'CA'),
        ('Japan',       'JP'),
        ('South Korea', 'KR'),
        ('United States of America', 'US')
;

SELECT gco.co_id, gco.co_name, gco.co_Abbr, gco.active
FROM geo_country gco
WHERE gco.active=1;



-- -------------------------------------------------------------------

DROP TABLE IF EXISTS geo_region;
CREATE TABLE IF NOT EXISTS geo_region (
    rg_id       SMALLINT    UNSIGNED AUTO_INCREMENT,
    rg_name     VARCHAR(50) NOT NULL,
	rg_abbr    CHAR(2),
	co_id      TINYINT     NOT NULL, -- FK geo_country
	active     BIT         NOT NULL DEFAULT 1,
    CONSTRAINT grg_PK PRIMARY KEY(rg_id),
	CONSTRAINT grg_UK UNIQUE (co_id ASC, rg_name DESC)
);

TRUNCATE TABLE geo_region;

INSERT INTO geo_region (rg_name, rg_abbr, co_id) 
VALUES  ('Manitoba'     ,   'MD'    ,     1), 
        ('Osaka'        ,   ''      ,     2),
        ('Tokyo'        ,   ''      ,     3),     
        ('Gyeonggi'     ,   ''      ,     3),
        ('California'   ,   ''      ,     4),
        ('Washington'   ,   ''      ,     4)
;    

SELECT grg.rg_id, grg.rg_name, grg.rg_abbr, grg.active
FROM geo_region grg
WHERE grg.active = 1;

SELECT grg.rg_id, grg.rg_name, grg.rg_abbr, grg.active, 
       gco.co_id, -- FK
       gco.co_name, gco.co_abbr
FROM geo_region grg
    JOIN geo_country gco ON grg.co_id = gco.co_id
;



-- -------------------------------------------------------------------

DROP TABLE IF EXISTS geo_towncity;
CREATE TABLE IF NOT EXISTS geo_towncity (
    tc_id   MEDIUMINT   AUTO_INCREMENT,
    tc_name VARCHAR(60) NOT NULL,
    rg_id   SMALLINT    UNSIGNED NOT NULL, -- FK geo_region
    active  BIT         NOT NULL DEFAULT 1,
	CONSTRAINT gtc_PK PRIMARY KEY(tc_id),
	CONSTRAINT gtc_UK UNIQUE (rg_id ASC, tc_name ASC)
);

TRUNCATE TABLE geo_towncity;

INSERT INTO geo_towncity (tc_name, rg_id) 
VALUES  ('Winnipeg'    , 1),  
        ('Kadoma'      , 2),
        ('Chiyoda'     , 3),     
        ('Minato'      , 3),
    	('Suwon'       , 4),
    	('Seoul'       , 4),
    	('Los Altos'   , 5),
    	('Santa Clara' , 5),
    	('Round Clara' , 5),
    	('Redmond'     , 7)
;

SELECT gtc.tc_id, gtc.tc_name, gtc.rg_id, gtc.active 
FROM geo_towncity gtc
WHERE gtc.active = 1;



SELECT gtc.tc_id, gtc.tc_name, gtc.rg_id,
       grg.rg_id,
       grg.rg_name, grg.rg_abbr,
       gco.co_id, -- FK
       gco.co_name, gco.co_abbr
FROM geo_towncity gtc
    JOIN geo_region grg ON gtc.rg_id = grg.rg_id
    JOIN geo_country gco ON grg.co_id = gco.co_id
;



-- -------------------------------------------------------------------

DROP TABLE IF EXISTS people;
CREATE TABLE IF NOT EXISTS people (
    p_id        MEDIUMINT       UNSIGNED AUTO_INCREMENT,
    full_name   VARCHAR(255)    NOT NULL,
    CONSTRAINT people_PK PRIMARY KEY (p_id)
);

TRUNCATE TABLE people;

INSERT INTO people (full_name) 
VALUES  ('Brad Vincelette'),      
        ('Aj Quinquito')
;
SELECT p_id, full_name
FROM people;

-- -------------------------------------------------------------------

LOAD DATA INFILE 
'C:/Program Files/MariaDB 11.4/data/imports/10000_people_10000.csv'
INTO TABLE people
	FIELDS TERMINATED BY ',' ENCLOSED BY '"'
	LINES TERMINATED BY '\r\n'
IGNORE 1 LINES (full_name);

SELECT p_id, full_name 
FROM people
WHERE 1=1;

-- -------------------------------------------------------------------

ALTER TABLE people
    ADD COLUMN first_name   VARCHAR(35) NULL,
    ADD COLUMN last_name    VARCHAR(35) NULL
;

UPDATE people
SET first_name = SUBSTRING_INDEX('Brad Vincelette', ' ', 1),
    last_name = SUBSTRING_INDEX('Brad Vincelette', ' ', -1)
WHERE p_id = 1;

UPDATE people
SET first_name = SUBSTRING_INDEX('Mariah Quinquito', ' ', 1),
    last_name = SUBSTRING_INDEX('Mariah Quinquito', ' ', -1)
WHERE p_id = 2;




UPDATE people
SET
    first_name = SUBSTRING_INDEX(full_name, ' ', 1),
    last_name = SUBSTRING_INDEX(full_name, ' ', -1)
WHERE p_id>=3
;

SELECT p_id, full_name, first_name, last_name 
FROM people;

-- -------------------------------------------------------------------



ALTER TABLE people
    DROP COLUMN full_name,
    MODIFY COLUMN first_name VARCHAR(35) NOT NULL,
    MODIFY COLUMN last_name  VARCHAR(35),
    ADD COLUMN email_addr    VARCHAR(50),
    ADD COLUMN password      CHAR(32),
    ADD COLUMN phone_pri     CHAR(12),     -- NOT NULL later switch
    ADD COLUMN phone_sec     CHAR(12),
    ADD COLUMN phone_fax     CHAR(12),
    ADD COLUMN addr_prefix   VARCHAR(10),
    ADD COLUMN addr          VARCHAR(60),
    ADD COLUMN addr_code     CHAR(7),
    ADD COLUMN addr_info     VARCHAR(191),
    ADD COLUMN addr_delivery VARCHAR(191),
    ADD COLUMN addr_type_id  TINYINT(4),   -- FK geo_address_type
    ADD COLUMN tc_id         MEDIUMINT,      -- FK geo_towncity
    
    ADD COLUMN user_mod      INT(11) DEFAULT 2,
    ADD COLUMN date_mod      DATETIME DEFAULT CURRENT_TIMESTAMP,
    ADD COLUMN user_act      INT(11) DEFAULT 1,
    ADD COLUMN date_act      DATETIME DEFAULT CURRENT_TIMESTAMP,
    ADD COLUMN active        BIT(1) DEFAULT 1
;


-- -------------------------------------------------------------------

UPDATE people
SET 
    email_addr = LOWER(CONCAT(first_name, '.', last_name, 
                '@boxstore.com')
    ),
    password = MD5('SecurePassword123!'), 
    phone_pri = '204-255-1989', 
    phone_sec = '204-255-1990',  
    phone_fax = '204-255-1991',  
    addr_prefix = NULL,  
    addr = '456 Oak St',  
    addr_code = 'R3M 0Y6',  
    addr_info = 'PO Box 123',  
    addr_delivery = 'Knock on outside door',
    addr_type_id = (
        SELECT addr_type_id 
        FROM geo_address_type 
        WHERE addr_type = 'House' LIMIT 1
    ),
    tc_id = (
        SELECT tc_id 
        FROM geo_towncity 
        WHERE tc_name = 'Redmond' LIMIT 1
    ),
    user_mod = 2,
    date_mod = NOW()
WHERE p_id = 1;

-- -------------------------------------------------------------------

UPDATE people
SET email_addr = LOWER(CONCAT(first_name, '.', last_name, 
                '@boxstore.com')
    ),
    password = MD5('StrongPassword456!'), 
    phone_pri = '204-255-1989', 
    phone_sec = '204-255-1992',  
    phone_fax = '204-255-1993',  
    addr_prefix = 'Apt 15',  
    addr = '789 Maple St',  
    addr_code = 'R2M 2Z1',  
    addr_info = NULL,  
    addr_delivery = 'Check with concierge on main level',
    addr_type_id = (
        SELECT addr_type_id 
        FROM geo_address_type 
        WHERE addr_type = 'Apartment' LIMIT 1
    ),
    tc_id = (
        SELECT tc_id 
        FROM geo_towncity 
        WHERE tc_name = 'Winnipeg' LIMIT 1
    ),
    user_mod = 2,
    date_mod = NOW()
WHERE p_id = 2;


SELECT p.p_id, p.first_name, p.last_name,
    p.email_addr, p.password, p.phone_pri, p.phone_sec, p.phone_fax,
    p.addr_prefix, p.addr, p.addr_code, p.addr_info, p.addr_delivery,
    p.addr_type_id, p.tc_id, p.user_mod, p.date_mod, p.user_act,
    p.date_act, p.active
FROM people p
WHERE p.active = 1;


-- -------------------------------------------------------------------	
SELECT 
    p.p_id, 
    p.first_name, 
    p.last_name,
    gat.addr_type,
    p.addr_prefix, 
    p.addr,
    p.addr_code,
    p.addr_info,
    p.addr_delivery,
    gtc.tc_name,
    grg.rg_name,
    gco.co_name
FROM   
    people p
    LEFT JOIN geo_address_type gat ON p.addr_type_id = gat.addr_type_id
    LEFT JOIN geo_towncity gtc ON p.tc_id = gtc.tc_id
    LEFT JOIN geo_region grg ON gtc.rg_id = grg.rg_id
    LEFT JOIN geo_country gco ON grg.co_id = gco.co_id
WHERE  
    p.active = 1
;

