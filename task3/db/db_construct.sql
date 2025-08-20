-- Create departments table
CREATE TABLE departments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE
);

-- Create doctors table
CREATE TABLE doctors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    dept_id INT,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (dept_id) REFERENCES departments(id)
);

-- Create patients table
CREATE TABLE patients (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    admitted_date DATE,
    discharged_date DATE,
    is_active BOOLEAN DEFAULT TRUE
);

-- Create appointments table
CREATE TABLE appointments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_id INT,
    patient_id INT,
    appt_date DATETIME NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (doctor_id) REFERENCES doctors(id),
    FOREIGN KEY (patient_id) REFERENCES patients(id)
);

-- Insert departments
INSERT INTO departments (name, is_active) VALUES
('Cardiology', TRUE),
('Neurology', TRUE),
('Pediatrics', TRUE);

-- Insert doctors for Cardiology department (4 doctors)
INSERT INTO doctors (name, dept_id, is_active) VALUES
('Dr. Sarah Johnson', 1, TRUE),
('Dr. Michael Chen', 1, TRUE),
('Dr. Emily Rodriguez', 1, TRUE),
('Dr. David Thompson', 1, TRUE);

-- Insert doctors for Neurology department (2 doctors)
INSERT INTO doctors (name, dept_id, is_active) VALUES
('Dr. Robert Williams', 2, TRUE),
('Dr. Lisa Anderson', 2, TRUE);

-- Insert doctors for Pediatrics department (5 doctors)
INSERT INTO doctors (name, dept_id, is_active) VALUES
('Dr. Jennifer Martinez', 3, TRUE),
('Dr. Christopher Lee', 3, TRUE),
('Dr. Amanda Foster', 3, TRUE),
('Dr. Kevin Wright', 3, TRUE),
('Dr. Samantha Clark', 3, TRUE);


-- Insert 25 patients
INSERT INTO patients (name, admitted_date, discharged_date, is_active) VALUES
('John Smith', '2025-08-01', '2025-08-05', TRUE),
('Maria Garcia', '2025-08-02', NULL, TRUE),
('James Wilson', '2025-07-28', '2025-08-03', TRUE),
('Linda Brown', '2025-08-05', NULL, TRUE),
('Robert Davis', '2025-07-25', '2025-07-30', TRUE),
('Patricia Miller', '2025-08-10', NULL, TRUE),
('Michael Johnson', '2025-08-01', '2025-08-07', TRUE),
('Elizabeth Wilson', '2025-08-12', NULL, TRUE),
('William Moore', '2025-07-20', '2025-07-25', TRUE),
('Jennifer Taylor', '2025-08-08', NULL, TRUE),
('David Anderson', '2025-08-03', '2025-08-09', TRUE),
('Mary Thomas', '2025-08-15', NULL, TRUE),
('Richard Jackson', '2025-07-30', '2025-08-04', TRUE),
('Susan White', '2025-08-06', NULL, TRUE),
('Joseph Harris', '2025-08-11', NULL, TRUE),
('Jessica Martin', '2025-07-22', '2025-07-28', TRUE),
('Thomas Thompson', '2025-08-14', NULL, TRUE),
('Sarah Garcia', '2025-08-09', '2025-08-13', TRUE),
('Christopher Martinez', '2025-08-16', NULL, TRUE),
('Nancy Robinson', '2025-07-26', '2025-08-01', TRUE),
('Daniel Clark', '2025-08-07', NULL, TRUE),
('Lisa Rodriguez', '2025-08-13', NULL, TRUE),
('Matthew Lewis', '2025-08-04', '2025-08-10', TRUE),
('Karen Lee', '2025-08-17', NULL, TRUE),
('Anthony Walker', '2025-08-02', '2025-08-08', TRUE);

-- Insert 25 appointments
INSERT INTO appointments (doctor_id, patient_id, appt_date, is_active) VALUES
(1, 1, '2025-08-20 09:00:00', TRUE),
(2, 2, '2025-08-20 10:30:00', TRUE),
(3, 3, '2025-08-20 14:00:00', TRUE),
(4, 4, '2025-08-21 09:30:00', TRUE),
(5, 5, '2025-08-21 11:00:00', TRUE),
(6, 6, '2025-08-21 15:30:00', TRUE),
(7, 7, '2025-08-22 08:30:00', TRUE),
(8, 8, '2025-08-22 10:00:00', TRUE),
(9, 9, '2025-08-22 13:30:00', TRUE),
(10, 10, '2025-08-23 09:15:00', TRUE),
(11, 11, '2025-08-23 11:30:00', TRUE),
(1, 12, '2025-08-23 14:45:00', TRUE),
(2, 13, '2025-08-24 08:00:00', TRUE),
(3, 14, '2025-08-24 10:15:00', TRUE),
(4, 15, '2025-08-24 12:30:00', TRUE),
(5, 16, '2025-08-25 09:45:00', TRUE),
(6, 17, '2025-08-25 11:15:00', TRUE),
(7, 18, '2025-08-25 15:00:00', TRUE),
(8, 19, '2025-08-26 08:45:00', TRUE),
(9, 20, '2025-08-26 10:30:00', TRUE),
(10, 21, '2025-08-26 13:00:00', TRUE),
(11, 22, '2025-08-27 09:30:00', TRUE),
(1, 23, '2025-08-27 11:45:00', TRUE),
(2, 24, '2025-08-27 14:15:00', TRUE),
(3, 25, '2025-08-28 10:00:00', TRUE);

