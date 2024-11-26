-- -------------------------------------------------------------------
-- Table: item_type (it) - PLACE TABLES/DATA after Manufacturer

DROP TABLE IF EXISTS item_type;
CREATE TABLE IF NOT EXISTS item_type (
      it_id        TINYINT UNSIGNED AUTO_INCREMENT 
    , it_desc      VARCHAR(50) NOT NULL
    , active       BIT NOT NULL DEFAULT 1
    , CONSTRAINT item_type_PK PRIMARY KEY (it_id)
    , CONSTRAINT item_type_UK UNIQUE      (it_desc)
);

TRUNCATE TABLE item_type;
INSERT INTO item_type (it_id, it_desc)
VALUES                (1,'4KTV - 55" & Down')
                    , (2,'4KTV - 60" - 69"')
                    , (3,'8KTV - 70" & Up')
                    , (4,'Blenders')
                    , (5,'Coffee & Tea')
                    , (6,'Dryers')
                    , (7,'Smartphones')
                    , (8,'Tablets')
                    , (9,'Washers')
;

SELECT it.it_id, it.it_desc
FROM   item_type it
WHERE  it.active=1;







-- -------------------------------------------------------------------
-- Table: item (i)
DROP TABLE IF EXISTS item;
CREATE TABLE IF NOT EXISTS item (
      item_id       INT UNSIGNED AUTO_INCREMENT 
    , man_id        SMALLINT UNSIGNED NOT NULL            -- FK
    , item_name     VARCHAR(45) NOT NULL
    , item_modelno  VARCHAR(20)
    , item_barcode  CHAR(12)
    , it_id         TINYINT UNSIGNED NOT NULL            -- FK
    , item_price    NUMERIC(7,2)            -- current_price
    , usermod       MEDIUMINT NOT NULL DEFAULT 2  -- FK
    , datemod       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    , useract       MEDIUMINT NOT NULL DEFAULT 2  -- FK
    , dateact       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    , active        BIT NOT NULL DEFAULT 1
    , CONSTRAINT item_PK PRIMARY KEY (item_id)
    , CONSTRAINT item_UK_man_item_model UNIQUE (man_id ASC, item_name ASC, item_modelno)
);

TRUNCATE TABLE item;
INSERT INTO item 
       (item_id, man_id, item_name, item_modelno, item_barcode, it_id, item_price)
