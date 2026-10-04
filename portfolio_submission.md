# Hospital Management System Database Design

## Introduction
This project models a hospital management database designed to store and manage key operational data such as departments, doctors, patients, appointments, and billing. The database supports essential hospital activities like appointment scheduling, clinical staff assignment, and payment tracking.

## Objective
The main objective of this design is to create a relational database that ensures data integrity, reduces redundancy, and supports efficient retrieval of medical and financial information. The system is structured so that each patient, doctor, appointment, and bill is recorded in a way that is consistent and auditable.

## Entities and Relationships
The system contains five main entities:

1. Departments – stores departments such as Cardiology and Pediatrics.
2. Doctors – stores doctor details and their department assignments.
3. Patients – stores patient identity and contact information.
4. Appointments – links patients and doctors for medical visits.
5. Billing – records financial information tied to each appointment.

The relationships are defined as follows:
- A department has many doctors.
- A patient can have many appointments.
- A doctor can attend many appointments.
- Each appointment generates one billing record.

## Data Integrity
The schema includes primary keys, foreign keys, and validation rules to maintain referential integrity and reliable records. For example:
- Each appointment references a valid patient and doctor.
- Each bill is linked to exactly one appointment.
- Appointment status and payment status are restricted to valid values.
- Unique constraints prevent duplicate department names.

## Benefits of the Design
This database design is suitable for a hospital management system because it:
- organizes operational data clearly,
- avoids duplication of patient and doctor records,
- makes reporting easier through structured relationships,
- allows billing and appointment management to be tracked efficiently,
- can be expanded later with modules such as prescriptions, wards, or pharmacy operations.

## Example Queries
The database supports useful queries such as:
- listing doctors by department,
- retrieving patient appointment history,
- identifying unpaid bills,
- calculating total appointment revenue by department,
- checking scheduled appointments for specific dates.

## Conclusion
The Hospital Management System database is a practical and scalable design for managing core hospital processes. It balances normalization, integrity, and usability, making it suitable for both academic portfolio use and real-world adaptation.
