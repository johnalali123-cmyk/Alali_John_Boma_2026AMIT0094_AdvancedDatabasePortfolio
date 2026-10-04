-- Hospital Management System Schema
-- MySQL-compatible SQL script

DROP TABLE IF EXISTS Billing;
DROP TABLE IF EXISTS Appointments;
DROP TABLE IF EXISTS Doctors;
DROP TABLE IF EXISTS Patients;
DROP TABLE IF EXISTS Departments;

CREATE TABLE Departments (
    DeptID INT AUTO_INCREMENT PRIMARY KEY,
    DeptName VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    DOB DATE NOT NULL,
    ContactInfo VARCHAR(255) NOT NULL
);

CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    Specialty VARCHAR(100) NOT NULL,
    DeptID INT NOT NULL,
    CONSTRAINT fk_doctors_department
        FOREIGN KEY (DeptID)
        REFERENCES Departments(DeptID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATE NOT NULL,
    Status VARCHAR(20) NOT NULL DEFAULT 'Scheduled'
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
    BillID INT AUTO_INCREMENT PRIMARY KEY,
    AppointmentID INT NOT NULL UNIQUE,
    Amount DECIMAL(10,2) NOT NULL CHECK (Amount >= 0),
    PaymentStatus VARCHAR(20) NOT NULL DEFAULT 'Pending'
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
