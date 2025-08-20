-- Create departments table first (referenced by other tables)
CREATE TABLE departments (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE
);

-- Create employees table
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dept_id INT,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (dept_id) REFERENCES departments(id)
);

-- Create projects table
CREATE TABLE projects (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dept_id INT,
    billing_rate DECIMAL(10,2),
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (dept_id) REFERENCES departments(id)
);

-- Create timesheets table
CREATE TABLE timesheets (
    id INT PRIMARY KEY,
    emp_id INT,
    project_id INT,
    work_date DATE,
    hours DECIMAL(5,2),
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (emp_id) REFERENCES employees(id),
    FOREIGN KEY (project_id) REFERENCES projects(id)
);

INSERT INTO departments (id, name, is_active) VALUES
(1, 'HR', TRUE),
(2, 'Engineering', TRUE),
(3, 'Finance', TRUE);

INSERT INTO employees (id, name, dept_id, is_active) VALUES
(1, 'Alice', 1, TRUE),
(2, 'Bob', 1, TRUE),
(3, 'Charlie', 1, TRUE),
(4, 'David', 2, TRUE),
(5, 'Eve', 2, TRUE),
(6, 'Frank', 2, TRUE),
(7, 'Grace', 2, TRUE),
(8, 'Heidi', 2, TRUE),
(9, 'Ivan', 2, TRUE),
(10, 'Judy', 3, TRUE),
(11, 'Karl', 3, TRUE),
(12, 'Laura', 3, TRUE),
(13, 'Mallory', 3, TRUE),
(14, 'Niaj', 3, TRUE),
(15, 'Oscar', 3, TRUE);

INSERT INTO projects (id, name, dept_id, billing_rate, is_active) VALUES
(1, 'Project Alpha', 2, 100.0, TRUE),
(2, 'Project Beta', 3, 150.0, TRUE);

INSERT INTO timesheets (id, emp_id, project_id, work_date, hours, is_active) VALUES
(1, 1, 1, '2025-08-19', 8, TRUE),
(2, 4, 1, '2025-08-19', 8, TRUE),
(3, 5, 1, '2025-08-19', 8, TRUE),
(4, 6, 1, '2025-08-19', 8, TRUE),
(5, 7, 1, '2025-08-19', 10, TRUE),
(6, 8, 1, '2025-08-19', 8, TRUE),
(7, 9, 1, '2025-08-19', 8, TRUE),
(8, 2, 1, '2025-08-19', 8, TRUE),
(9, 3, 2, '2025-08-19', 6, TRUE),
(10, 10, 2, '2025-08-19', 6, TRUE),
(11, 11, 2, '2025-08-19', 6, TRUE),
(12, 12, 2, '2025-08-19', 6, TRUE),
(13, 13, 2, '2025-08-19', 6, TRUE),
(14, 14, 2, '2025-08-19', 8, TRUE),
(15, 15, 2, '2025-08-19', 6, TRUE);

