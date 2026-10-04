-- Hospital Management System Schema
-- SQL Server-compatible SQL script

IF OBJECT_ID('Billing', 'U') IS NOT NULL DROP TABLE Billing;
IF OBJECT_ID('Appointments', 'U') IS NOT NULL DROP TABLE Appointments;
IF OBJECT_ID('Doctors', 'U') IS NOT NULL DROP TABLE Doctors;
IF OBJECT_ID('Patients', 'U') IS NOT NULL DROP TABLE Patients;
IF OBJECT_ID('Departments', 'U') IS NOT NULL DROP TABLE Departments;

CREATE TABLE Departments (
    DeptID INT IDENTITY(1,1) PRIMARY KEY,
    DeptName NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Patients (
    PatientID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(150) NOT NULL,
    DOB DATE NOT NULL,
    ContactInfo NVARCHAR(255) NOT NULL
);

CREATE TABLE Doctors (
    DoctorID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(150) NOT NULL,
    Specialty NVARCHAR(100) NOT NULL,
    DeptID INT NOT NULL,
    CONSTRAINT fk_doctors_department
        FOREIGN KEY (DeptID)
        REFERENCES Departments(DeptID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE Appointments (
    AppointmentID INT IDENTITY(1,1) PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATE NOT NULL,
    Status NVARCHAR(20) NOT NULL DEFAULT 'Scheduled'
        CHECK (Status IN ('Scheduled', 'Completed', 'Cancelled', 'Rescheduled')),
    CONSTRAINT fk_appointments_patient
        FOREIGN KEY (PatientID)
        REFERENCES Patients(PatientID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_appointments_doctor
        FOREIGN KEY (DoctorID)
        REFERENCES Doctors(DoctorID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE Billing (
    BillID INT IDENTITY(1,1) PRIMARY KEY,
    AppointmentID INT NOT NULL UNIQUE,
    Amount DECIMAL(10,2) NOT NULL CHECK (Amount >= 0),
    PaymentStatus NVARCHAR(20) NOT NULL DEFAULT 'Pending'
        CHECK (PaymentStatus IN ('Pending', 'Paid', 'Failed', 'Refunded')),
    CONSTRAINT fk_billing_appointment
        FOREIGN KEY (AppointmentID)
        REFERENCES Appointments(AppointmentID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE INDEX idx_doctors_deptid ON Doctors(DeptID);
CREATE INDEX idx_appointments_patientid ON Appointments(PatientID);
CREATE INDEX idx_appointments_doctorid ON Appointments(DoctorID);
CREATE INDEX idx_billing_paymentstatus ON Billing(PaymentStatus);
