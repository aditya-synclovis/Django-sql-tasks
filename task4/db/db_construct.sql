-- Create courses table
CREATE TABLE courses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE
);

-- Create students table
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    course_id INT NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);

-- Create subjects table
CREATE TABLE subjects (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    course_id INT NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);

-- Create marks table
CREATE TABLE marks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    score DECIMAL(5,2) NOT NULL,
    exam_date DATE NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subjects(id) ON DELETE CASCADE
);

-- Insert courses
INSERT INTO courses (name, is_active) VALUES
('Computer Science Engineering', TRUE),
('Mechanical Engineering', TRUE);

-- Insert subjects for Computer Science Engineering (course_id = 1)
INSERT INTO subjects (name, course_id, is_active) VALUES
('Data Structures and Algorithms', 1, TRUE),
('Database Management Systems', 1, TRUE),
('Operating Systems', 1, TRUE),
('Computer Networks', 1, TRUE),
('Software Engineering', 1, TRUE);

-- Insert subjects for Mechanical Engineering (course_id = 2)
INSERT INTO subjects (name, course_id, is_active) VALUES
('Thermodynamics', 2, TRUE),
('Fluid Mechanics', 2, TRUE),
('Machine Design', 2, TRUE),
('Manufacturing Processes', 2, TRUE),
('Heat Transfer', 2, TRUE);

-- Insert students for Computer Science Engineering (course_id = 1)
INSERT INTO students (name, course_id, is_active) VALUES
('Rahul Sharma', 1, TRUE),
('Priya Patel', 1, TRUE),
('Amit Kumar', 1, TRUE),
('Sneha Singh', 1, TRUE),
('Vikram Gupta', 1, TRUE);

-- Insert students for Mechanical Engineering (course_id = 2)
INSERT INTO students (name, course_id, is_active) VALUES
('Arjun Reddy', 2, TRUE),
('Kavya Nair', 2, TRUE),
('Rohit Joshi', 2, TRUE),
('Anita Desai', 2, TRUE),
('Karan Mehta', 2, TRUE);

-- Insert marks for CS students (assuming exam_date as '2024-12-15')
-- Student 1 (Rahul Sharma) - CS subjects (subject_ids 1-5)
INSERT INTO marks (student_id, subject_id, score, exam_date, is_active) VALUES
(1, 1, 87.50, '2024-12-15', TRUE), -- Data Structures
(1, 2, 92.00, '2024-12-15', TRUE), -- DBMS
(1, 3, 78.75, '2024-12-15', TRUE), -- OS
(1, 4, 85.25, '2024-12-15', TRUE), -- Networks
(1, 5, 89.00, '2024-12-15', TRUE); -- Software Engineering

-- Student 2 (Priya Patel) - CS subjects
INSERT INTO marks (student_id, subject_id, score, exam_date, is_active) VALUES
(2, 1, 94.25, '2024-12-15', TRUE),
(2, 2, 88.50, '2024-12-15', TRUE),
(2, 3, 91.75, '2024-12-15', TRUE),
(2, 4, 86.00, '2024-12-15', TRUE),
(2, 5, 93.25, '2024-12-15', TRUE);

-- Student 3 (Amit Kumar) - CS subjects
INSERT INTO marks (student_id, subject_id, score, exam_date, is_active) VALUES
(3, 1, 76.00, '2024-12-15', TRUE),
(3, 2, 82.75, '2024-12-15', TRUE),
(3, 3, 79.50, '2024-12-15', TRUE),
(3, 4, 84.25, '2024-12-15', TRUE),
(3, 5, 77.75, '2024-12-15', TRUE);

-- Student 4 (Sneha Singh) - CS subjects
INSERT INTO marks (student_id, subject_id, score, exam_date, is_active) VALUES
(4, 1, 90.75, '2024-12-15', TRUE),
(4, 2, 95.00, '2024-12-15', TRUE),
(4, 3, 87.25, '2024-12-15', TRUE),
(4, 4, 89.50, '2024-12-15', TRUE),
(4, 5, 92.75, '2024-12-15', TRUE);

-- Student 5 (Vikram Gupta) - CS subjects
INSERT INTO marks (student_id, subject_id, score, exam_date, is_active) VALUES
(5, 1, 83.25, '2024-12-15', TRUE),
(5, 2, 79.50, '2024-12-15', TRUE),
(5, 3, 85.75, '2024-12-15', TRUE),
(5, 4, 88.00, '2024-12-15', TRUE),
(5, 5, 81.25, '2024-12-15', TRUE);

-- Insert marks for Mechanical Engineering students (subject_ids 6-10)
-- Student 6 (Arjun Reddy) - ME subjects
INSERT INTO marks (student_id, subject_id, score, exam_date, is_active) VALUES
(6, 6, 85.50, '2024-12-15', TRUE), -- Thermodynamics
(6, 7, 78.25, '2024-12-15', TRUE), -- Fluid Mechanics
(6, 8, 89.75, '2024-12-15', TRUE), -- Machine Design
(6, 9, 82.00, '2024-12-15', TRUE), -- Manufacturing
(6, 10, 86.50, '2024-12-15', TRUE); -- Heat Transfer

-- Student 7 (Kavya Nair) - ME subjects
INSERT INTO marks (student_id, subject_id, score, exam_date, is_active) VALUES
(7, 6, 92.25, '2024-12-15', TRUE),
(7, 7, 88.75, '2024-12-15', TRUE),
(7, 8, 94.00, '2024-12-15', TRUE),
(7, 9, 90.50, '2024-12-15', TRUE),
(7, 10, 87.75, '2024-12-15', TRUE);

-- Student 8 (Rohit Joshi) - ME subjects
INSERT INTO marks (student_id, subject_id, score, exam_date, is_active) VALUES
(8, 6, 74.50, '2024-12-15', TRUE),
(8, 7, 81.25, '2024-12-15', TRUE),
(8, 8, 76.75, '2024-12-15', TRUE),
(8, 9, 79.00, '2024-12-15', TRUE),
(8, 10, 83.50, '2024-12-15', TRUE);

-- Student 9 (Anita Desai) - ME subjects
INSERT INTO marks (student_id, subject_id, score, exam_date, is_active) VALUES
(9, 6, 88.75, '2024-12-15', TRUE),
(9, 7, 85.50, '2024-12-15', TRUE),
(9, 8, 91.25, '2024-12-15', TRUE),
(9, 9, 87.00, '2024-12-15', TRUE),
(9, 10, 89.75, '2024-12-15', TRUE);

-- Student 10 (Karan Mehta) - ME subjects
INSERT INTO marks (student_id, subject_id, score, exam_date, is_active) VALUES
(10, 6, 80.25, '2024-12-15', TRUE),
(10, 7, 77.50, '2024-12-15', TRUE),
(10, 8, 84.75, '2024-12-15', TRUE),
(10, 9, 81.00, '2024-12-15', TRUE),
(10, 10, 78.25, '2024-12-15', TRUE);

