# By Mandy Smock
# Homework 1, 02/01/2022
# Create, Update, and Delete

CREATE DATABASE IS3400 ;

USE IS3400 ;

CREATE TABLE Student (
	SID VARCHAR(10) UNIQUE NOT NULL ,
	SFName VARCHAR(50) NOT NULL ,
	SLName VARCHAR(50) ,
	SEmail VARCHAR(20) UNIQUE ,
	SPhone VARCHAR(15) ,
	CONSTRAINT s_pk PRIMARY KEY (SID)
) ;

CREATE TABLE Professor (
	PID VARCHAR(10) UNIQUE NOT NULL ,
	PFName VARCHAR(50) NOT NULL ,
	PLName VARCHAR(50) ,
	PRank VARCHAR(20) ,
	PEmail VARCHAR(15) UNIQUE ,
	CONSTRAINT s_pk PRIMARY KEY (PID)
) ;

CREATE TABLE Course (
	CCallNum VARCHAR(4) UNIQUE NOT NULL ,
	CDept CHAR(4) NOT NULL ,
	CNumber INT ,
	CTitle VARCHAR(30) ,
	CONSTRAINT s_pk PRIMARY KEY (CCallNum)
) ;

CREATE TABLE Enrollment (
	EID VARCHAR(4) UNIQUE NOT NULL ,
	YYear INT ,
	Semester VARCHAR(6) ,
	SID VARCHAR(10) UNIQUE NOT NULL ,
	PID VARCHAR(10) UNIQUE NOT NULL ,
	CCallNum VARCHAR(4),
	CONSTRAINT s_pk PRIMARY KEY (EID) ,
	CONSTRAINT p_fk1 FOREIGN KEY (SID) REFERENCES Student(SID) ,
	CONSTRAINT p_fk2 FOREIGN KEY (PID) REFERENCES Professor(PID) ,
	CONSTRAINT p_fk3 FOREIGN KEY (CCallNum) REFERENCES Course(CCallNum)
) ;

INSERT INTO Student
(SID, SFName, SLName, SEmail, SPhone)
VALUES
("1111", "James", "Marks", "jmas@uccs.edu", "555-1111") ,
("1222", "Jason", "Marks", "jmk@uccs.edu", "555-1111") ,
("1333", "Joe", "Smith", "joe@uccs.edu", "555-1111") ,
("1444", "John", "Smith", "john@uccs.edu", "555-5555") ,
("1555", "James", "Remington", "jrem@uccs.edu", NULL)
;

INSERT INTO Professor
(PID, PFName, PRank, PEmail)
VALUES
("2111", "James", "Ma", "Assistant Professor", "jma@uccs.edu") ,
("2222", "Jack", "Remington", "Dean", "jack@uccs.edu") ,
("2333", "Jim", "Johnsons", "Assistant Professor", "jim@uccs.edu") ,
("2444", "Jill", "Johnsons", "Associate Professor", "jill@uccs.edu") ,
("2555", "Jane", "Remington", "President", "jane@uccs.edu")
;

INSERT INTO Course
(CCallNum, CDept, CNumber, CTitle)
VALUES
("3111", "INFS", 3000, "MIS") ,
("3222", "INFS", 3000, "MIS) ,
("3333", "INFS", 3080, "Programming") ,
("3444", "ACCT", 1100, "Accounting Intro") ,
("3555", "MGMT", 2050, "Micro Econ")
;

INSERT INTO Enrollment
(EID, YYear, Semester, SID, PID, CCallNum)
VALUES
("4001", 2013, "Spring", "1111", "2111", "3111") ,
("4002", 2013, "Spring", "1111", "2222", "3444") ,
("4011", 2014, "Fall", "1111", "2111", "3111") ,
("4014", 2014, "Fall", "1222", "2111", "3111") ,
("4035", 2014, "Fall", "1444", "2111", "3111")
;

UPDATE Student
SET SFName = "Joseph", SEmail = "joseph@uccs.edu"
WHERE SFName = "Joe" AND SLName = "Smith"
;

DELETE
FROM Professor
WHERE PFName = "Jane" AND PLName = "Remington"
;