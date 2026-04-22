-- Huyen
-- Create Professor table
DROP TABLE IF EXISTS Professor;
CREATE TABLE Professor (
    professor_id INT PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    email VARCHAR2(100) UNIQUE,
);

--Huyen
-- INSERT PROFESSORS
INSERT INTO Professor VALUES (1, 'John', 'Smith', 'john.smith@uni.edu');
INSERT INTO Professor VALUES (2, 'Michael', 'Johnson', 'michael.johnson@uni.edu');
INSERT INTO Professor VALUES (3, 'Emily', 'Davis', 'emily.davis@uni.edu');


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