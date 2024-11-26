-- ------------------------------------------------------------------
-- people meta loaded

-- populate people records WHERE p_id BETWEEN 3 AND 10002
DROP TABLE IF EXISTS z__street;
CREATE TABLE IF NOT EXISTS z__street (
    street_name VARCHAR(25) NOT NULL
);
INSERT INTO z__street VALUES('First Ave');
INSERT INTO z__street VALUES('Second Ave');
INSERT INTO z__street VALUES('Third Ave');
INSERT INTO z__street VALUES('Fourth Ave');
INSERT INTO z__street VALUES('Fifth Ave');
INSERT INTO z__street VALUES('Sixth Ave');
INSERT INTO z__street VALUES('Seventh Ave');
INSERT INTO z__street VALUES('Eighth Ave');
INSERT INTO z__street VALUES('Ninth Ave');
INSERT INTO z__street VALUES('Cedar Blvd');
INSERT INTO z__street VALUES('Elk Blvd');
INSERT INTO z__street VALUES('Hill Blvd');
INSERT INTO z__street VALUES('Lake St');
INSERT INTO z__street VALUES('Main Blvd');
INSERT INTO z__street VALUES('Maple St');
INSERT INTO z__street VALUES('Park Blvd');
INSERT INTO z__street VALUES('Pine St');
INSERT INTO z__street VALUES('Oak Blvd');
INSERT INTO z__street VALUES('View Blvd');
INSERT INTO z__street VALUES('Washington Blvd');

-- people meta load VIEW -----
DROP VIEW IF EXISTS z__people__meta_load;

CREATE VIEW IF NOT EXISTS z__people__meta_load AS (

    SELECT p.p_id
        -- , p.first_name, p.last_name
        , CONCAT(LOWER(LEFT(p.first_name,1)),LOWER(p.last_name),'@'
        , CASE WHEN RAND() < 0.25 THEN 'google.com'
               WHEN RAND() < 0.50 THEN 'outlook.com'
               WHEN RAND() < 0.75 THEN 'live.com'
               ELSE 'rocketmail.com' END) AS email_addr
        , MD5(RAND()) AS password
        , CONCAT('204-', LEFT(CONVERT(RAND()*10000000,INT),3),'-', LEFT(CONVERT(RAND()*10000000,INT),4)) AS phone_pri
        , CONCAT('204-', LEFT(CONVERT(RAND()*10000000,INT),3),'-', LEFT(CONVERT(RAND()*10000000,INT),4)) AS phone_sec
        , CONCAT('204-', LEFT(CONVERT(RAND()*10000000,INT),3),'-', LEFT(CONVERT(RAND()*10000000,INT),4)) AS phone_fax
        , NULL AS addr_prefix
        , MIN(
            CONCAT(
                 CASE WHEN RAND() < 0.25 THEN CONVERT(RAND()*100,INT)
                      WHEN RAND() < 0.50 THEN CONVERT(RAND()*1000,INT)
                      WHEN RAND() < 0.75 THEN CONVERT(RAND()*10000,INT)
                                         ELSE CONVERT(RAND()*10,INT) END+10
                 ,' ',zs.street_name)
          ) AS addr
        , CONCAT(
            SUBSTRING('ABCDEFGHIJKLMNOPQRSTUVWXYZ', rand()*26+1, 1)
                , SUBSTRING('0123456789', rand()*10+1, 1)
                , SUBSTRING('ABCDEFGHIJKLMNOPQRSTUVWXYZ', rand()*26+1, 1)
                , ' '
                , SUBSTRING('0123456789', rand()*10+1, 1)
                , SUBSTRING('ABCDEFGHIJKLMNOPQRSTUVWXYZ', rand()*26+1, 1)
                , SUBSTRING('0123456789', rand()*10+1, 1) 
          ) AS addr_code
        , NULL AS addr_info
        , NULL AS addr_delivery
        , CASE WHEN RAND() < 0.50 THEN 1 ELSE 2 END AS addr_type_id
        , 1 AS tc_id
        , 2 AS usermod
        , NOW() AS datemod
    FROM people p, z__street zs
    GROUP BY p.p_id
);
SELECT * FROM z__people__meta_load;


-- people TABLE UPDATE 10000 people records  ------------------------
UPDATE people p 
       JOIN z__people__meta_load dt ON p.p_id = dt.p_id
SET p.email_addr = dt.email_addr
  , p.password = dt.password
  , p.phone_pri = dt.phone_pri
  , p.phone_sec = dt.phone_sec
  , p.phone_fax = dt.phone_fax
  , p.addr_prefix = dt.addr_prefix
  , p.addr = dt.addr
  , p.addr_code = dt.addr_code
  , p.addr_info = dt.addr_info
  , p.addr_delivery = dt.addr_delivery
  , p.addr_type_id = dt.addr_type_id
  , p.tc_id = dt.tc_id
  , p.usermod = dt.usermod  
  , p.datemod = dt.datemod
WHERE p.p_id>=3;


-- update addr_prefix: suite number, room number, floor number
UPDATE people
SET addr_prefix=CASE WHEN RAND() < 0.33 THEN CONVERT(RAND()*100,INT)
                      WHEN RAND() < 0.67 THEN CONVERT(RAND()*1000,INT)
                                         ELSE CONVERT(RAND()*10,INT) END+10
WHERE addr_type_id IN (1,2,3) AND p_id>=3;

DROP VIEW IF EXISTS z__people__meta_load;
DROP TABLE IF EXISTS z__street;

-- end populate people 3 to 10002
-- ------------------------------------------------------------------