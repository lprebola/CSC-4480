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
INSERT INTO Department VALUES (1, 'Computer Science', 'CSC');
INSERT INTO Department VALUES (2, 'Mathematics', 'MAT');
INSERT INTO Department VALUES (3, 'Physics', 'PHY');
INSERT INTO Department VALUES (4, 'Economics', 'ECO');
INSERT INTO Department VALUES (5, 'English', 'ENG');
INSERT INTO Department VALUES (6, 'Communication', 'COM');

-- INSERT PROFESSORS
INSERT INTO Professor VALUES (1, 'John', 'Smith', 'john.smith@uni.edu', 1);
INSERT INTO Professor VALUES (2, 'Michael', 'Johnson', 'michael.johnson@uni.edu', 1);
INSERT INTO Professor VALUES (3, 'Emily', 'Davis', 'emily.davis@uni.edu', 2);
INSERT INTO Professor VALUES (4, 'Sarah', 'Brown', 'sarah.brown@uni.edu', 2);
INSERT INTO Professor VALUES (5, 'Daniel', 'Wilson', 'daniel.wilson@uni.edu', 3);
INSERT INTO Professor VALUES (6, 'William', 'Thomas', 'william.thomas@uni.edu', 6);
INSERT INTO Professor VALUES (7, 'Huyen', 'Nguyen', 'huyen.nguyen@uni.edu', 1);
INSERT INTO Professor VALUES (8, 'Luke', 'Prebola', 'luke.prebola@uni.edu', 2);
INSERT INTO Professor VALUES (9, 'Tate', 'Seeman', 'tate.seeman@uni.edu', 3);
INSERT INTO Professor VALUES (10, 'Gregory', 'Safko', 'gregory.safko@uni.edu', 5);

-- Create Enrollment table
DROP TABLE IF EXISTS Enrollment;
CREATE TABLE Enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    offering_id INT,
    UNIQUE (student_id, offering_id)
);

-- Insert values into Enrollment
INSERT INTO Enrollment VALUES (1, 1, 1);
INSERT INTO Enrollment VALUES (2, 2, 1);
INSERT INTO Enrollment VALUES (3, 3, 2);
INSERT INTO Enrollment VALUES (4, 4, 2);
INSERT INTO Enrollment VALUES (5, 5, 3);
INSERT INTO Enrollment VALUES (6, 6, 3);
INSERT INTO Enrollment VALUES (7, 7, 4);
INSERT INTO Enrollment VALUES (8, 8, 4);
INSERT INTO Enrollment VALUES (9, 9, 5);
INSERT INTO Enrollment VALUES (10, 10, 5);
INSERT INTO Enrollment VALUES (11, 1, 2);
INSERT INTO Enrollment VALUES (12, 2, 3);
INSERT INTO Enrollment VALUES (13, 3, 4);
INSERT INTO Enrollment VALUES (14, 4, 5);
INSERT INTO Enrollment VALUES (15, 5, 1);
INSERT INTO Enrollment VALUES (16, 6, 2);
INSERT INTO Enrollment VALUES (17, 7, 3);
INSERT INTO Enrollment VALUES (18, 8, 5);
INSERT INTO Enrollment VALUES (19, 9, 1);
INSERT INTO Enrollment VALUES (20, 10, 2);

-- Select all department
Select * FROM Department;
Select * FROM Professor;
Select * FROM Enrollment;
-- Huyen's end