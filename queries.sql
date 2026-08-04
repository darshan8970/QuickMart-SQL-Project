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

-- ==========================================
-- AGGREGATE FUNCTIONS
-- ==========================================

-- Total number of customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- Total number of products
SELECT COUNT(*) AS total_products
FROM products;

-- Average product price
SELECT AVG(price) AS average_price
FROM products;

-- Most expensive product
SELECT MAX(price) AS highest_price
FROM products;

-- Cheapest product
SELECT MIN(price) AS lowest_price
FROM products;

-- Total value of all products
SELECT SUM(price) AS total_product_value
FROM products;

-- ==========================================
-- GROUP BY
-- ==========================================

-- Number of customers in each city
SELECT
    city,
    COUNT(*) AS total_customers
FROM customers
GROUP BY city;

-- Total sales for each order
SELECT
    order_items.order_id,
    SUM(order_items.quantity * products.price) AS total_order_value
FROM order_items
JOIN products
    ON order_items.product_id = products.product_id
GROUP BY order_items.order_id
ORDER BY total_order_value DESC;

-- ==========================================
-- HAVING
-- ==========================================

-- Orders having value greater than 5000
SELECT
    order_items.order_id,
    SUM(order_items.quantity * products.price) AS total_order_value
FROM order_items
JOIN products
    ON order_items.product_id = products.product_id
GROUP BY order_items.order_id
HAVING SUM(order_items.quantity * products.price) > 5000;