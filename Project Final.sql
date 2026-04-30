DROP TABLE Course_Offering CASCADE CONSTRAINTS;
DROP TABLE Course CASCADE CONSTRAINTS;
DROP TABLE Student CASCADE CONSTRAINTS;
DROP TABLE Professor CASCADE CONSTRAINTS;
DROP TABLE Enrollment CASCADE CONSTRAINTS;
DROP TABLE Grade_Category CASCADE CONSTRAINTS;
DROP TABLE Student_Assignment_Grade CASCADE CONSTRAINTS;
DROP TABLE Assignment CASCADE CONSTRAINTS;

--1. Create Professor table
CREATE TABLE Professor (
  professor_id VARCHAR2(10) PRIMARY KEY,
  first_name VARCHAR2(30),
  last_name VARCHAR2(30),
  email VARCHAR2(100) 
);


-- INSERT PROFESSORS
INSERT INTO Professor VALUES ('p1', 'John', 'Smith', 'john.smith@uni.edu');
INSERT INTO Professor VALUES ('p2', 'Michael', 'Johnson', 'michael.johnson@uni.edu');
INSERT INTO Professor VALUES ('p3', 'Emily', 'Davis', 'emily.davis@uni.edu');


--2. Create Student Table
CREATE TABLE Student(
  student_id VARCHAR2(10) PRIMARY KEY,
  first_name VARCHAR2(30),
  last_name VARCHAR2(30),
  email VARCHAR2(100) UNIQUE
);

--3. Create Course Table
CREATE TABLE COURSE (
  course_id VARCHAR2(10) PRIMARY KEY,
  course_number VARCHAR2(10),
  professor_id VARCHAR2(10),
  course_name VARCHAR2(40),
  FOREIGN KEY (professor_id) REFERENCES Professor(professor_id)
);

--4. Create Course_Offering Table
CREATE TABLE Course_Offering(
  offering_id VARCHAR2(10) PRIMARY KEY,
  course_id VARCHAR2(10),
  professor_id VARCHAR2(10),
  semester VARCHAR(20),
  year INT,
  FOREIGN KEY (course_id) REFERENCES Course(course_id),
  FOREIGN KEY (professor_id) REFERENCES Professor(professor_id)
);

--Insert values into Student
INSERT INTO Student VALUES ('s1', 'Lebron', 'James', 'lebronj@uni.edu');
INSERT INTO Student VALUES ('s2', 'Michael', 'Jordan', 'jordanM@uni.edu');
INSERT INTO Student VALUES ('s3', 'Shaquille', 'ONeal', 'shaqO@uni.edu');
INSERT INTO Student VALUES ('s4', 'Dwayne', 'Johnson', 'therock@uni.edu');
INSERT INTO Student VALUES ('s5', 'Gordon', 'Ramsey', 'ramseyg@uni.edu');
INSERT INTO Student VALUES ('s6', 'Tom', 'Hanks', 'tom.hanks@uni.edu');

--Insert values into Course
INSERT INTO Course VALUES ('c1', '4480', 'p1', 'Principles of Database Systems');
INSERT INTO Course VALUES ('c2', '1052', 'p1', 'Discrete Structures');
INSERT INTO Course VALUES ('c3','1051', 'p1', 'Algorithms and Data Structures I');

--Insert values into Course_Offering
INSERT INTO Course_Offering VALUES ('co1', 'c1', 'p1',  'Spring', 2026);
INSERT INTO Course_Offering VALUES ('co2', 'c2', 'p1',  'Spring', 2026);
INSERT INTO Course_Offering VALUES ('co3', 'c3', 'p1',  'Spring', 2026);

--5. Create Enrollment table
CREATE TABLE Enrollment (
  enrollment_id VARCHAR2(10) PRIMARY KEY,
  student_id VARCHAR2(10),
  offering_id VARCHAR2(10),
  FOREIGN KEY (student_id) REFERENCES Student(student_id),
  FOREIGN KEY (offering_id) REFERENCES Course_Offering(offering_id),
  UNIQUE (student_id, offering_id)
);