VALUES (1, 2,  'Actually a Flipper', '4DAI0200002260', '000000002260', 7, 264.74)
     , (2, 2,  'Actually a Flipper 2', '7BOC0200002293', '000000002293', 7, 207.79)
     , (3, 2,  'Mini Tablet', '4DAI0200002123', '000000002123', 8, 424.58)
     , (4, 2,  'Tiny Tablet', '4DAI0200002136', '000000002136', 8, 374.63)
     , (5, 1,  'Barista Express', '1GQD0200001006', '000000001006', 5, 100.00)
     , (6, 1,  'Barista Express II', '1GQD0200001012', '000000001012', 5, 133.17)
     , (7, 1,  'Super Tablet', '1GQD0200008335', '000000008335', 8, 1435.00)
     , (8, 1,  'Super Tablet 1TB', '3ADA0100008360', '000000008360', 8, 2000.00)
     , (9, 4,  '20 ounce Blender', '3SKY0111164009', '000011164009', 4, 69.53)
     , (10, 4, '40 ounce Blender ', '3SKY0142542001', '000042542001', 4, 89.41)
     , (11, 4, '65" HDTV', '3FPT0100051281', '000000051281', 2, 6665.33)
     , (12, 4, '60" HDTV', '3DET0100051281', '000000051287', 2, 6065.33)
     , (13, 4, 'Mini Tablet', '3OCE0108211010', '000008211010', 8, 499.50)
     , (14, 4, 'Really Smartphone', '3TEC0350864001', '000050864001', 7, 1090.91)
     , (15, 5, '20 ounce Blender', '4MAR0120815001', '000020815001', 4, 54.35)
     , (16, 5, 'Actually a Flipper', '4HEL0140184001', '000040184001', 7, 226.07)
     , (17, 5, 'Barista Express', '4HEL0140182001', '000040182001', 5, 172.63)
     , (18, 5, 'Dryer', '7HYU0200008359', '000000008359', 6, 710.00)
     , (19, 5, 'Mini Tablet', '4HEL0105850009', '000005850009', 8, 448.25)
     , (20, 5, 'Really Smartphone', '7HAN0200013563', '000000013563', 7, 1170.00)
     , (21, 5, 'Super Tablet', '7HYU0200041406', '000000041406', 8, 1500.00)
     , (22, 8, '20 ounce Blender', '2SUR1108413009', '000008413009', 4, 50.75)
     , (23, 8, 'Barista Express', '2SUR1103820009', '000003820009', 5, 104.50)
     , (24, 8, 'Really Smartphone', '2SUR1101100321', '000001100321', 7, 1272.00)
     , (25, 8, 'Super Tablet', '2SUR1100008294', '000000008294', 8, 1414.11)
     , (26, 9, 'Mini Tablet', '2SUR1100002136', '000000002136', 8, 374.63)
     , (27, 9, 'Not-as Smartphone', '2SUR1100002124', '000000002124', 7, 358.74)
     , (28, 9, 'Really Smartphone', '2SUR1100041398', '000000041398', 7, 1200.00)
     , (29, 9, 'Super Tablet', '2SUR1100008335', '000000008335', 8, 1435.00)
     , (30, 9, 'Super Tablet X', '2SUR1100011577', '000000011577', 8, 1842.00)
     , (31, 10,'55" HDTV', '2BRE1000066014', '000000056014', 1, 2605.00)
     , (32, 10,'50" HDTV', '2BRE1000056014', '000000066001', 1, 2100.00)
     , (33, 10,'Not-as Smartphone', '2BRE1200002124', '000000002124', 7, 358.74)
     , (34, 10,'Really Smartphone', '2BRE0100008427', '000000008427', 7, 1010.00)
     , (35, 10,'Really Smartphone X', '2BRE0600013628', '000000013628', 7, 1350.00)
     , (36, 10,'Super Tablet', '2SUR1100041491', '000000041491', 8, 1991.00)
     , (37, 7, 'Barista Express', '7SPP0105618009', '000005618009', 5, 199.80)
     , (38, 7, 'Not-as Smartphone', '7SPP0120983041', '000020983041', 7, 332.97)
     , (39, 7, 'Super Tablet', '7SPP0100041406', '000000041406', 8, 1500.00)
     , (40, 3, 'Barista Express', '3BRI0300001012', '000000001012', 5, 133.17)
     , (41, 3, 'Mini Tablet', '3BRI0400002136', '000000002136', 8, 374.63)
     , (42, 3, 'Really Smartphone', '7DAE0400012490', '000000012490', 7, 1250.00)
     , (43, 3, 'Super Tablet', '7DAE0400008335', '000000008335', 8, 1435.00)
     , (44, 3, 'Washer', '3BRI3505804084', '000005804084', 9, 504.69)
     , (45, 3, 'Washer X', '3BRI3505805085', '000005805085', 9, 553.95)
     , (46, 6, '50" HDTV', '6PRI0299999203', '000099999203', 1, 2100.00)
     , (47, 6, '75" HDTV', '6PRI0299999197', '000099999197', 3, 20013.33)
     , (48, 6, 'Super Tablet', '7SMS0100041406', '000000008355', 8, 1500.00)
;

SELECT i.item_id, i.item_name, i.item_modelno, i.item_barcode, i.item_price
     , i.man_id, i.it_id
     , i.usermod, i.datemod, i.useract, i.dateact, i.active
FROM   item i
WHERE  i.active=1;






