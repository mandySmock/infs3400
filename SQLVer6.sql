-- By Garrett Ball, Theresa Hornung, Travis McMillan, Mandy Smock
-- INFS 3400
-- 5.04.2022
-- Final SQL Project Ver. III

CREATE DATABASE HIIS ;

USE HIIS ;

-- -------------------------------------------------------------------------------------------------------------------------------------
-- TABLE CREATION SECTION FOLLOWS

CREATE TABLE Patients (
	PatientID CHAR(4) ,							
	PFName VARCHAR(50) ,							
	PLName VARCHAR(50) ,
	DOB DATE ,
	PPhoneNumber VARCHAR(20) ,
	PEmail VARCHAR(125),
	CONSTRAINT s_pk PRIMARY KEY (PatientID) 
	);
	
-- Foreign key check disable
SET foreign_key_checks = 0;	
	
CREATE TABLE Doctors (
	DoctorID CHAR(4) ,
	DFName VARCHAR(50) ,
	DLName VARCHAR(50) ,
	DepartmentID VARCHAR(30) ,
	CONSTRAINT d_pk1 PRIMARY KEY (DoctorID) ,
	CONSTRAINT d_fk1 FOREIGN KEY (DepartmentID) references Departments(DepartmentID)
	);
	
CREATE TABLE Departments (
	DepartmentID CHAR(4) ,
	DepartmentName VARCHAR(50) ,
	BuildingName VARCHAR(50) ,
	FloorNumber VARCHAR(4) ,
	HeadDoctorID VARCHAR(4) ,
	CONSTRAINT De_pk1 PRIMARY KEY (DepartmentID) ,
	CONSTRAINT De_fk1 FOREIGN KEY (HeadDoctorID) REFERENCES Doctors(DoctorID)
	);
	
-- Foreign key check reenable	
SET foreign_key_checks = 1;
	
CREATE TABLE Emergency_Contacts (
	ContactID CHAR(4) ,
	CFName VARCHAR(50) ,
	CLName VARCHAR(50) ,
	CPhoneNumber VARCHAR(20) ,
	CEmail VARCHAR(125) ,
	Relationship VARCHAR(15) ,
	CONSTRAINT ec_pk1 PRIMARY KEY (ContactID) 
	);

CREATE TABLE Treatments (
	TreatmentID CHAR(4) ,
	TDescription VARCHAR(100) ,
	DoctorID CHAR(4) ,
	CONSTRAINT t_pk1 PRIMARY KEY (TreatmentID) ,
	CONSTRAINT t_fk1 FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
	);

CREATE TABLE Hospital_Admissions	(
	AdmissionID CHAR(4) ,
	AdmissionDate DATE ,
	ReleaseDate DATE ,
	PatientID CHAR(4) ,
	DoctorID CHAR(4) ,
	ContactID CHAR(4) ,
	CONSTRAINT ha_pk1 PRIMARY KEY (AdmissionID) ,
	CONSTRAINT ha_fk1 FOREIGN KEY (PatientID) REFERENCES Patients(PatientID) ,
	CONSTRAINT ha_fk2 FOREIGN KEY (DoctorID) REFERENCES  Doctors(DoctorID) ,
	CONSTRAINT ha_fk3 FOREIGN KEY (ContactID) REFERENCES Emergency_Contacts(ContactID)
	);

CREATE TABLE Specialties (
	SpecialtyID CHAR(4) ,
	SpecialtyName VARCHAR(50) ,
	CONSTRAINT s_pk1 PRIMARY KEY (SpecialtyID)
	);
	
CREATE TABLE Doctor_Specialties (
	Doctor_Specialty_ID CHAR(4) ,
	DoctorID CHAR(4) ,
	SpecialtyID CHAR(4) ,
	CONSTRAINT ds_pk1 PRIMARY KEY (Doctor_Specialty_ID) ,
	CONSTRAINT ds_fk1 FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
	CONSTRAINT ds_fk2 FOREIGN KEY (SpecialtyID) REFERENCES Specialties(SpecialtyID)
	);

CREATE TABLE Admission_Treatment_Details (
	Admission_Treatment_ID CHAR(4) ,
	AdmissionID CHAR(4) ,
	TreatmentID CHAR(4) ,
	TreatmentDate DATE ,
	CONSTRAINT atd_pk1 PRIMARY KEY (Admission_Treatment_ID) ,
	CONSTRAINT atd_fk1 FOREIGN KEY (AdmissionID) REFERENCES Hospital_Admissions(AdmissionID) ,
	CONSTRAINT atd_fk2 FOREIGN KEY (TreatmentID) REFERENCES Treatments(TreatmentID) 
	);
	
