-- Hospital Management System Query Examples
-- These queries demonstrate common reporting and data retrieval tasks.

-- 1. View all departments and their doctors
SELECT d.DeptName, doc.Name AS DoctorName, doc.Specialty
FROM Departments d
LEFT JOIN Doctors doc ON d.DeptID = doc.DeptID
ORDER BY d.DeptName, doc.Name;

-- 2. View all appointments with patient and doctor details
SELECT a.AppointmentID,
       p.Name AS PatientName,
       doc.Name AS DoctorName,
       a.AppointmentDate,
       a.Status
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors doc ON a.DoctorID = doc.DoctorID
ORDER BY a.AppointmentDate;

-- 3. Show billing records with payment status
SELECT p.Name AS PatientName,
       doc.Name AS DoctorName,
       b.Amount,
       b.PaymentStatus
FROM Billing b
JOIN Appointments a ON b.AppointmentID = a.AppointmentID
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors doc ON a.DoctorID = doc.DoctorID
ORDER BY b.PaymentStatus, b.Amount DESC;

-- 4. Find patients with unpaid bills
SELECT p.PatientID, p.Name, SUM(b.Amount) AS TotalOutstanding
FROM Patients p
JOIN Appointments a ON p.PatientID = a.PatientID
JOIN Billing b ON a.AppointmentID = b.AppointmentID
WHERE b.PaymentStatus IN ('Pending', 'Failed')
GROUP BY p.PatientID, p.Name
ORDER BY TotalOutstanding DESC;

-- 5. Count appointments by doctor
SELECT doc.Name AS DoctorName,
       COUNT(a.AppointmentID) AS TotalAppointments
FROM Doctors doc
LEFT JOIN Appointments a ON doc.DoctorID = a.DoctorID
GROUP BY doc.Name
ORDER BY TotalAppointments DESC;

-- 6. Find completed appointments for a patient
SELECT a.AppointmentID, a.AppointmentDate, doc.Name AS DoctorName, a.Status
FROM Appointments a
JOIN Doctors doc ON a.DoctorID = doc.DoctorID
WHERE a.PatientID = 1 AND a.Status = 'Completed';

-- 7. Calculate total revenue by department
SELECT d.DeptName,
       SUM(b.Amount) AS TotalRevenue
FROM Billing b
JOIN Appointments a ON b.AppointmentID = a.AppointmentID
JOIN Doctors doc ON a.DoctorID = doc.DoctorID
JOIN Departments d ON doc.DeptID = d.DeptID
GROUP BY d.DeptName
ORDER BY TotalRevenue DESC;

-- 8. Find all scheduled appointments for today (example date)
SELECT *
FROM Appointments
WHERE AppointmentDate = '2026-10-04' AND Status = 'Scheduled';