-- -------------------------------------------------------------------
-- Table: item_inventory
DROP TABLE IF EXISTS item_inventory;
CREATE TABLE IF NOT EXISTS item_inventory (
      ii_id       BIGINT AUTO_INCREMENT
    , item_id     INT                       -- FK
    , ii_serialno CHAR(6)
    , oi_id       BIGINT NULL
    , usermod     MEDIUMINT NOT NULL DEFAULT 2  -- FK
    , datemod     DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    , useract     MEDIUMINT NOT NULL DEFAULT 2  -- FK
    , dateact     DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    , active      BIT NOT NULL DEFAULT 1

    , CONSTRAINT ii_PK PRIMARY KEY (ii_id)
);
      
TRUNCATE TABLE item_inventory;
INSERT INTO item_inventory (ii_id, item_id, ii_serialno, oi_id)
VALUES (1,5,'1GQD04',1)
     , (2,15,'G36954',2)
     , (3,15,'G36955',2)
     , (4,32,'2BRE12',4)
     , (5,32,'2BRE13',4)
     , (6,6,'1GQD10',6)
     , (7,6,'1GQD11',7)
     , (8,21,'G36976',8)
     , (9,21,'G36977',8)
     , (10,37,'7SPP01',10)
     , (11,37,'7SPP02',10)
     , (12,38,'7SPP05',12)
     , (13,38,'7SPP06',12)
     , (14,38,'7SPP07',12)
     , (15,38,'7SPP08',12)
     , (16,34,'2BRE20',16)
     , (17,34,'2BRE21',17)
     , (18,44,'3BRI13',18)
     , (19,44,'3BRI14',18)
     , (20,34,'2BRE22',20)
     , (21,34,'2BRE23',20)
     , (22,22,'2SUR11',22)
     , (23,22,'2SUR12',22)
     , (24,23,'2SUR13',24)
     , (25,23,'2SUR14',24)
     , (26,23,'2SUR15',24)
     , (27,23,'2SUR16',24)
     , (28,23,'2SUR17',24)
     , (29,23,'2SUR18',24)
     , (30,23,'2SUR19',24)
     , (31,23,'2SUR20',24)
     , (32,23,'2SUR21',24)
     , (33,23,'2SUR22',24)
     , (34,23,'2SUR23',24)
     , (35,23,'2SUR24',24)
     , (36,23,'2SUR25',24)
     , (37,23,'2SUR26',24)
     , (38,28,'ESUR29',38)
     , (39,24,'2SUR31',39)
     , (40,9,'3SKY01',40)
     , (41,9,'3SKY02',40)
     , (42,10,'3SKY03',42)
     , (43,10,'3SKY04',42)
     , (44,7,'1GQD12',44)
     , (45,7,'1GQD13',44)
     , (46,42,'3BRI09',46)
     , (47,42,'3BRI10',46)
     , (48,14,'3SKY13',48)
     , (49,18,'G36964',49)
     , (50,20,'G36975',50)
     , (51,45,'3BRI15',51)
     , (52,48,'4SOD15',52)
     , (53,16,'G36958',53)
     , (54,16,'G36959',53)
     , (55,16,'G36960',53)
     , (56,17,'G36961',56)
     , (57,19,'G36972',57)
     , (58,19,'G36973',57)
     , (59,30,'ESUR33',59)
     , (60,30,'ESUR34',59)
     , (61,36,'2BRE34',61)
     , (62,36,'2BRE35',61)
     , (63,31,'2BRE10',63)
     , (64,31,'2BRE11',63)
     , (65,35,'2BRE24',65)
     , (66,35,'2BRE25',66)
     , (67,29,'ESUR31',67)
     , (68,29,'ESUR32',67)
     , (69,33,'2BRE18',69)
     , (70,33,'2BRE19',69)
     , (71,8,'1GQD14',71)
     , (72,8,'1GQD15',71)
     , (73,8,'1GQD16',71)
     , (74,8,'1GQD17',71)
     , (75,11,'3SKY05',75)
     , (76,11,'3SKY07',75)
     , (77,12,'3SKY09',75)
     , (78,26,'ESUR13',78)
     , (79,26,'ESUR14',78)
     , (80,26,'ESUR17',78)
     , (81,26,'ESUR18',78)
     , (82,26,'ESUR21',78)
     , (83,26,'ESUR22',78)
     , (84,13,'3SKYX1',84)
     , (85,13,'3SKY11',84)
     , (86,13,'3SKY12',84)
     , (87,26,'ESUR15',87)
     , (88,26,'ESUR16',87)
     , (89,26,'ESUR19',87)
     , (90,28,'ESUR27',90)
     , (91,28,'ESUR28',90)
     , (92,43,'3BRI11',92)
     , (93,43,'3BRI12',93)
     , (94,27,'ESUR25',94)
     , (95,27,'ESUR26',94)
     , (96,18,'G36966',96)
     , (97,18,'G36967',97)
     , (98,48,'4SOD17',98)
     , (99,48,'4SOD18',98)
     , (100,18,'G36968',100)
     , (101,39,'7SPP09',101)
     , (102,39,'7SPP10',101)
     , (103,25,'2SUR36',103)
     , (104,40,'3BRI03',104)
     , (105,35,'2BRE27',105)
     , (106,46,'4SOD03',106)
     , (107,46,'4SOD04',106)
     , (108,47,'4SOD05',108)
     , (109,47,'4SOD06',108)
     , (110,47,'4SOD07',108)
     , (111,47,'4SOD08',108)
     , (112,1,'4DAI02',112)
     , (113,1,'4DAI03',112)
     , (114,41,'3BRI05',114)
     , (115,4,'4DAI10',115)
     , (116,3,'4DAI08',116)
     , (117,2,'4DAI04',117)
     , (118,2,'4DAI05',117)
     , (119,2,'4DAI06',117)
     , (120,2,'4DAI07',117)