-- Insert values into Enrollment
INSERT INTO Enrollment VALUES (1, 's1', 'co1');
INSERT INTO Enrollment VALUES (2, 's1', 'co2');
INSERT INTO Enrollment VALUES (3, 's1', 'co3');
INSERT INTO Enrollment VALUES (4, 's2', 'co1');
INSERT INTO Enrollment VALUES (5, 's2', 'co2');
INSERT INTO Enrollment VALUES (6, 's3', 'co2');
INSERT INTO Enrollment VALUES (7, 's3', 'co3');
INSERT INTO Enrollment VALUES (8, 's4', 'co1');
INSERT INTO Enrollment VALUES (9, 's4', 'co3');
INSERT INTO Enrollment VALUES (10, 's5', 'co2');
INSERT INTO Enrollment VALUES (11, 's5', 'co3');
INSERT INTO Enrollment VALUES (12, 's6', 'co1');
INSERT INTO Enrollment VALUES (13, 's6', 'co2');

--Select all
Select * FROM Professor;
SELECT * FROM Student;
SELECT * FROM Course;
SELECT * FROM Course_Offering;
Select * FROM Enrollment;


SELECT e.enrollment_id, s.first_name, s.last_name, c.course_name, co.semester, co.year FROM Enrollment e
JOIN Student s ON e.student_id = s.student_id
JOIN Course_Offering co ON e.offering_id = co.offering_id
JOIN Course c ON co.course_id = c.course_id;


--6. GRADE_CATEGORY
CREATE TABLE Grade_Category (
  category_id VARCHAR2(10) PRIMARY KEY,
  offering_id VARCHAR2(10) NOT NULL,
  category_name VARCHAR2(50),
  weight_percentage DECIMAL(5,2),
  FOREIGN KEY (offering_id)
      REFERENCES Course_Offering(offering_id)
);

INSERT INTO Grade_Category VALUES ('1', 'co1', 'Homework', 20);
INSERT INTO Grade_Category VALUES ('2', 'co1', 'Final exam', 30);
INSERT INTO Grade_Category VALUES ('3', 'co1', 'Midterm exam', 20);
INSERT INTO Grade_Category VALUES ('4', 'co1', 'Participation', 10);
INSERT INTO Grade_Category VALUES ('5', 'co1', 'Projects', 20);

INSERT INTO Grade_Category VALUES ('6', 'co2', 'Homework', 30);
INSERT INTO Grade_Category VALUES ('7', 'co2', 'Quiz', 40);
INSERT INTO Grade_Category VALUES ('8', 'co2', 'Projects', 30);

INSERT INTO Grade_Category VALUES ('9', 'co3', 'Homework', 30);
INSERT INTO Grade_Category VALUES ('10', 'co3', 'Projects', 70);

-- 7. ASSIGNMENT
CREATE TABLE Assignment (
  assignment_id VARCHAR2(10) PRIMARY KEY,
  category_id VARCHAR2(10) NOT NULL,
  assignment_name VARCHAR2(100),
  max_score DECIMAL(6,2),
  due_date DATE,
  FOREIGN KEY (category_id) REFERENCES Grade_Category(category_id)
);

-- co1
INSERT INTO Assignment VALUES ('1', '1', 'Homework 1', 100, DATE '2026-02-01');
INSERT INTO Assignment VALUES ('2', '1', 'Homework 2', 100, DATE '2026-02-15');
INSERT INTO Assignment VALUES ('3', '3', 'Midterm Exam', 100, DATE '2026-03-10');
INSERT INTO Assignment VALUES ('4', '2', 'Final Exam', 100, DATE '2026-04-25');
INSERT INTO Assignment VALUES ('5', '5', 'Final Project', 100, DATE '2026-04-20');
INSERT INTO Assignment VALUES ('6', '4', 'Participation', 100, DATE '2026-04-20');

-- co2
INSERT INTO Assignment VALUES ('7', '6', 'Homework 1', 100, DATE '2026-02-05');
INSERT INTO Assignment VALUES ('8', '6', 'Homework 2', 100, DATE '2026-02-20');
INSERT INTO Assignment VALUES ('15', '7', 'Quiz 1', 100, DATE '2026-02-10');
INSERT INTO Assignment VALUES ('16', '7', 'Quiz 2', 100, DATE '2026-03-01');
INSERT INTO Assignment VALUES ('11', '8', 'Project', 100, DATE '2026-04-22');

