CREATE DATABASE inventory_management;
USE inventory_management;

-- Products Table
CREATE TABLE products (
                          product_id INT PRIMARY KEY AUTO_INCREMENT,
                          name VARCHAR(255) NOT NULL,
                          description TEXT,
                          category VARCHAR(100),
                          current_stock INT NOT NULL,
                          min_stock_level INT,
                          unit_price DECIMAL(10,2),
                          supplier_id INT,
                          barcode VARCHAR(50) UNIQUE,
                          last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Suppliers Table
CREATE TABLE suppliers (
                           supplier_id INT PRIMARY KEY AUTO_INCREMENT,
                           name VARCHAR(255) NOT NULL,
                           contact_person VARCHAR(255),
                           email VARCHAR(255),
                           phone VARCHAR(20),
                           address TEXT,
                           created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Inventory Transactions Table
CREATE TABLE inventory_transactions (
                                        transaction_id INT PRIMARY KEY AUTO_INCREMENT,
                                        product_id INT,
                                        transaction_type ENUM('PURCHASE', 'SALE', 'ADJUSTMENT'),
                                        quantity INT NOT NULL,
                                        transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                        user_id INT,
                                        notes TEXT,
                                        FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Users Table
CREATE TABLE users (
                       user_id INT PRIMARY KEY AUTO_INCREMENT,
                       username VARCHAR(50) UNIQUE NOT NULL,
                       password VARCHAR(255) NOT NULL,
                       full_name VARCHAR(255),
                       email VARCHAR(255),
                       role ENUM('ADMIN', 'MANAGER', 'STAFF') NOT NULL,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       last_login TIMESTAMP NULL
);

-- Indexes for performance
CREATE INDEX idx_product_name ON products(name);
CREATE INDEX idx_transaction_date ON inventory_transactions(transaction_date);