;

SELECT ii.ii_id, ii.item_id, ii.ii_serialno, ii.oi_id
     , ii.usermod, ii.datemod, ii.active
FROM item_inventory ii;



-- -------------------------------------------------------------------
-- Table: item_price (ip)

DROP TABLE IF EXISTS item_price;
CREATE TABLE IF NOT EXISTS item_price (
      ip_id         BIGINT UNSIGNED AUTO_INCREMENT
    , item_id       INT                          -- FK
    , item_price    NUMERIC(7,2) 
    , ip_beg        DATETIME NULL
    , ip_end        DATETIME NULL
    , usermod       MEDIUMINT NOT NULL DEFAULT 2  -- FK
    , datemod       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    , useract       MEDIUMINT NOT NULL DEFAULT 2  -- FK
    , dateact       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    , active        BIT NOT NULL DEFAULT 1
    , PRIMARY KEY (ip_id)
);
      
TRUNCATE TABLE item_price;
INSERT INTO item_price 
       (ip_id, item_id, item_price, ip_beg, ip_end)
VALUES (1,1,264.74,'2021-05-18 00:00:00',NULL)
     , (2,2,207.79,'2021-05-18 00:00:00',NULL)
     , (3,3,424.58,'2021-05-18 00:00:00',NULL)
     , (4,4,374.63,'2021-05-18 00:00:00',NULL)
     , (5,5,100.00,'2021-01-13 00:00:00',NULL)
     , (6,6,133.17,'2021-01-13 00:00:00',NULL)
     , (7,7,1435.00,'2021-01-18 00:00:00',NULL)
     , (8,8,2000.00,'2021-02-24 00:00:00',NULL)
     , (9,9,69.53,'2021-01-18 00:00:00',NULL)
     , (10,10,89.41,'2021-01-18 00:00:00',NULL)
     , (11,11,6665.33,'2021-02-17 00:00:00',NULL)
     , (12,12,6065.33,'2021-02-17 00:00:00',NULL)
     , (13,13,499.50,'2021-02-26 00:00:00',NULL)
     , (14,14,1090.91,'2021-01-18 00:00:00',NULL)
     , (15,15,54.35,'2021-01-13 00:00:00',NULL)
     , (16,16,226.07,'2021-01-18 00:00:00',NULL)
     , (17,17,172.63,'2021-01-18 00:00:00',NULL)
     , (18,18,710.00,'2021-01-18 00:00:00',NULL)
     , (19,19,448.25,'2021-01-18 00:00:00',NULL)
     , (20,20,1170.00,'2021-01-18 00:00:00',NULL)
     , (21,21,1500.00,'2021-01-14 00:00:00',NULL)
     , (22,22,50.75,'2021-01-18 00:00:00',NULL)
     , (23,23,104.50,'2021-01-18 00:00:00',NULL)
     , (24,24,1272.00,'2021-01-18 00:00:00',NULL)
     , (25,25,1414.11,'2021-04-27 00:00:00',NULL)
     , (26,26,374.63,'2021-02-26 00:00:00',NULL)
     , (27,27,358.74,'2021-03-08 00:00:00',NULL)
     , (28,28,1040.00,'2021-01-18 00:00:00','2021-02-25 23:59:59')
     , (29,28,1200.00,'2021-02-26 00:00:00',NULL)
     , (30,29,1435.00,'2021-01-19 00:00:00',NULL)
     , (31,30,1842.00,'2021-01-18 00:00:00',NULL)
     , (32,31,2605.00,'2021-01-18 00:00:00',NULL)
     , (33,32,2100.00,'2021-01-13 00:00:00',NULL)
     , (34,33,358.74,'2021-02-24 00:00:00',NULL)
     , (35,34,1010.00,'2021-01-14 00:00:00',NULL)
     , (36,35,1350.00,'2021-01-18 00:00:00',NULL)
     , (37,36,1991.00,'2021-01-18 00:00:00',NULL)
     , (38,37,199.80,'2021-01-14 00:00:00',NULL)
     , (39,38,332.97,'2021-01-14 00:00:00',NULL)
     , (40,39,1500.00,'2021-03-04 00:00:00',NULL)
     , (41,40,133.17,'2021-04-28 00:00:00',NULL)
     , (42,41,374.63,'2021-05-18 00:00:00',NULL)
     , (43,42,1250.00,'2021-01-18 00:00:00',NULL)
     , (44,43,1435.00,'2021-02-26 00:00:00',NULL)
     , (45,44,504.69,'2021-01-14 00:00:00',NULL)
     , (46,45,553.95,'2021-01-18 00:00:00',NULL)
     , (47,46,2100.00,'2021-05-18 00:00:00',NULL)
     , (48,47,20013.33,'2021-05-18 00:00:00',NULL)
     , (49,48,1435.00,'2021-01-18 00:00:00','2021-03-03 23:59:59')
     , (50,48,1500.00,'2021-03-04 00:00:00',NULL)        
