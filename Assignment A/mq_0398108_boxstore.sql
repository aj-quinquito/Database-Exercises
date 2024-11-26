/*
** Name: Mariah Anjannelle Quinquito
** Assignment: SQL Competency A
** Date: '2024-01-04 09:30:03'
** History: '2024-01-04 09:30:03'
** 			Creating Personal Information database
**/

-- Create database & charset/collate
USE sys;


DROP DATABASE IF EXISTS mq_0398108_boxstore;
CREATE DATABASE IF NOT EXISTS mq_0398108_boxstore
CHARSET='utf8mb4'
COLLATE='utf8mb4_unicode_ci';

-- Selecting created database
USE mq_0398108_boxstore;

-- Selecting the DATABASE
SELECT DATABASE();
