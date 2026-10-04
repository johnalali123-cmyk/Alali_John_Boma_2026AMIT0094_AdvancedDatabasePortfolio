# Hospital Management System – Schema Notes

## 🏥 Overview
This schema models a hospital management system that handles patients, doctors, appointments, departments, and billing.

---

## 👤 Patients
- **PatientID** (Primary Key)
- Name
- DOB
- ContactInfo

Each patient can book multiple appointments.

---

## 👨‍⚕️ Doctors
- **DoctorID** (Primary Key)
- Name
- Specialty
- DeptID (Foreign Key → Departments)

Each doctor belongs to one department and can handle many appointments.

---

## 📅 Appointments
- **AppointmentID** (Primary Key)
- PatientID (Foreign Key → Patients)
- DoctorID (Foreign Key → Doctors)
- Date
- Status

Each appointment links one patient and one doctor.

---

## 🏢 Departments
- **DeptID** (Primary Key)
- DeptName

Each department can have multiple doctors.

---

## 💳 Billing
- **BillID** (Primary Key)
- AppointmentID (Foreign Key → Appointments)
- Amount
- PaymentStatus

Each appointment generates one billing record.

---

## 🔗 Relationships Summary
- Patients **(1‑N)** Appointments  
- Doctors **(1‑N)** Appointments  
- Departments **(1‑N)** Doctors  
- Appointments **(1‑1)** Billing

---

## 🧠 Notes
This design ensures data integrity through primary and foreign keys, supports scalability, and maintains clear relationships between entities.
