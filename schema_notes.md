# Hospital Management System – Schema Notes

## Overview
This database schema models a hospital management system that tracks departments, doctors, patients, appointments, and billing. It is designed to maintain data integrity, support efficient queries, and represent real-world hospital operations.

---

## 1. Departments
Table name: `Departments`

Attributes:
- `DeptID` – Primary key
- `DeptName` – Department name, unique

Purpose:
- Groups doctors into departments such as Cardiology, Pediatrics, and Orthopedics.
- One department can have many doctors.

Relationship:
- `Departments (1) to (N) Doctors`

---

## 2. Doctors
Table name: `Doctors`

Attributes:
- `DoctorID` – Primary key
- `Name` – Doctor's full name
- `Specialty` – Medical specialty
- `DeptID` – Foreign key referencing `Departments`

Purpose:
- Stores staff details and the department they belong to.
- Each doctor can attend multiple appointments.

Relationship:
- `Doctors (1) to (N) Appointments`

---

## 3. Patients
Table name: `Patients`

Attributes:
- `PatientID` – Primary key
- `Name` – Patient full name
- `DOB` – Date of birth
- `ContactInfo` – Phone or address information

Purpose:
- Stores patient contact and identification information.
- One patient can have many appointments.

Relationship:
- `Patients (1) to (N) Appointments`

---

## 4. Appointments
Table name: `Appointments`

Attributes:
- `AppointmentID` – Primary key
- `PatientID` – Foreign key referencing `Patients`
- `DoctorID` – Foreign key referencing `Doctors`
- `AppointmentDate` – Date of the appointment
- `Status` – Scheduled, Completed, Cancelled, or Rescheduled

Purpose:
- Connects patients and doctors for medical visits.
- Each appointment records one patient, one doctor, and the visit date.

Relationship:
- `Appointments (N) to (1) Patients`
- `Appointments (N) to (1) Doctors`
- `Appointments (1) to (1) Billing`

---

## 5. Billing
Table name: `Billing`

Attributes:
- `BillID` – Primary key
- `AppointmentID` – Foreign key referencing `Appointments`
- `Amount` – Total bill amount
- `PaymentStatus` – Pending, Paid, Failed, or Refunded

Purpose:
- Records payment details for each appointment.
- Each appointment has only one billing record.

Relationship:
- `Appointments (1) to (1) Billing`

---

## Relationship Summary
- Patients to Appointments: 1-to-many
- Doctors to Appointments: 1-to-many
- Departments to Doctors: 1-to-many
- Appointments to Billing: 1-to-1

---

## Normalization and Design Choices
This schema is normalized enough for a small to medium hospital system because:
- Repeated patient and doctor details are stored once in their respective tables.
- Appointments store relationships using foreign keys rather than duplicating all patient and doctor details.
- Billing is separated to keep financial data organized and distinct from clinical records.

---

## Integrity Constraints
The schema includes:
- Primary keys for unique identification
- Foreign key constraints for relational consistency
- `CHECK` constraints for valid appointment and payment statuses
- `UNIQUE` constraint on department names
- Indexes to improve lookup speed on frequently queried columns

---

## Example Use Cases
- Register a patient
- Assign a doctor to a department
- Schedule a consultation
- Record completion and billing after treatment
- Track payment status for each patient bill

---

## Notes
This database design ensures efficient management of hospital operations while preserving data integrity, reducing redundancy, and supporting straightforward reporting and future expansion.
