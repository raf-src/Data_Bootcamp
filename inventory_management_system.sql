/*
PROJECT: Inventory Management System
DESCRIPTION: This script defines the database schema and core queries 
             for tracking product stock levels and supplier relations. 
TABLES: products, categories, suppliers, inventory
*/

-- creating clothes database
CREATE DATABASE clothes;
GO
-- find the right database first 
USE clothes;
GO

-- create size, country and clothes table
CREATE TABLE size_table (
    item_size       NVARCHAR(3),
    size_name       NVARCHAR(20),
    CONSTRAINT pk_sizetable PRIMARY KEY(item_size)
);

CREATE TABLE country_table (
    manufacture_id      NVARCHAR(3),
    manufacture_country NVARCHAR(20),
    CONSTRAINT pk_country_table PRIMARY KEY (manufacture_id)
);

CREATE TABLE clothes_items (
    item_id         NVARCHAR(3),
    item_name       NVARCHAR(20),
    item_size       NVARCHAR(3),
    manufacture_id  NVARCHAR(3),
    CONSTRAINT pk_clothes_items     PRIMARY KEY (item_id),
    CONSTRAINT fk_size_table        FOREIGN KEY (item_size) REFERENCES size_table (item_size),
    CONSTRAINT fk_country_table     FOREIGN KEY (manufacture_id) REFERENCES country_table (manufacture_id)
);

-- inserting data into the tables
INSERT INTO size_table (item_size, size_name)
VALUES ('XS', 'Extra Small'), ('S', 'Small'), ('M', 'Medium'), ('L', 'Large'), ('XL', 'Extra Large');

INSERT INTO country_table (manufacture_id, manufacture_country)
VALUES ('001', 'England'), ('002', 'Scotland'), ('003', 'Wales');

INSERT INTO clothes_items (item_id, item_name, item_size, manufacture_id)
VALUES
    ('01', 'Hat', 'S', '001'),
    ('02', 'Scarf', 'M', '002'),
    ('03', 'Gloves', 'L', '003'),
    ('04', 'Sunglasses', 'M','002'),
    ('05', 'Socks', 'S', '001');

-- query to check tables and data
SELECT * FROM clothes_items;

-- Find only the items that are Small ('S')

SELECT item_name, item_size
FROM clothes_items
WHERE item_size = 'S'

-- Find the full size names for Small or Medium items

SELECT size_name
FROM size_table
WHERE item_size IN ('S','M')

-- Find all items made by Manufacturer '001' (England)

SELECT *
FROM clothes_items
WHERE manufacture_id = '001'

-- Find items that start with the letter 'S'

SELECT item_name
FROM clothes_items
WHERE item_name LIKE 'S%'

-- View all items sorted alphabetically (Z to A)

SELECT *
FROM clothes_items
ORDER BY item_name DESC