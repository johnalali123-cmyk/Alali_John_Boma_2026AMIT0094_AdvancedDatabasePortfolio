-- Sample data for Hospital Management System (PostgreSQL)

INSERT INTO Departments (DeptID, DeptName) VALUES
    (1, 'Cardiology'),
    (2, 'Pediatrics'),
    (3, 'Orthopedics'),
    (4, 'Emergency Medicine');

INSERT INTO Patients (PatientID, Name, DOB, ContactInfo) VALUES
    (1, 'John Smith', '1988-04-15', 'john.smith@gmail.com, +1234567890'),
    (2, 'Mary Johnson', '1995-08-22', 'mary.johnson@gmail.com, +1234567891'),
    (3, 'Samuel Okafor', '2012-01-10', 'samuel.okafor@gmail.com, +1234567892'),
    (4, 'Grace Boma', '1976-11-30', 'grace.boma@gmail.com, +1234567893');

INSERT INTO Doctors (DoctorID, Name, Specialty, DeptID) VALUES
    (1, 'Dr. Anna Mensah', 'Cardiologist', 1),
    (2, 'Dr. Peter Adebayo', 'Pediatrician', 2),
    (3, 'Dr. Daniel Kofi', 'Orthopedic Surgeon', 3),
    (4, 'Dr. Linda Thompson', 'Emergency Physician', 4);

INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDate, Status) VALUES
    (1, 1, 1, '2026-10-01', 'Completed'),
    (2, 2, 2, '2026-10-02', 'Scheduled'),
    (3, 3, 2, '2026-10-03', 'Completed'),
    (4, 4, 4, '2026-10-04', 'Cancelled');

INSERT INTO Billing (BillID, AppointmentID, Amount, PaymentStatus) VALUES
    (1, 1, 2500.00, 'Paid'),
    (2, 2, 1800.00, 'Pending'),
    (3, 3, 1200.00, 'Paid'),
    (4, 4, 0.00, 'Refunded');
