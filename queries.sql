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

-- ==========================================
-- INNER JOIN
-- ==========================================

-- Display orders with customer names
SELECT
    orders.order_id,
    customers.name,
    orders.order_date
FROM orders
INNER JOIN customers
    ON orders.customer_id = customers.customer_id;

-- Display products ordered with quantity
SELECT
    order_items.order_id,
    products.name,
    order_items.quantity
FROM order_items
INNER JOIN products
    ON order_items.product_id = products.product_id;

-- ==========================================
-- LEFT JOIN
-- ==========================================

-- Display all customers and their orders
SELECT
    customers.customer_id,
    customers.name,
    orders.order_id,
    orders.order_date
FROM customers
LEFT JOIN orders
    ON customers.customer_id = orders.customer_id;

-- ==========================================
-- MULTI-TABLE JOIN
-- ==========================================

-- Complete order details
SELECT
    orders.order_id,
    customers.name AS customer_name,
    products.name AS product_name,
    order_items.quantity,
    products.price
FROM orders
JOIN customers
    ON orders.customer_id = customers.customer_id
JOIN order_items
    ON orders.order_id = order_items.order_id
JOIN products
    ON order_items.product_id = products.product_id;


-- ==========================================
-- SUBQUERY
-- ==========================================

-- Customers whose spending is above average
SELECT
    customer_id,
    SUM(order_items.quantity * products.price) AS total_spent
FROM orders
JOIN order_items
    ON orders.order_id = order_items.order_id
JOIN products
    ON order_items.product_id = products.product_id
GROUP BY customer_id
HAVING SUM(order_items.quantity * products.price) >
(
    SELECT
        AVG(customer_total)
    FROM
    (
        SELECT
            customer_id,
            SUM(order_items.quantity * products.price) AS customer_total
        FROM orders
        JOIN order_items
            ON orders.order_id = order_items.order_id
        JOIN products
            ON order_items.product_id = products.product_id
        GROUP BY customer_id
    ) AS spending
);

-- ==========================================
-- CASE STATEMENT
-- ==========================================

-- Categorize customers based on spending
SELECT
    orders.customer_id,

    SUM(order_items.quantity * products.price) AS total_spent,

    CASE
        WHEN SUM(order_items.quantity * products.price) > 50000
            THEN 'High Spender'

        WHEN SUM(order_items.quantity * products.price) > 10000
            THEN 'Medium Spender'

        ELSE 'Low Spender'
    END AS customer_type

FROM orders

JOIN order_items
    ON orders.order_id = order_items.order_id

JOIN products
    ON order_items.product_id = products.product_id

GROUP BY orders.customer_id;