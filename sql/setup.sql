CREATE DATABASE IF NOT EXISTS practical_exam;
USE practical_exam;

-- Parent table FIRST (lookup)
CREATE TABLE courses (
    course_id   VARCHAR(5)   PRIMARY KEY,
    course      VARCHAR(50)  NOT NULL,
    department  VARCHAR(50)  NOT NULL
);

-- Child table SECOND (fact)
CREATE TABLE assessments (
    assessment_id  INT         PRIMARY KEY,
    month          VARCHAR(3)  NOT NULL,
    course_id      VARCHAR(5)  NOT NULL,
    batch          VARCHAR(20) NOT NULL,
    score          INT         NOT NULL,
    attendance_pct INT         NOT NULL,
    CONSTRAINT fk_assess_course
        FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Data load (12 unique rows, duplicate removed)
INSERT INTO courses VALUES
('C1','Excel','Business'),
('C2','PowerBI','Business'),
('C3','SQL','Technology'),
('C4','Python','Technology');

INSERT INTO assessments VALUES
(1,'Jan','C1','Morning',72,90),
(2,'Jan','C2','Evening',45,70),
(3,'Jan','C3','Morning',65,85),
(4,'Jan','C4','Weekend',38,60),
(5,'Feb','C1','Evening',80,95),
(6,'Feb','C2','Weekend',55,80),
(7,'Feb','C3','Morning',48,75),
(8,'Feb','C4','Evening',68,88),
(9,'Mar','C1','Weekend',90,98),
(10,'Mar','C2','Morning',60,82),
(11,'Mar','C3','Evening',75,92),
(12,'Mar','C4','Weekend',42,65);
