#By Mandy Smock
#Homework 2, 02/14/2022
#Read and Search

USE IS3400 ;

SELECT *
FROM Student
;

SELECT *
FROM Student
WHERE SFName = "James"
;

SELECT PFName, PLName, PRank
FROM Professor
WHERE PFName = "Jill"
;

SELECT PFName, PLName, PRank
FROM Professor
WHERE PFName LIKE "%Ji%"
;

SELECT CCallNum, CTitle
FROM Course
WHERE CDept = "INFS"
;

SELECT DISTINCT CTitle
FROM Course
WHERE CDept = "INFS"
;

SELECT DISTINCT CTitle, YYear, Semester
FROM Enrollment AS e
INNER JOIN Course AS c
ON e.CCallNum = c.CCallNum
;

SELECT DISTINCT PFName, PLName, CTitle
FROM Enrollment AS e
INNER JOIN Professor AS p
ON e.PID = p.PID
INNER JOIN Course AS c
ON c.CCallNum = e.CCallNum
;