;
SELECT ip.ip_id, ip.item_id, ip.item_price, ip.ip_beg, ip.ip_end
     , ip.usermod, ip.datemod, ip.useract, ip.dateact, ip.active
FROM   item_price ip;





-- -------------------------------------------------------------------
-- Table: taxes (t)
DROP TABLE IF EXISTS taxes;
CREATE TABLE IF NOT EXISTS taxes (
      tax_id   TINYINT UNSIGNED AUTO_INCREMENT
    , tax_type CHAR(3)
    , tax_beg  DATE
    , tax_end  DATE
    , tax_perc NUMERIC(4,2)
    , usermod  MEDIUMINT NOT NULL DEFAULT 2  -- FK
    , datemod  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    , useract  MEDIUMINT NOT NULL DEFAULT 2  -- FK
    , dateact  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    , active   BIT NOT NULL DEFAULT 1
    , PRIMARY KEY (tax_id)
);

TRUNCATE TABLE taxes;
-- bulk insert
INSERT INTO taxes (tax_type, tax_beg, tax_end, tax_perc)  
VALUES            ('PST', '1987-07-01', '2013-06-30', 7.00)
                , ('GST', '1991-01-01', '1997-03-31', 7.00)
                , ('GST', '1997-04-01', '2007-12-31', 6.00)
                , ('GST', '2008-01-01', NULL, 5.00)
                , ('PST', '2013-07-01', '2018-06-30', 8.00)
                , ('PST', '2019-07-01', NULL, 7.00);
        
