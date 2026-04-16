-- Huyen
-- 1. Create Department table
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    department_code VARCHAR(10)
);

-- 2. Create Professor table
DROP TABLE IF EXISTS Professor;
CREATE TABLE Professor (
    professor_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Insert values into Department 
INSERT INTO Department VALUES
(1, 'Computer Science', 'CSC'),
(2, 'Mathematics', 'MAT'),
(3, 'Physics', 'PHY'),
(4, 'Economics', 'ECO'),
(5, 'English', 'ENG'),
(6, 'Communication', 'COM');

-- INSERT PROFESSORS
INSERT INTO Professor VALUES
(1, 'John', 'Smith', 'john.smith@uni.edu', 1),
(2, 'Michael', 'Johnson', 'michael.johnson@uni.edu', 1),
(3, 'Emily', 'Davis', 'emily.davis@uni.edu', 2),
(4, 'Sarah', 'Brown', 'sarah.brown@uni.edu', 2),
(5, 'Daniel', 'Wilson', 'daniel.wilson@uni.edu', 3),
(6, 'William', 'Thomas', 'william.thomas@uni.edu', 6),
(7, 'Huyen', 'Nguyen', 'huyen.nguyen@uni.edu', 1),
(8, 'Luke', 'Prebola', 'luke.prebola@uni.edu', 2),
(9, 'Tate', 'Seeman', 'tate.seeman@uni.edu', 3),
(10, 'Gregory', 'Safko', 'gregory.safko@uni.edu', 5);

-- Select all department
Select * FROM Department;
Select * FROM Professor;

-- Huyen's end