-- co3
INSERT INTO Assignment VALUES ('12', '9', 'Homework 1', 100, DATE '2026-02-10');
INSERT INTO Assignment VALUES ('13', '9', 'Homework 2', 100, DATE '2026-02-25');
INSERT INTO Assignment VALUES ('14', '10', 'Final Project', 100, DATE '2026-04-30');

-- 8. STUDENT_ASSIGNMENT_GRADE
CREATE TABLE Student_Assignment_Grade (
  student_grade_id VARCHAR2(10) PRIMARY KEY,
  assignment_id VARCHAR2(10) NOT NULL,
  enrollment_id VARCHAR2(10) NOT NULL,
  score_received DECIMAL(6,2),
  FOREIGN KEY (assignment_id) REFERENCES Assignment(assignment_id),
  FOREIGN KEY (enrollment_id) REFERENCES Enrollment(enrollment_id)
);

-- s1: co1, co2, co3
INSERT INTO Student_Assignment_Grade VALUES ('1', '1', '1', 95);
INSERT INTO Student_Assignment_Grade VALUES ('2', '2', '1', 88);
INSERT INTO Student_Assignment_Grade VALUES ('3', '3', '1', 91);
INSERT INTO Student_Assignment_Grade VALUES ('4', '4', '1', 86);
INSERT INTO Student_Assignment_Grade VALUES ('5', '5', '1', 94);
INSERT INTO Student_Assignment_Grade VALUES ('6', '6', '1', 100);

INSERT INTO Student_Assignment_Grade VALUES ('7', '7', '2', 89);
INSERT INTO Student_Assignment_Grade VALUES ('8', '8', '2', 92);
INSERT INTO Student_Assignment_Grade VALUES ('9', '15', '2', 84);
INSERT INTO Student_Assignment_Grade VALUES ('10', '16', '2', 87);
INSERT INTO Student_Assignment_Grade VALUES ('11', '11', '2', 90);

INSERT INTO Student_Assignment_Grade VALUES ('12', '12', '3', 93);
INSERT INTO Student_Assignment_Grade VALUES ('13', '13', '3', 88);
INSERT INTO Student_Assignment_Grade VALUES ('14', '14', '3', 91);

-- s2: co1, co2
INSERT INTO Student_Assignment_Grade VALUES ('15', '1', '4', 85);
INSERT INTO Student_Assignment_Grade VALUES ('16', '2', '4', 82);
INSERT INTO Student_Assignment_Grade VALUES ('17', '3', '4', 88);
INSERT INTO Student_Assignment_Grade VALUES ('18', '4', '4', 90);
INSERT INTO Student_Assignment_Grade VALUES ('19', '5', '4', 87);
INSERT INTO Student_Assignment_Grade VALUES ('20', '6', '4', 95);

INSERT INTO Student_Assignment_Grade VALUES ('21', '7', '5', 78);
INSERT INTO Student_Assignment_Grade VALUES ('22', '8', '5', 81);
INSERT INTO Student_Assignment_Grade VALUES ('23', '15', '5', 76);
INSERT INTO Student_Assignment_Grade VALUES ('24', '16', '5', 83);
INSERT INTO Student_Assignment_Grade VALUES ('25', '11', '5', 85);

-- s3: co2, co3
INSERT INTO Student_Assignment_Grade VALUES ('26', '7', '6', 91);
INSERT INTO Student_Assignment_Grade VALUES ('27', '8', '6', 89);
INSERT INTO Student_Assignment_Grade VALUES ('28', '15', '6', 94);
INSERT INTO Student_Assignment_Grade VALUES ('29', '16', '6', 90);
INSERT INTO Student_Assignment_Grade VALUES ('30', '11', '6', 92);

INSERT INTO Student_Assignment_Grade VALUES ('31', '12', '7', 86);
INSERT INTO Student_Assignment_Grade VALUES ('32', '13', '7', 84);
INSERT INTO Student_Assignment_Grade VALUES ('33', '14', '7', 88);