SELECT t.tax_id, t.tax_type, t.tax_beg, t.tax_end, t.tax_perc
     , t.usermod, t.datemod, t.active
FROM taxes t;



-- -------------------------------------------------------------------
-- Table: orders (o)
DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders (
      order_id      INT UNSIGNED AUTO_INCREMENT     
    , order_no      VARCHAR(8) NOT NULL    UNIQUE
    , order_date    DATETIME 
    , p_id_cus      MEDIUMINT
    , p_id_emp      MEDIUMINT NOT NULL      -- FK
    , o_override    NUMERIC(8,2) NOT NULL DEFAULT 0.00
    , usermod       MEDIUMINT NOT NULL DEFAULT 2  -- FK
    , datemod       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    , useract       MEDIUMINT NOT NULL DEFAULT 2  -- FK
    , dateact       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    , active        BIT NOT NULL DEFAULT 1
    , CONSTRAINT orders_PK PRIMARY KEY (order_id)
    , CONSTRAINT orders_UK UNIQUE (order_date, p_id_cus)
    , CONSTRAINT orders_p_cust_FK FOREIGN KEY (p_id_cus) REFERENCES people(p_id)
    , CONSTRAINT orders_p_emp_FK FOREIGN KEY (p_id_emp) REFERENCES people(p_id)
);

TRUNCATE TABLE orders;
INSERT INTO orders 
       (order_id, order_no, order_date, p_id_cus, p_id_emp)
VALUES (1 ,'00001003','2021-01-13 13:01:13',100 ,2)
     , (2 ,'00001021','2021-01-13 13:01:14',200 ,2)
     , (3 ,'00001026','2021-01-13 13:01:15',300 ,2)
     , (4 ,'00001030','2021-01-13 13:01:16',400 ,2)
     , (5 ,'00001031','2021-01-14 14:01:01',500 ,2)
     , (6 ,'00001033','2021-01-14 14:01:02',600 ,2)
     , (7 ,'00001034','2021-01-14 14:01:03',700 ,2)
     , (8 ,'00001036','2021-01-18 18:01:00',800 ,2)
     , (9 ,'00001040','2021-01-18 18:01:01',900 ,2)
     , (10,'00001042','2021-01-18 18:01:02',1000,2)
     , (11,'00001043','2021-01-18 18:01:03',1100,2)
     , (12,'00001044','2021-01-18 18:01:04',1200,2)
     , (13,'00001046','2021-01-18 18:01:05',1300,2)
     , (14,'00001048','2021-01-18 18:01:06',1400,2)
     , (15,'00001049','2021-01-18 18:01:07',1500,2)
     , (16,'00001051','2021-01-18 18:01:08',1600,2)
     , (17,'00001052','2021-01-18 18:01:09',1700,2)
     , (18,'00001054','2021-01-18 18:01:10',1800,2)
     , (19,'00001056','2021-01-18 18:01:11',1900,2)
     , (20,'00001057','2021-01-18 18:01:12',2000,2)
     , (21,'00001058','2021-01-18 18:01:13',2100,2)
     , (22,'00001064','2021-01-19 19:01:01',2200,2)
     , (23,'00001089','2021-02-24 22:02:01',2300,2)
     , (24,'00001090','2021-02-24 22:02:02',2400,2)
     , (25,'00001091','2021-02-17 17:02:01',2500,2)
     , (26,'00001102','2021-02-26 21:02:01',2600,2)
     , (27,'00001105','2021-02-26 21:02:02',2700,2)
     , (28,'00001107','2021-03-05 05:03:01',2800,2)
     , (29,'00001111','2021-02-26 21:02:03',2900,2)
     , (30,'00001114','2021-03-08 08:03:01',3000,2)
     , (31,'00001117','2021-03-04 04:03:01',3100,2)
     , (32,'00001119','2021-03-04 04:03:02',3200,2)
     , (33,'00001150','2021-04-27 20:04:01',3300,2)
     , (34,'00001151','2021-04-28 20:04:01',3400,2)
     , (35,'00001157','2021-05-17 17:05:01',3500,2)
     , (36,'00001160','2021-05-18 18:05:01',3600,2)
     , (37,'00001168','2021-05-18 18:05:02',3700,2)
     , (38,'00001169','2021-05-18 18:05:03',3800,2)
     , (39,'00001170','2021-05-18 18:05:04',3900,2)
     , (40,'00001171','2021-05-18 18:05:05',4000,2)
     , (41,'00001173','2021-05-18 18:05:06',4100,2);
                                   
