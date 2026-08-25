-- ==========================================
-- QuickMart SQL Project
-- Database Schema
-- ==========================================

-- Create Database
CREATE DATABASE quickmart;

-- Select Database
USE quickmart;

-- ==========================================
-- Customers Table
-- ==========================================

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(100),
    signup_date DATE
);

-- ==========================================
-- Products Table
-- ==========================================

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(100),
    price DECIMAL(10,2)
);

-- ==========================================
-- Orders Table
-- ==========================================

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);


-- ==========================================
-- Order Items Table
-- ==========================================


CREATE TABLE order_items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);