-- s4: co1, co3
INSERT INTO Student_Assignment_Grade VALUES ('34', '1', '8', 72);
INSERT INTO Student_Assignment_Grade VALUES ('35', '2', '8', 79);
INSERT INTO Student_Assignment_Grade VALUES ('36', '3', '8', 81);
INSERT INTO Student_Assignment_Grade VALUES ('37', '4', '8', 77);
INSERT INTO Student_Assignment_Grade VALUES ('38', '5', '8', 83);
INSERT INTO Student_Assignment_Grade VALUES ('39', '6', '8', 90);

INSERT INTO Student_Assignment_Grade VALUES ('40', '12', '9', 80);
INSERT INTO Student_Assignment_Grade VALUES ('41', '13', '9', 82);
INSERT INTO Student_Assignment_Grade VALUES ('42', '14', '9', 85);

-- s5: co2, co3
INSERT INTO Student_Assignment_Grade VALUES ('43', '7', '10', 96);
INSERT INTO Student_Assignment_Grade VALUES ('44', '8', '10', 93);
INSERT INTO Student_Assignment_Grade VALUES ('45', '15', '10', 98);
INSERT INTO Student_Assignment_Grade VALUES ('46', '16', '10', 95);
INSERT INTO Student_Assignment_Grade VALUES ('47', '11', '10', 97);

INSERT INTO Student_Assignment_Grade VALUES ('48', '12', '11', 89);
INSERT INTO Student_Assignment_Grade VALUES ('49', '13', '11', 92);
INSERT INTO Student_Assignment_Grade VALUES ('50', '14', '11', 94);

-- s6: co1, co2
INSERT INTO Student_Assignment_Grade VALUES ('51', '1', '12', 88);
INSERT INTO Student_Assignment_Grade VALUES ('52', '2', '12', 91);
INSERT INTO Student_Assignment_Grade VALUES ('53', '3', '12', 86);
INSERT INTO Student_Assignment_Grade VALUES ('54', '4', '12', 89);
INSERT INTO Student_Assignment_Grade VALUES ('55', '5', '12', 93);
INSERT INTO Student_Assignment_Grade VALUES ('56', '6', '12', 100);

INSERT INTO Student_Assignment_Grade VALUES ('57', '7', '13', 84);
INSERT INTO Student_Assignment_Grade VALUES ('58', '8', '13', 87);
INSERT INTO Student_Assignment_Grade VALUES ('59', '15', '13', 82);
INSERT INTO Student_Assignment_Grade VALUES ('60', '16', '13', 85);
INSERT INTO Student_Assignment_Grade VALUES ('61', '11', '13', 88);

SELECT * FROM Grade_Category;
SELECT * FROM Assignment;
SELECT * FROM Student_Assignment_Grade;

--Final Grade Calculation
SELECT 
    student_name,
    course_name,
    semester,
    year,
    ROUND(SUM(category_avg * weight_percentage) / SUM(weight_percentage), 2) AS final_grade
FROM (
    SELECT 
        s.first_name || ' ' || s.last_name AS student_name,
        c.course_name,
        co.semester,
        co.year,
        gc.weight_percentage,
        gc.category_name,
        AVG(sag.score_received) AS category_avg
    FROM Student s
    JOIN Enrollment e ON e.student_id = s.student_id
    JOIN Course_Offering co ON co.offering_id = e.offering_id
    JOIN Course c ON c.course_id = co.course_id
    JOIN Grade_Category gc ON gc.offering_id = co.offering_id
    JOIN Assignment a ON a.category_id = gc.category_id
    JOIN Student_Assignment_Grade sag 
        ON sag.assignment_id = a.assignment_id
        AND sag.enrollment_id = e.enrollment_id
    GROUP BY s.student_id, s.first_name, s.last_name, 
             c.course_name, co.semester, co.year,
             gc.category_id, gc.category_name, gc.weight_percentage
)
GROUP BY student_name, course_name, semester, year
ORDER BY student_name ASC, course_name ASC;



--Updating Demo
SELECT * FROM Student_Assignment_Grade 
    WHERE enrollment_id = 8;

UPDATE Student_Assignment_Grade
SET score_received = 82 
WHERE enrollment_id = 8
  AND assignment_id = '3';

SELECT * FROM Student_Assignment_Grade 
    WHERE enrollment_id = 8;


