-- Suppliers table
CREATE TABLE suppliers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE
);

-- Products table  
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    supplier_id INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Purchases table
CREATE TABLE purchases (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    purchase_date DATE NOT NULL,
    quantity INT NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (product_id) REFERENCES products(id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Sales table
CREATE TABLE sales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    sale_date DATE NOT NULL,
    quantity INT NOT NULL,
    revenue DECIMAL(10, 2) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (product_id) REFERENCES products(id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);


-- Insert 2 suppliers
INSERT INTO suppliers (name, is_active) VALUES
('TechSupply Corp', TRUE),
('ElectroMax Solutions', TRUE);

-- Insert 5 products for supplier 1 (TechSupply Corp)
INSERT INTO products (name, category, supplier_id, price, is_active) VALUES
('Wireless Mouse', 'Electronics', 1, 29.99, TRUE),
('USB-C Cable', 'Accessories', 1, 15.50, TRUE),
('Bluetooth Keyboard', 'Electronics', 1, 89.99, TRUE),
('Phone Stand', 'Accessories', 1, 12.99, TRUE),
('Laptop Charger', 'Electronics', 1, 45.99, TRUE);

-- Insert 6 products for supplier 2 (ElectroMax Solutions)
INSERT INTO products (name, category, supplier_id, price, is_active) VALUES
('LED Monitor 24"', 'Displays', 2, 189.99, TRUE),
('Gaming Headset', 'Audio', 2, 79.99, TRUE),
('External Hard Drive 1TB', 'Storage', 2, 65.99, TRUE),
('Webcam HD', 'Electronics', 2, 39.99, TRUE),
('Power Bank 10000mAh', 'Accessories', 2, 25.99, TRUE),
('Wireless Earbuds', 'Audio', 2, 129.99, TRUE);

-- Purchase entries for Supplier 1 (TechSupply Corp) - 20 entries
INSERT INTO purchases (product_id, purchase_date, quantity, cost, is_active) VALUES
(1, '2024-01-15', 50, 1200.00, TRUE),
(2, '2024-01-18', 100, 1400.00, TRUE),
(3, '2024-01-22', 30, 2400.00, TRUE),
(4, '2024-01-25', 75, 850.00, TRUE),
(5, '2024-01-28', 40, 1600.00, TRUE),
(1, '2024-02-05', 60, 1500.00, TRUE),
(2, '2024-02-08', 80, 1100.00, TRUE),
(3, '2024-02-12', 25, 2000.00, TRUE),
(4, '2024-02-15', 90, 1080.00, TRUE),
(5, '2024-02-18', 35, 1400.00, TRUE),
(1, '2024-03-02', 45, 1125.00, TRUE),
(2, '2024-03-05', 120, 1680.00, TRUE),
(3, '2024-03-08', 20, 1600.00, TRUE),
(4, '2024-03-12', 65, 780.00, TRUE),
(5, '2024-03-15', 50, 2000.00, TRUE),
(1, '2024-03-20', 55, 1375.00, TRUE),
(2, '2024-03-25', 95, 1330.00, TRUE),
(3, '2024-03-28', 28, 2240.00, TRUE),
(4, '2024-04-02', 70, 840.00, TRUE),
(5, '2024-04-05', 42, 1680.00, TRUE);

-- Purchase entries for Supplier 2 (ElectroMax Solutions) - 20 entries
INSERT INTO purchases (product_id, purchase_date, quantity, cost, is_active) VALUES
(6, '2024-01-12', 25, 4250.00, TRUE),
(7, '2024-01-16', 40, 2800.00, TRUE),
(8, '2024-01-20', 30, 1800.00, TRUE),
(9, '2024-01-24', 50, 1750.00, TRUE),
(10, '2024-01-28', 80, 1840.00, TRUE),
(11, '2024-02-02', 35, 4200.00, TRUE),
(6, '2024-02-06', 20, 3400.00, TRUE),
(7, '2024-02-10', 45, 3150.00, TRUE),
(8, '2024-02-14', 25, 1500.00, TRUE),
(9, '2024-02-18', 60, 2100.00, TRUE),
(10, '2024-02-22', 70, 1610.00, TRUE),
(11, '2024-02-26', 30, 3600.00, TRUE),
(6, '2024-03-05', 22, 3740.00, TRUE),
(7, '2024-03-08', 38, 2660.00, TRUE),
(8, '2024-03-12', 28, 1680.00, TRUE),
(9, '2024-03-16', 55, 1925.00, TRUE),
(10, '2024-03-20', 65, 1495.00, TRUE),
(11, '2024-03-24', 32, 3840.00, TRUE),
(6, '2024-03-28', 18, 3060.00, TRUE),
(7, '2024-04-02', 42, 2940.00, TRUE);

-- Sales entries for Supplier 1 products - 20 entries
INSERT INTO sales (product_id, sale_date, quantity, revenue, is_active) VALUES
(1, '2024-01-20', 25, 749.75, TRUE),
(2, '2024-01-23', 40, 620.00, TRUE),
(3, '2024-01-27', 15, 1349.85, TRUE),
(4, '2024-01-30', 35, 454.65, TRUE),
(5, '2024-02-03', 20, 919.80, TRUE),
(1, '2024-02-08', 30, 899.70, TRUE),
(2, '2024-02-12', 50, 775.00, TRUE),
(3, '2024-02-16', 12, 1079.88, TRUE),
(4, '2024-02-20', 45, 584.55, TRUE),
(5, '2024-02-24', 25, 1149.75, TRUE),
(1, '2024-03-05', 28, 839.72, TRUE),
(2, '2024-03-10', 60, 930.00, TRUE),
(3, '2024-03-14', 10, 899.90, TRUE),
(4, '2024-03-18', 38, 493.62, TRUE),
(5, '2024-03-22', 30, 1379.70, TRUE),
(1, '2024-03-26', 32, 959.68, TRUE),
(2, '2024-03-30', 45, 697.50, TRUE),
(3, '2024-04-05', 18, 1619.82, TRUE),
(4, '2024-04-10', 40, 519.60, TRUE),
(5, '2024-04-15', 22, 1011.78, TRUE);

-- Sales entries for Supplier 2 products - 20 entries
INSERT INTO sales (product_id, sale_date, quantity, revenue, is_active) VALUES
(6, '2024-01-25', 12, 2279.88, TRUE),
(7, '2024-01-28', 20, 1599.80, TRUE),
(8, '2024-02-02', 15, 989.85, TRUE),
(9, '2024-02-05', 25, 999.75, TRUE),
(10, '2024-02-08', 35, 909.65, TRUE),
(11, '2024-02-12', 18, 2339.82, TRUE),
(6, '2024-02-15', 10, 1899.90, TRUE),
(7, '2024-02-18', 22, 1759.78, TRUE),
(8, '2024-02-22', 12, 791.88, TRUE),
(9, '2024-02-25', 30, 1199.70, TRUE),
(10, '2024-02-28', 40, 1039.60, TRUE),
(11, '2024-03-05', 15, 1949.85, TRUE),
(6, '2024-03-10', 8, 1519.92, TRUE),
(7, '2024-03-14', 25, 1999.75, TRUE),
(8, '2024-03-18', 18, 1187.82, TRUE),
(9, '2024-03-22', 28, 1119.72, TRUE),
(10, '2024-03-26', 32, 831.68, TRUE),
(11, '2024-03-30', 20, 2599.80, TRUE),
(6, '2024-04-05', 14, 2659.86, TRUE),
(7, '2024-04-10', 19, 1519.81, TRUE);

