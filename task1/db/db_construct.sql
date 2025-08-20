-- Create customers table
CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(100),
    is_active BOOLEAN DEFAULT TRUE
);

-- Create products table
CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    price DECIMAL(10,2),
    is_active BOOLEAN DEFAULT TRUE
);

-- Create orders table
CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Create order_items table
CREATE TABLE order_items (
    id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Insert 10 products across 4 categories
INSERT INTO products (id, name, category, price, is_active) VALUES
(1, 'iPhone 15 Pro', 'Electronics', 999.99, TRUE),
(2, 'Samsung Galaxy S24', 'Electronics', 849.99, TRUE),
(3, 'MacBook Air M3', 'Electronics', 1299.99, TRUE),

(4, 'Levi''s 501 Jeans', 'Clothing', 89.99, TRUE),
(5, 'Nike Air Max 270', 'Clothing', 149.99, TRUE),
(6, 'Adidas Hoodie', 'Clothing', 79.99, TRUE),

(7, 'The Great Gatsby', 'Books', 12.99, TRUE),
(8, 'Python Programming Guide', 'Books', 34.99, TRUE),

(9, 'Organic Almonds 1kg', 'Food', 24.99, TRUE),
(10, 'Premium Coffee Beans', 'Food', 18.99, TRUE);

select * from products;

-- Insert 25 customers
INSERT INTO customers (id, name, city, is_active) VALUES
(1, 'John Smith', 'New York', TRUE),
(2, 'Sarah Johnson', 'Los Angeles', TRUE),
(3, 'Michael Brown', 'Chicago', TRUE),
(4, 'Emily Davis', 'Houston', TRUE),
(5, 'David Wilson', 'Phoenix', TRUE),
(6, 'Jessica Miller', 'Philadelphia', TRUE),
(7, 'Christopher Jones', 'San Antonio', TRUE),
(8, 'Amanda Garcia', 'San Diego', TRUE),
(9, 'Matthew Rodriguez', 'Dallas', TRUE),
(10, 'Ashley Martinez', 'San Jose', TRUE),
(11, 'Daniel Anderson', 'Austin', TRUE),
(12, 'Stephanie Taylor', 'Jacksonville', TRUE),
(13, 'Ryan Thomas', 'Fort Worth', TRUE),
(14, 'Nicole Hernandez', 'Columbus', TRUE),
(15, 'Kevin Moore', 'Charlotte', TRUE),
(16, 'Lauren Jackson', 'San Francisco', TRUE),
(17, 'Brandon Martin', 'Indianapolis', TRUE),
(18, 'Megan Lee', 'Seattle', TRUE),
(19, 'Tyler Thompson', 'Denver', TRUE),
(20, 'Samantha White', 'Washington', TRUE),
(21, 'Justin Harris', 'Boston', TRUE),
(22, 'Brittany Clark', 'Nashville', TRUE),
(23, 'Andrew Lewis', 'Las Vegas', TRUE),
(24, 'Kimberly Walker', 'Portland', TRUE),
(25, 'Joshua Hall', 'Miami', FALSE);

-- Insert 25 orders across 3 months (November 2024, December 2024, January 2025)
INSERT INTO orders (id, customer_id, order_date, is_active) VALUES
-- November 2024 orders
(1, 1, '2024-11-02', TRUE),
(2, 3, '2024-11-05', TRUE),
(3, 7, '2024-11-08', TRUE),
(4, 12, '2024-11-12', TRUE),
(5, 15, '2024-11-15', TRUE),
(6, 9, '2024-11-18', TRUE),
(7, 22, '2024-11-22', TRUE),
(8, 5, '2024-11-25', TRUE),
(9, 18, '2024-11-28', TRUE),

-- December 2024 orders
(10, 2, '2024-12-03', TRUE),
(11, 14, '2024-12-06', TRUE),
(12, 8, '2024-12-10', TRUE),
(13, 21, '2024-12-13', TRUE),
(14, 11, '2024-12-16', TRUE),
(15, 19, '2024-12-19', TRUE),
(16, 4, '2024-12-22', TRUE),
(17, 25, '2024-12-26', TRUE),
(18, 6, '2024-12-29', TRUE),

-- January 2025 orders
(19, 13, '2025-01-05', TRUE),
(20, 17, '2025-01-08', TRUE),
(21, 20, '2025-01-12', TRUE),
(22, 10, '2025-01-15', TRUE),
(23, 23, '2025-01-18', TRUE),
(24, 16, '2025-01-22', TRUE),
(25, 24, '2025-01-25', TRUE);

-- Insert order items for all orders
INSERT INTO order_items (id, order_id, product_id, quantity, is_active) VALUES
-- Order 1 items
(1, 1, 1, 1, TRUE),
(2, 1, 4, 2, TRUE),

-- Order 2 items
(3, 2, 3, 1, TRUE),
(4, 2, 8, 1, TRUE),

-- Order 3 items
(5, 3, 2, 1, TRUE),
(6, 3, 5, 1, TRUE),
(7, 3, 9, 3, TRUE),

-- Order 4 items
(8, 4, 7, 2, TRUE),
(9, 4, 10, 1, TRUE),

-- Order 5 items
(10, 5, 6, 1, TRUE),
(11, 5, 1, 1, TRUE),

-- Order 6 items
(12, 6, 4, 3, TRUE),
(13, 6, 9, 2, TRUE),

-- Order 7 items
(14, 7, 2, 1, TRUE),
(15, 7, 7, 1, TRUE),
(16, 7, 10, 2, TRUE),

-- Order 8 items
(17, 8, 3, 1, TRUE),
(18, 8, 5, 2, TRUE),

-- Order 9 items
(19, 9, 8, 3, TRUE),
(20, 9, 6, 1, TRUE),

-- Order 10 items
(21, 10, 1, 2, TRUE),
(22, 10, 9, 1, TRUE),

-- Order 11 items
(23, 11, 4, 1, TRUE),
(24, 11, 10, 3, TRUE),

-- Order 12 items
(25, 12, 2, 1, TRUE),
(26, 12, 7, 2, TRUE),
(27, 12, 5, 1, TRUE),

-- Order 13 items
(28, 13, 3, 1, TRUE),
(29, 13, 8, 1, TRUE),

-- Order 14 items
(30, 14, 6, 2, TRUE),
(31, 14, 1, 1, TRUE),

-- Order 15 items
(32, 15, 9, 4, TRUE),
(33, 15, 4, 1, TRUE),

-- Order 16 items
(34, 16, 2, 1, TRUE),
(35, 16, 10, 2, TRUE),
(36, 16, 7, 1, TRUE),

-- Order 17 items
(37, 17, 5, 1, TRUE),
(38, 17, 8, 2, TRUE),

-- Order 18 items
(39, 18, 1, 1, TRUE),
(40, 18, 3, 1, TRUE),
(41, 18, 6, 1, TRUE),

-- Order 19 items
(42, 19, 4, 2, TRUE),
(43, 19, 9, 1, TRUE),

-- Order 20 items
(44, 20, 2, 1, TRUE),
(45, 20, 7, 3, TRUE),

-- Order 21 items
(46, 21, 10, 1, TRUE),
(47, 21, 5, 2, TRUE),
(48, 21, 8, 1, TRUE),

-- Order 22 items
(49, 22, 1, 1, TRUE),
(50, 22, 6, 1, TRUE),

-- Order 23 items
(51, 23, 3, 2, TRUE),
(52, 23, 9, 1, TRUE),

-- Order 24 items
(53, 24, 4, 1, TRUE),
(54, 24, 2, 1, TRUE),
(55, 24, 10, 2, TRUE),

-- Order 25 items
(56, 25, 7, 1, TRUE),
(57, 25, 5, 3, TRUE);





