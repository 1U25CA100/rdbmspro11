CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100)
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);


INSERT INTO Department VALUES
(101, 'Computer Science'),
(102, 'Commerce'),
(103, 'Mathematics');

INSERT INTO Student VALUES
(1, 'Vishwa', 101),
(2, 'Karthik', 102),
(3, 'Ramesh', 103);

INSERT INTO Course VALUES
(201, 'Database Management System'),
(202, 'Web Programming'),
(203, 'Mathematics');


INSERT INTO Enrollment VALUES
(1, 1, 201),
(2, 1, 202),
(3, 2, 201),
(4, 3, 203);


CREATE VIEW StudentDetails AS
SELECT
    Student.StudentName,
    Course.CourseName,
    Department.DepartmentName
FROM Student
JOIN Enrollment
    ON Student.StudentID = Enrollment.StudentID
JOIN Course
    ON Enrollment.CourseID = Course.CourseID
JOIN Department
    ON Student.DepartmentID = Department.DepartmentID;


SELECT * FROM StudentDetails;
