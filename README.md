# Alali_John_Boma_2026AMIT0094_AdvancedDatabasePortfolio

Hospital Management System portfolio for MIT 8103 Advanced Database Systems CA (MIVA Open University, 2026/2027). This project includes the database schema, sample records, and supporting notes for the hospital management system design.

## Portfolio 1: Database Design

This project models a Hospital Management System with the following main entities:
- Departments
- Doctors
- Patients
- Appointments
- Billing

## Included Files
- [schema.sql](schema.sql) — PostgreSQL schema
- [schema_mysql.sql](schema_mysql.sql) — MySQL schema
- [schema_sqlserver.sql](schema_sqlserver.sql) — SQL Server schema
- [schema_sqlite.sql](schema_sqlite.sql) — SQLite schema
- [schema_notes.md](schema_notes.md) — Design explanation and entity relationships
- [ER_Diagram.md](ER_Diagram.md) — ER diagram in Mermaid format
- [sample_data_postgresql.sql](sample_data_postgresql.sql) — PostgreSQL sample inserts
- [sample_data_mysql.sql](sample_data_mysql.sql) — MySQL sample inserts
- [sample_data_sqlserver.sql](sample_data_sqlserver.sql) — SQL Server sample inserts
- [sample_data_sqlite.sql](sample_data_sqlite.sql) — SQLite sample inserts
- [hospital_queries.sql](hospital_queries.sql) — common SQL queries for reporting and analysis
- [transaction_example.sql](transaction_example.sql) — example transaction for payment processing
- [portfolio_submission.md](portfolio_submission.md) — polished portfolio summary for submission

## ER Diagram
See [ER_Diagram.md](ER_Diagram.md) for the Mermaid ER diagram and relationship overview.

## Notes
This schema ensures referential integrity, supports appointment tracking, and allows billing information to be linked to each medical consultation. It can be extended later to include pharmacy, prescriptions, wards, and staff management.