-- TABLE CREATION SECTION ENDS	
-- -------------------------------------------------------------------------------------------------------------------------------------
-- DATA INSERTION SECTION BEGINS

INSERT INTO Patients
(PatientID, PFName, PLName, DOB, PPhoneNumber, PEmail)
VALUES
("1000", "Marissa", "Smith", "1994-11-30", "(719) 208-1109", "marysmith@gmail.com") ,
("1001", "Toni", "Howard", "2001-04-28", "(303) 513-9715", "thoward@gmail.com") ,
("1002", "Gary", "Bradshaw", "1975-01-05", "(859) 583-2461", "garyb2@yahoo.com") ,
("1003", "Tyler", "Morris", "2005-07-15", "(719) 925-6259", "tmorris@uccs.edu") ,
("1004", "Erin", "Bisel", "1991-09-08", "(317) 373-4517", "erinbisel@gmail.com") 
;

-- Foreign key check disable
SET foreign_key_checks = 0;

INSERT INTO Doctors
(DoctorID, DFName, DLName, DepartmentID)
VALUES
("2000", "Rebecca", "Jones", "3003") ,
("2001", "Jonathan", "Santamaria", "3000") ,
("2002", "Robert", "Jeong", "3004") ,
("2003", "Irene", "Lee", "3002") ,
("2004", "Nathan", "Elliot", "3001") ,
("2005", "Rebecca", "Ingram","3002") 
;

INSERT INTO Departments
(DepartmentID, DepartmentName, BuildingName, FloorNumber, HeadDoctorID)
VALUES
("3000", "Neurology", "WestTower", "3", "2001") ,
("3001", "Cardiology", "EastTower", "5", "2004") ,
("3002", "Obstetrics", "MainHall", "2", "2003") ,
("3003", "General Surgery", "WestTower", "4", "2000") ,
("3004", "Orthopedics", "MainHall", "3", "2002") 
;

-- Foreign key check reenable
SET foreign_key_checks = 1;

INSERT INTO Emergency_Contacts
(ContactID, CFName, CLName, CPhoneNumber, CEmail, Relationship)
VALUES
("4000", "Kevin", "Smith", "(859) 285-2237", "ksmith@gmail.com", "Father") ,
("4001", "Bradley", "Cox", "(303) 914-8496", "bcox@gmail.com", "Father") ,
("4002", "Lucille", "Bradshaw", "(719) 397-6479", "lball@yahoo.com", "Spouse") ,
("4003", "Michael", "Morris", "(719) 795-8651", "mikem3@gmail.com", "Grandparent") ,
("4004", "Marli", "Williams", "(317) 328-2958", "mwilliams@gmail.com", "Mother") 
;

INSERT INTO Treatments
(TreatmentID, TDescription, DoctorID)
VALUES
("5000", "Tissue Graft", "2003") ,
("5001", "EMG", "2001") ,
("5002", "Appendectomy", "2000"),
("5003", "Biopsy", "2004") ,
("5004", "Arthroplasty", "2002") ,
("5005", "X-Ray", "2005")
;

INSERT INTO Hospital_Admissions
(AdmissionID, AdmissionDate, ReleaseDate, PatientID, DoctorID, ContactID)
VALUES
("6000", "2021-03-25", "2021-04-01", "1001", "2003", "4001") ,
("6001", "2022-12-05", "2022-12-07", "1000", "2004", "4000") ,
("6002", "2019-10-01", "2019-10-09", "1004", "2001", "4004") ,
("6003", "2022-07-15", "2022-07-19", "1002", "2002", "4002") ,
("6004", "2020-12-20", "2020-12-21", "1003", "2000", "4003") ,
("6005", "2020-12-22", "2021-01-02", "1001", "2002", "4001")
;

INSERT INTO Specialties
(SpecialtyID, SpecialtyName)
VALUES
("7000", "Thoracic Surgery") ,
("7001", "Neuro-Muscular Medicine") ,
("7002", "Hip and Knee Replacement") ,
("7003", "Urogynecology") ,
("7004", "Cardio-Oncology") 
;

