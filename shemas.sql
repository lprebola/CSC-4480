-- Huyen
-- 1. Create Department table
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR2(100),
    department_code VARCHAR2(10)
);

--Huyen
-- 2. Create Professor table
DROP TABLE IF EXISTS Professor;
CREATE TABLE Professor (
    professor_id INT PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    email VARCHAR2(100) UNIQUE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

--Huyen
-- Insert values into Department 
INSERT INTO Department VALUES (1, 'Computer Science', 'CSC');
INSERT INTO Department VALUES (2, 'Mathematics', 'MAT');
INSERT INTO Department VALUES (3, 'Physics', 'PHY');
INSERT INTO Department VALUES (4, 'Economics', 'ECO');
INSERT INTO Department VALUES (5, 'English', 'ENG');
INSERT INTO Department VALUES (6, 'Communication', 'COM');

--Huyen
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


--Luke
--3. Create Student Table
DROP TABLE IF EXISTS Student;
CREATE TABLE Student(
    student_id INT PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    email VARCHAR2(100) UNIQUE,
    major_department_id INT,
    FOREIGN KEY (major_department_id) REFERENCES Department(department_id)
);

-- Luke
--4. Create Course Table
DROP TABLE IF EXISTS Course;
CREATE TABLE COURSE (
    course_id INT PRIMARY KEY,
    department_id INT,
    course_number VARCHAR2(10),
    course_name VARCHAR2(100),
    UNIQUE (department_id, course_number),
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

--Luke
--5. Create Course_Offering Table
DROP TABLE IF EXISTS Course_Offering;
CREATE TABLE Course_Offering(
    offering_id INT PRIMARY KEY,
    course_id INT,
    professor_id INT,
    semester VARCHAR(20),
    year INT,
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (professor_id) REFERENCES Professor(professor_id)
);

--Luke
--Insert values into Student
INSERT INTO Student VALUES (1, 'Lebron', 'James', 'lebronj@uni.edu', 1);
INSERT INTO Student VALUES (2, 'Michael', 'Jordan', 'jordanM@uni.edu', 1);
INSERT INTO Student VALUES (3, 'Shaquille', 'ONeal', 'shaqO@uni.edu', 2);
INSERT INTO Student VALUES (4, 'Dwayne', 'Johnson', 'therock@uni.edu', 2);
INSERT INTO Student VALUES (5, 'Gordon', 'Ramsey', 'ramseyg@uni.edu', 3);
INSERT INTO Student VALUES (6, 'Tom', 'Hanks', 'tom.hanks@uni.edu', 3);
INSERT INTO Student VALUES (7, 'Lioneli', 'Messi', 'MessiLioneli@uni.edu', 4);
INSERT INTO Student VALUES (8, 'Peyton', 'Manning', 'ManningPeyton@uni.edu', 4);
INSERT INTO Student VALUES (9, 'Bo', 'Nix', 'bonix123@uni.edu', 5);
INSERT INTO Student VALUES (10, 'Arnold', 'Schwarzenegger', 'schwarzeneggerarnold@uni.edu', 6);

--Luke
--Insert values into Course
INSERT INTO Course VALUES (1, 1, '4480', 'Principles of Database Systems');
INSERT INTO Course VALUES (2, 1, '1052', 'Algorithms and Data Structures II');
INSERT INTO Course VALUES (3, 1, '1051', 'Algorithms and Data Structures I');
INSERT INTO Course VALUES (4, 2, '1500', 'Calculus I');
INSERT INTO Course VALUES (5, 3, '1310', 'Physics I');
INSERT INTO Course VALUES (6, 4, '1001', 'Intro to Microeconomics');
INSERT INTO Course VALUES (7, 5, '1975', 'Core Lit and Writing Seminar');
INSERT INTO Course VALUES (8, 6, '1100', 'Public Speaking');

--Luke
--Insert values into Course_Offering
INSERT INTO Course_Offering VALUES (1, 3, 1,  'Spring', 2026);
INSERT INTO Course_Offering VALUES (2, 1, 2,  'Spring', 2026);
INSERT INTO Course_Offering VALUES (3, 2, 7,  'Spring', 2026);
INSERT INTO Course_Offering VALUES (4, 4, 3,  'Spring', 2026);
INSERT INTO Course_Offering VALUES (5, 5, 8,  'Spring', 2026);


--Huyen
-- Create Enrollment table
DROP TABLE IF EXISTS Enrollment;
CREATE TABLE Enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    offering_id INT,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (offering_id) REFERENCES Course_Offering(offering_id),
    UNIQUE (student_id, offering_id)
);

--Huyen
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

--Select all
Select * FROM Department;
Select * FROM Professor;
SELECT * FROM Student;
SELECT * FROM Course;
SELECT * FROM Course_Offering;
Select * FROM Enrollment;