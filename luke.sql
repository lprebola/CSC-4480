--Luke
--3. Create Student Table
DROP TABLE IF EXISTS Student;
CREATE TABLE Student(
    student_id INT PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    email VARCHAR2(100) UNIQUE,
);

-- Luke
--4. Create Course Table
DROP TABLE IF EXISTS Course;
CREATE TABLE COURSE (
    course_id INT PRIMARY KEY,
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


--Select all
Select * FROM Department;
Select * FROM Professor;
SELECT * FROM Student;
SELECT * FROM Course;
SELECT * FROM Course_Offering;
Select * FROM Enrollment;