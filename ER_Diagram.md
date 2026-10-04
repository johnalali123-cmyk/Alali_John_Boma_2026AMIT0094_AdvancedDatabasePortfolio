# Hospital Management System ER Diagram

```mermaid
erDiagram
    DEPARTMENTS ||--o{ DOCTORS : has
    PATIENTS ||--o{ APPOINTMENTS : books
    DOCTORS ||--o{ APPOINTMENTS : attends
    APPOINTMENTS ||--|| BILLING : generates

    DEPARTMENTS {
        int DeptID PK
        varchar DeptName
    }

    DOCTORS {
        int DoctorID PK
        varchar Name
        varchar Specialty
        int DeptID FK
    }

    PATIENTS {
        int PatientID PK
        varchar Name
        date DOB
        varchar ContactInfo
    }

    APPOINTMENTS {
        int AppointmentID PK
        int PatientID FK
        int DoctorID FK
        date AppointmentDate
        varchar Status
    }

    BILLING {
        int BillID PK
        int AppointmentID FK
        decimal Amount
        varchar PaymentStatus
    }
```

## Relationship Summary
- One department has many doctors.
- One patient can have many appointments.
- One doctor can attend many appointments.
- Each appointment generates one billing record.
- Each billing record belongs to exactly one appointment.