INSERT INTO Doctor_Specialties
(Doctor_Specialty_ID, DoctorID, SpecialtyID)
VALUES
("8000", "2000", "7000") ,
("8001", "2001", "7001") ,
("8002", "2002", "7002") ,
("8003", "2003", "7003") ,
("8004", "2004", "7004") ,
("8005", "2003", "7001") ,
("8006", "2005", "7004")
;

INSERT INTO Admission_Treatment_Details
(Admission_Treatment_ID, AdmissionID, TreatmentID, TreatmentDate)
VALUES
("9000", "6000", "5000", "2021-03-26") ,
("9001", "6001", "5003", "2022-12-06") ,
("9002", "6002", "5001", "2019-10-01") ,
("9003", "6003", "5004", "2022-07-16") ,
("9004", "6004", "5002", "2020-12-20") ,
("9005", "6004", "5001", "2020-12-20") ,
("9006", "6005", "5000", "2020-03-26")
;

-- DATA INSERTION SECTION ENDS
-- -------------------------------------------------------------------------------------------------------------------------------------
-- SELECT STATEMENT SECTION BEGINS


SELECT p.PatientID, p.PFName, p.PLName, ha.AdmissionDate, ha.ReleaseDate, d.DoctorID, d.DFName, d.DLName
FROM hospital_admissions AS ha 
INNER JOIN patients AS p
ON ha.PatientID = p.PatientID
INNER JOIN doctors AS d
ON ha.DoctorID = d.DoctorID
;

SELECT p.PatientID, p.PFName, p.PLName, d.DoctorID, d.DFName, d.DLName, temp.NumofTimes
FROM patients AS p
INNER JOIN (
	SELECT ha.PatientID, ha.DoctorID, COUNT(*) AS NumofTimes
	FROM hospital_admissions AS ha
	GROUP BY ha.PatientID, ha.DoctorID
) AS temp
ON p.PatientID = temp.PatientID
INNER JOIN doctors AS d
ON d.DoctorID = temp.DoctorID
;

SELECT ha.PatientID, p.PFName, p.PLName, ha.ContactID, ec.CFName, ec.CLName
FROM hospital_admissions AS ha
INNER JOIN patients AS p
ON ha.PatientID = p.PatientID
INNER JOIN emergency_contacts AS ec
ON ha.ContactID = ec.ContactID
ORDER BY ha.PatientID ASC
;

SELECT p2.PatientID, p2.PFName, p2.PLName, atd.TreatmentDate, t.TDescription, t.DoctorID, d.DFName, d.DLName
FROM hospital_admissions AS ha
INNER JOIN (
	SELECT p.PatientID
	FROM patients AS p
	WHERE p.PFName = "Toni" AND p.PLName = "Howard"
) AS temp 
ON ha.PatientID = temp.PatientID
INNER JOIN patients AS p2
ON temp.PatientID = p2.PatientID
INNER JOIN admission_treatment_details AS atd
ON ha.AdmissionID = atd.AdmissionID
INNER JOIN treatments AS t
ON atd.TreatmentID = t.TreatmentID
INNER JOIN doctors AS d
ON t.DoctorID = d.DoctorID
;

SELECT ds.DoctorID, d.DFName, d.DLName, s.SpecialtyName
FROM doctor_specialties AS ds
INNER JOIN doctors AS d
ON ds.DoctorID = d.DoctorID
INNER JOIN specialties AS s
ON ds.SpecialtyID = s.SpecialtyID
ORDER BY ds.DoctorID ASC
;

SELECT dep.DepartmentName, dep.HeadDoctorID, d.DFName, d.DLName, s.SpecialtyName
FROM departments AS dep
INNER JOIN doctors AS d
ON dep.HeadDoctorID = d.DoctorID
INNER JOIN doctor_specialties AS ds
ON d.DoctorID = ds.DoctorID
INNER JOIN specialties AS s
ON ds.SpecialtyID = s.SpecialtyID
ORDER BY dep.HeadDoctorID ASC
;

SELECT dep.DepartmentName, d.DoctorID, d.DFName, d.DLName, temp.NumSpecialties
FROM doctors AS d
INNER JOIN (
	SELECT ds.DoctorID, COUNT(*) AS NumSpecialties
	FROM doctor_specialties AS ds
	GROUP BY ds.DoctorID
) AS temp
ON d.DoctorID = temp.DoctorID
INNER JOIN departments AS dep
ON d.DepartmentID = dep.DepartmentID
;

-- SELECT STATEMENT SECTION ENDS
-- -------------------------------------------------------------------------------------------------------------------------------------
-- End of Program