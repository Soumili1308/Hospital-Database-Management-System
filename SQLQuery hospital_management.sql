create database hospital_management
use hospital_management

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Gender VARCHAR(10),
    Age INT,
    PhoneNumber NUMERIC(10,0),
    Email VARCHAR(100),
    Address VARCHAR(200)
);

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100),
    PhoneNumber NUMERIC(10,0),
    Email VARCHAR(100),
    Department VARCHAR(100)
);

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATETIME,
    Description VARCHAR(100),
    CONSTRAINT fk_patient_appointment FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    CONSTRAINT fk_doctor_appointment FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE Rooms (
    RoomID INT PRIMARY KEY,
    RoomNumber INT,
    RoomType VARCHAR(50),
    Capacity INT
);

CREATE TABLE Inpatients (
    InpatientID INT PRIMARY KEY,
    PatientID INT,
    AdmissionDate DATE,
    DischargeDate DATE,
    RoomID INT,
    CONSTRAINT fk_patient_inpatient FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    CONSTRAINT fk_room_inpatient FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
);

CREATE TABLE Outpatients (
    OutpatientID INT PRIMARY KEY,
    PatientID INT,
    VisitDate DATETIME,
    Description VARCHAR(100),
    CONSTRAINT fk_patient_outpatient FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

CREATE TABLE Bills (
    BillID INT PRIMARY KEY,
    PatientID INT,
    BillDate DATE,
	Deposited DECIMAL(10,2),
	Due DECIMAL(10,2),
    Amount DECIMAL(10, 2),
    Description VARCHAR(100),
    CONSTRAINT fk_patient_bill FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

CREATE TABLE Reports (
    ReportID INT PRIMARY KEY,
    PatientID INT,
	DoctorID INT,
    ReportDate DATE,
    ReportType VARCHAR(50),
    Description VARCHAR(50),
    CONSTRAINT fk_patient_report FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
	CONSTRAINT fk_doctor_report FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

INSERT INTO Patients (PatientID, FirstName, LastName, Gender, Age, PhoneNumber, Email, Address)
VALUES
    (1001,'Ranita', 'Chaudhury', 'F',38, '9078563421', 'ranitac@gmail.com', 'Topsia'),
    (1002,'Pritam', 'Banerjee', 'M',59, '9078563422', 'pb@gmail.com', 'Majherhat'),
	(1003,'Debabrata', 'Roy', 'M', 67,'9078663421', 'droy@gmail.com', 'Newtown'),
	(1004,'Mahua', 'Chakraborty', 'F',78, '9077563421', 'mahua@gmail.com', 'Barasat'),
	(1005,'Srijita', 'Dutta', 'F',27, '9078563441', 'sd@gmail.com', 'Dumdum');

INSERT INTO Doctors (DoctorID, FirstName, LastName, Specialization, PhoneNumber, Email, Department)
VALUES
    (101, 'Dr. Bishal', 'Sharma', 'Cardiologist', '8970463521', 'bsharma@gmail.com', 'Cardiology'),
    (102, 'Dr. Astha', 'Singh', 'Gynecologist', '8976463521', 'astha@gmail.com', 'Gynecology'),
	(103, 'Dr. Subhagata', 'Sengupta', 'Orthopedic Surgeon', '8970465521', 'ssengupta@gmail.com', 'Orthopedics'),
	(104, 'Dr. Kajol', 'Dey', 'Oncologist', '8970463511', 'kd@gmail.com', 'Oncology');

INSERT INTO Appointments (AppointmentID,PatientID, DoctorID, AppointmentDate, Description)
VALUES
    (1010,1002, 101, '2023-12-20 10:00', 'Regular checkup'),
    (1011, 1004, 103, '2023-12-15 14:30', 'Orthopedic consultation'),
	(1012,1005, 102, '2023-12-18 11:30', 'Regular consultation'),
	(1013,1003, 104, '2023-12-13 15:00', 'Reports & Medication');

INSERT INTO Rooms (RoomID, RoomNumber, RoomType, Capacity)
VALUES
	(1, 1, 'SDU', 3),
    (2, 2, 'ICU', 2),
	(3, 3, 'Emergency', 3);

INSERT INTO Inpatients (InpatientID,PatientID, AdmissionDate, DischargeDate, RoomID)
VALUES
    (1111, 1001, '2023-10-07', '2023-10-16', 1),
    (1112, 1004, '2023-11-05', '2023-11-15', 1);

INSERT INTO Outpatients (OutpatientID,PatientID, VisitDate, Description)
VALUES
    (1110, 1002, '2023-12-05 08:30', 'Follow-up appointment'),
    (1210, 1005, '2023-12-10 15:45', 'USG');

INSERT INTO Bills (BillID,PatientID, BillDate,Deposited, Due, Amount, Description)
VALUES
    (1101,1001, '2023-10-16', 500.00, 300.00, 800.00, 'Inpatient charges'),
    (1102, 1005, '2023-12-10', 250.00, 250.00,500.00, 'Outpatient consultation');

INSERT INTO Reports (ReportId, PatientID,DoctorID, ReportDate, ReportType, Description)
VALUES
    (01,1005, 102,'2023-12-10', 'USG', 'Lower Abdomein evalution'),
    (02,1003, 104,'2023-02-20', 'Biopsy', 'Further Medication');
