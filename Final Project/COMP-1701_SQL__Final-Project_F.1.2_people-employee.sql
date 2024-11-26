-- Add Below ENVELOPE query --

-- Table: people_employee -------------------------------------------
DROP TABLE IF EXISTS people_employee;
CREATE TABLE IF NOT EXISTS people_employee ( 
    pe_id       SMALLINT UNSIGNED AUTO_INCREMENT 
    , p_id      MEDIUMINT UNSIGNED NOT NULL -- FK
    , p_id_mgr  MEDIUMINT UNSIGNED -- FK
    , pe_employee_id CHAR(10)
    , pe_hired  DATETIME 
    , pe_salary DECIMAL(7,2) 
    , usermod   MEDIUMINT NOT NULL DEFAULT 2 
    , datemod   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP 
    , active    BIT NOT NULL DEFAULT 1 
    , PRIMARY KEY(pe_id)
);

TRUNCATE TABLE people_employee;
INSERT INTO people_employee 
       (p_id, p_id_mgr, pe_employee_id, pe_hired, pe_salary)            
VALUES (1, NULL, 'A11000010', '2022-02-15', 9900.00)
      ,(2, 1,    'B21000011', '2024-01-02', 3300.00)
      ,(3, 2,    'B21000020', '2024-03-17', 2200.00)
      ,(4, 2,    'B21000032', '2024-03-17', 2200.00)
      ,(5, 2,    'B21000042', '2024-03-17', 2200.00)
      ,(6, 2,    'B21000052', '2024-03-17', 2200.00)
      ,(7, 2,    'B21000062', '2024-03-17', 2200.00)
      ,(8, 2,    'B21000072', '2024-03-17', 2200.00)
      ,(9, 2,    'B21000082', '2024-03-17', 2200.00)
;

SELECT pe.p_id_mgr, pe.pe_id, pe.p_id, pe.pe_employee_id
	 , pe.pe_hired, pe.pe_salary
     , pe.usermod, pe.datemod, pe.active
FROM people_employee pe;


-- employee join and manager
SELECT pe.pe_id
     , pe.p_id, e.p_id, e.first_name, e.last_name 
     , pe.p_id_mgr, m.p_id, m.first_name, m.last_name
     , pe.pe_hired, pe.pe_salary
FROM   people_employee pe 
       JOIN people e ON pe.p_id=e.p_id
       LEFT JOIN people m ON pe.p_id_mgr=m.p_id 
WHERE  e.active=1 OR m.active=1;