SELECT o.order_id, o.order_no, o.order_date, o.p_id_cus, o.p_id_emp
     , o.usermod, o.datemod, o.active
FROM orders o;





-- -------------------------------------------------------------------
-- Table: orders (o)

DROP TABLE IF EXISTS orders__item;
CREATE TABLE IF NOT EXISTS orders__item (
      oi_id         BIGINT UNSIGNED AUTO_INCREMENT
    , order_id      INT -- FK
    , item_id       INT -- FK
    , oi_qty        SMALLINT                       
    , ip_override   NUMERIC(7,2) NOT NULL DEFAULT 0.00               
    , usermod       MEDIUMINT NOT NULL DEFAULT 2  -- FK
    , datemod       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    , useract       MEDIUMINT NOT NULL DEFAULT 2  -- FK
    , dateact       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    , active        BIT NOT NULL DEFAULT 1
    , PRIMARY KEY (oi_id)
    , CONSTRAINT oi_UK UNIQUE (order_id, item_id, oi_qty)
);

TRUNCATE TABLE orders__item;
INSERT INTO orders__item  (oi_id, order_id, item_id, oi_qty)  
VALUES (1,1,5,1)
     , (2,2,15,2)
     , (4,3,32,2)
     , (6,4,6,-1)
     , (7,4,6,1)
     , (8,5,21,2)
     , (10,5,37,2)
     , (12,5,38,4)
     , (16,6,34,-1)
     , (17,6,34,1)
     , (18,7,44,2)
     , (20,8,34,2)
     , (22,9,22,2)
     , (24,9,23,14)
     , (38,10,28,1)
     , (39,11,24,1)
     , (40,12,9,2)
     , (42,12,10,2)
     , (44,13,7,2)
     , (46,13,42,2)
     , (48,14,14,1)
     , (49,15,18,1)
     , (50,15,20,1)
     , (51,16,45,1)
     , (52,17,48,1)
     , (53,18,16,3)
     , (56,18,17,1)
     , (57,18,19,2)
     , (59,19,30,2)
     , (61,19,36,2)
     , (63,20,31,2)
     , (65,21,35,1)
     , (66,21,35,-1)
     , (67,22,29,-2)
     , (69,23,33,-2)
     , (71,24,8,4)
     , (75,25,11,3)
     , (76,25,12,3)
     , (78,26,26,6)
     , (84,27,13,3)
     , (87,28,26,3)
     , (90,29,28,2)
     , (92,29,43,-1)
     , (93,29,43,1)
     , (94,30,27,2)
     , (96,31,18,-1)
     , (97,31,18,1)
     , (98,31,48,2)
     , (100,32,18,1)
     , (101,32,39,2)
     , (103,33,25,1)
     , (104,34,40,1)
     , (105,35,35,1)
     , (106,36,46,2)
     , (108,36,47,4)
     , (112,37,1,2)
     , (114,38,41,1)
     , (115,39,4,1)
     , (116,40,3,1)
     , (117,41,2,4)
;

SELECT oi.oi_id, oi.order_id, oi.item_id, oi.oi_qty
     , oi.usermod, oi.datemod, oi.active
FROM orders__item oi;



