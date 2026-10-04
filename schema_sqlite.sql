-- Hospital Management System Schema
-- SQLite-compatible SQL script

DROP TABLE IF EXISTS Billing;
DROP TABLE IF EXISTS Appointments;
DROP TABLE IF EXISTS Doctors;
DROP TABLE IF EXISTS Patients;
DROP TABLE IF EXISTS Departments;

CREATE TABLE Departments (
    DeptID INTEGER PRIMARY KEY AUTOINCREMENT,
    DeptName TEXT NOT NULL UNIQUE
);

CREATE TABLE Patients (
    PatientID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    DOB TEXT NOT NULL,
    ContactInfo TEXT NOT NULL
);

CREATE TABLE Doctors (
    DoctorID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Specialty TEXT NOT NULL,
    DeptID INTEGER NOT NULL,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

CREATE TABLE Appointments (
    AppointmentID INTEGER PRIMARY KEY AUTOINCREMENT,
    PatientID INTEGER NOT NULL,
    DoctorID INTEGER NOT NULL,
    AppointmentDate TEXT NOT NULL,
    Status TEXT NOT NULL DEFAULT 'Scheduled'
        CHECK (Status IN ('Scheduled', 'Completed', 'Cancelled', 'Rescheduled')),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE Billing (
    BillID INTEGER PRIMARY KEY AUTOINCREMENT,
    AppointmentID INTEGER NOT NULL UNIQUE,
    Amount REAL NOT NULL CHECK (Amount >= 0),
    PaymentStatus TEXT NOT NULL DEFAULT 'Pending'
        CHECK (PaymentStatus IN ('Pending', 'Paid', 'Failed', 'Refunded')),
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);

CREATE INDEX idx_doctors_deptid ON Doctors(DeptID);
CREATE INDEX idx_appointments_patientid ON Appointments(PatientID);
CREATE INDEX idx_appointments_doctorid ON Appointments(DoctorID);
CREATE INDEX idx_billing_paymentstatus ON Billing(PaymentStatus);
