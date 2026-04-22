-- Tate Seeman 

-- GRADE_CATEGORY
DROP TABLE IF EXISTS Grade_Category;

CREATE TABLE Grade_Category (
    category_id INT PRIMARY KEY,
    offering_id INT NOT NULL,
    category_name VARCHAR2(50),
    weight_percentage DECIMAL(5,2),
    FOREIGN KEY (offering_id)
        REFERENCES Course_Offering(offering_id)
);

INSERT INTO Grade_Category VALUES (1, 1, 'Homework', 20);
INSERT INTO Grade_Category VALUES (2, 1, 'Tests', 50);
INSERT INTO Grade_Category VALUES (3, 1, 'Participation', 10);
INSERT INTO Grade_Category VALUES (4, 1, 'Projects', 20);

INSERT INTO Grade_Category VALUES (5, 2, 'Homework', 30);
INSERT INTO Grade_Category VALUES (6, 2, 'Tests', 40);
INSERT INTO Grade_Category VALUES (7, 2, 'Projects', 30);


-- 8. ASSIGNMENT
DROP TABLE IF EXISTS Assignment;

CREATE TABLE Assignment (
    assignment_id INT PRIMARY KEY,
    category_id INT NOT NULL,
    assignment_name VARCHAR2(100),
    max_score DECIMAL(6,2),
    due_date DATE,
    FOREIGN KEY (category_id)
        REFERENCES Grade_Category(category_id)
);

INSERT INTO Assignment VALUES (1, 1, 'Homework 1', 100, DATE '2026-02-01');
INSERT INTO Assignment VALUES (2, 1, 'Homework 2', 100, DATE '2026-02-15');

INSERT INTO Assignment VALUES (3, 2, 'Midterm Exam', 100, DATE '2026-03-10');
INSERT INTO Assignment VALUES (4, 2, 'Final Exam', 100, DATE '2026-04-25');

INSERT INTO Assignment VALUES (5, 4, 'Final Project', 100, DATE '2026-04-20');


-- 9. STUDENT_ASSIGNMENT_GRADE 
DROP TABLE IF EXISTS Student_Assignment_Grade;

CREATE TABLE Student_Assignment_Grade (
    student_grade_id INT PRIMARY KEY,
    assignment_id INT NOT NULL,
    student_id INT NOT NULL,
    score_received DECIMAL(6,2),
    FOREIGN KEY (assignment_id)
        REFERENCES Assignment(assignment_id),
    FOREIGN KEY (student_id)
        REFERENCES Student(student_id),
    UNIQUE (assignment_id, student_id)
);

INSERT INTO Student_Assignment_Grade VALUES (1, 1, 1, 95);
INSERT INTO Student_Assignment_Grade VALUES (2, 2, 1, 88);
INSERT INTO Student_Assignment_Grade VALUES (3, 3, 1, 90);

INSERT INTO Student_Assignment_Grade VALUES (4, 1, 2, 85);
INSERT INTO Student_Assignment_Grade VALUES (5, 2, 2, 92);
INSERT INTO Student_Assignment_Grade VALUES (6, 3, 2, 87);

SELECT * FROM Grade_Category;
SELECT * FROM Assignment;
SELECT * FROM Student_Assignment_Grade;