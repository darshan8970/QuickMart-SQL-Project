-- ==========================================
-- QuickMart SQL Project
-- SQL Queries
-- ==========================================

USE quickmart;

-- ==========================================
-- BASIC SELECT QUERIES
-- ==========================================

-- Display all customers
SELECT *
FROM customers;

-- Display all products
SELECT *
FROM products;

-- Display all orders
SELECT *
FROM orders;

-- Display all order items
SELECT *
FROM order_items;

-- ==========================================
-- WHERE Clause
-- ==========================================

-- Customers from Bengaluru
SELECT *
FROM customers
WHERE city = 'Bengaluru';

-- Products with price greater than 1000
SELECT *
FROM products
WHERE price > 1000;

-- Orders after July 1
SELECT *
FROM orders
WHERE order_date >= '2025-07-01';

-- ==========================================
-- ORDER BY
-- ==========================================

-- Products sorted by price (High to Low)
SELECT *
FROM products
ORDER BY price DESC;

-- Customers sorted alphabetically
SELECT *
FROM customers
ORDER BY name;

-- ==========================================
-- LIMIT
-- ==========================================

-- Top 5 most expensive products
SELECT *
FROM products
ORDER BY price DESC
LIMIT 5;

