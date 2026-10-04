-- Transaction Example for Hospital Management System
-- This example simulates a patient paying for an appointment bill.

BEGIN;

-- Check if the appointment exists and is linked to a billing record
SELECT a.AppointmentID, a.PatientID, a.DoctorID, b.BillID, b.Amount, b.PaymentStatus
FROM Appointments a
JOIN Billing b ON a.AppointmentID = b.AppointmentID
WHERE a.AppointmentID = 2;

-- Update payment status to Paid
UPDATE Billing
SET PaymentStatus = 'Paid', Amount = 1800.00
WHERE AppointmentID = 2;

-- Record a log entry in a separate table (example only)
-- CREATE TABLE PaymentAuditLog (...);
-- INSERT INTO PaymentAuditLog (AppointmentID, Action, Timestamp)
-- VALUES (2, 'Payment Received', CURRENT_DATE);

COMMIT;

-- If an error occurs, the transaction can be rolled back instead:
-- ROLLBACK;

-- Example of a transaction that should rollback if a constraint fails:
BEGIN;

UPDATE Billing
SET Amount = -500.00
WHERE AppointmentID = 2;

-- This will fail if a CHECK constraint rejects negative values.
-- ROLLBACK;

COMMIT;
