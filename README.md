## 🏥 Hospital Management System


## 💻 MySQL Database Management Project

> A complete relational database solution for managing patients, doctors, appointments, medical records, billing, and hospital departments using MySQL.

---

## 🌟 Project Overview

The Hospital Management System is a database-driven project developed using MySQL to efficiently manage essential hospital operations.

The system maintains information about patients, doctors, appointments, medical records, billing, and departments while demonstrating fundamental as well as advanced SQL concepts.

This project is designed to demonstrate practical knowledge of relational database management and SQL query development.

---

## 🎯 Project Objectives

- 👤 Manage patient information
- 👨‍⚕️ Manage doctor information
- 📅 Schedule and track appointments
- 🩺 Maintain medical records
- 💳 Manage hospital billing and payments
- 🏥 Organize doctors by departments
- 🔗 Maintain Primary Key and Foreign Key relationships
- 📊 Generate useful hospital reports
- 🧮 Perform data analysis using SQL
- 📚 Demonstrate fundamental and advanced SQL concepts

---

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| 🐬 MySQL | Database Management System |
| 📝 SQL | Database Queries |
| 💻 MySQL Workbench | SQL Development and Execution |

---

# 🗂️ Database Structure

The project contains 7 interconnected tables:

1. Patients
2. Doctors
3. Appointments
4. Medical_Records
5. Billing
6. Departments
7. Doctor_Department

### Database Relationship

Patients are connected with appointments, medical records, and billing.

Doctors are connected with appointments, medical records, and departments.

Appointments are connected with billing.

Doctors and departments are connected through the Doctor_Department mapping table.

---

# 📋 Database Tables

## 👤 1. Patients

The Patients table stores complete information about hospital patients.

### Important Fields

- patient_id — Primary Key
- name
- dob
- gender
- phone_number
- email
- address
- registration_date
- admission_date
- discharge_date

### Purpose

This table maintains patient registration and admission information.

---

## 👨‍⚕️ 2. Doctors

The Doctors table stores doctor information and consultation details.

### Important Fields

- doctor_id — Primary Key
- name
- specialization
- phone_number
- email
- available_days
- consultation_fee

### Purpose

This table maintains information about doctors and their specialization.

---

## 📅 3. Appointments

The Appointments table stores appointments between patients and doctors.

### Important Fields

- appointment_id — Primary Key
- patient_id — Foreign Key
- doctor_id — Foreign Key
- appointment_date
- status

### Appointment Status

- Scheduled
- Completed
- Cancelled

---

## 🩺 4. Medical Records

The Medical_Records table stores diagnosis and treatment information.

### Important Fields

- record_id — Primary Key
- patient_id — Foreign Key
- doctor_id — Foreign Key
- diagnosis
- prescription
- treatment_date

### Purpose

This table maintains the medical history of patients.

---

## 💳 5. Billing

The Billing table stores invoices and payment information.

### Important Fields

- invoice_id — Primary Key
- patient_id — Foreign Key
- appointment_id — Foreign Key
- amount
- payment_status
- payment_date

### Payment Status

- Paid
- Pending
- Cancelled

---

## 🏥 6. Departments

The Departments table stores hospital department information.

### Departments Included

- Cardiology
- Neurology
- Dermatology
- Orthopedics
- General Medicine

---

## 🔗 7. Doctor_Department

Doctor_Department is a mapping table that connects doctors with departments.

### Important Fields

- doctor_id — Foreign Key
- department_id — Foreign Key

### Key

A Composite Primary Key is created using:

doctor_id + department_id

---

# 🚀 SQL Concepts Covered

This project contains exactly 12 major SQL tasks.

---

# 1️⃣ CRUD OPERATIONS

CRUD stands for:

- CREATE
- READ
- UPDATE
- DELETE

### Operations Implemented

- Insert new patient
- Insert new doctor
- Insert new appointment
- Update patient information
- Delete old cancelled appointments
- Retrieve stored records

### Concepts Demonstrated

- INSERT
- SELECT
- UPDATE
- DELETE

---

# 2️⃣ SQL CLAUSES

The following SQL clauses are demonstrated:

### WHERE

Used to filter records based on conditions.

### HAVING

Used to filter grouped results.

### LIMIT

Used to restrict the number of returned records.

### Examples

- Patients registered recently
- Top highest-paying patients
- Doctors with consultation fees above a certain amount
- Patients spending more than a specified amount

---

# 3️⃣ SQL OPERATORS

The project demonstrates:

- AND
- OR
- NOT

### AND

Used when multiple conditions must be true.

Example:

Scheduled appointments AND a specific doctor.

### OR

Used when either condition can be true.

Example:

Cardiology OR Neurology doctors.

### NOT

Used to exclude specific conditions.

Example:

Patients who have NOT visited recently.

---

# 4️⃣ SORTING & GROUPING

The project demonstrates:

- ORDER BY
- GROUP BY

### ORDER BY

Used to sort records.

Examples:

- Doctors sorted by specialization
- Patients sorted by total spending
- Doctors ranked by patient count

### GROUP BY

Used to group similar records.

Examples:

- Patients per doctor
- Revenue per department
- Monthly revenue
- Monthly appointments

---

# 5️⃣ AGGREGATE FUNCTIONS

The following aggregate functions are used:

- COUNT()
- SUM()
- AVG()
- MAX()
- MIN()

### COUNT()

Used to count records.

Example:

Total number of doctors.

### SUM()

Used to calculate total values.

Example:

Total hospital revenue.

### AVG()

Used to calculate averages.

Example:

Average consultation fee.

### MAX()

Used to find the maximum value.

Example:

Highest consultation fee.

### MIN()

Used to find the minimum value.

Example:

Lowest consultation fee.

---

# 6️⃣ PRIMARY KEY & FOREIGN KEY RELATIONSHIPS

The database uses:

- Primary Keys
- Foreign Keys
- Composite Primary Keys

### Primary Key

A Primary Key uniquely identifies every record in a table.

Examples:

- Patients → patient_id
- Doctors → doctor_id
- Appointments → appointment_id
- Medical_Records → record_id
- Billing → invoice_id
- Departments → department_id

### Foreign Keys

Foreign Keys establish relationships between tables.

Examples:

Patients → Appointments

Doctors → Appointments

Patients → Medical_Records

Doctors → Medical_Records

Patients → Billing

Appointments → Billing

Doctors → Doctor_Department

Departments → Doctor_Department

---

# 7️⃣ SQL JOINS

The project demonstrates:

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN

### INNER JOIN

Returns matching records from both tables.

Example:

Doctors with their department names.

### LEFT JOIN

Returns all records from the left table and matching records from the right table.

Example:

All patients with their appointments.

### RIGHT JOIN

Returns all records from the right table and matching records from the left table.

Example:

All patients including patients without appointments.

### FULL OUTER JOIN

MySQL does not directly support FULL OUTER JOIN.

Therefore, the equivalent result is created using:

LEFT JOIN + UNION + RIGHT JOIN

---

# 8️⃣ SUBQUERIES

Subqueries are queries written inside another SQL query.

The project demonstrates subqueries for:

- Finding doctors who have handled more than 50 patients
- Finding the patient who spent the most
- Finding appointments handled by Dermatology doctors

### Benefits

Subqueries allow complex filtering and analysis without creating additional tables.

---

# 9️⃣ DATE & TIME FUNCTIONS

The project demonstrates date and time functions such as:

- CURDATE()
- DATEDIFF()
- DATE_FORMAT()
- MONTH()
- MONTHNAME()
- DATE_SUB()

### Examples

#### Hospital Stay Duration

DATEDIFF() is used to calculate the number of days between admission and discharge.

#### Monthly Appointment Analysis

MONTH() is used to extract the month from appointment dates.

#### Date Formatting

DATE_FORMAT() is used to display dates in a readable format.

#### Recent Records

DATE_SUB() is used to calculate previous dates.

---

# 🔟 STRING MANIPULATION FUNCTIONS

The project demonstrates:

- UPPER()
- LOWER()
- TRIM()
- COALESCE()

### UPPER()

Converts text into uppercase.

Example:

Patient names converted to uppercase.

### LOWER()

Converts text into lowercase.

### TRIM()

Removes unnecessary spaces from text.

### COALESCE()

Handles NULL values.

Example:

Missing phone numbers can be displayed as "Not Available".

---

# 1️⃣1️⃣ WINDOW FUNCTIONS

Advanced SQL window functions are used for analytical operations.

The project demonstrates:

- RANK()
- DENSE_RANK()
- SUM() OVER()
- COUNT() OVER()

### Applications

#### Doctor Ranking

Doctors can be ranked according to the number of patients treated.

#### Cumulative Revenue

Monthly revenue can be added progressively to generate cumulative revenue.

#### Running Appointment Total

A running count of appointments can be generated based on appointment dates.

---

# 1️⃣2️⃣ CASE EXPRESSIONS

CASE expressions are used to implement conditional logic.

### Patient Risk Classification

Patients are classified according to the number of medical records.

| Medical Records | Risk Level |
|---:|---|
| More than 5 | 🔴 High |
| 3 to 5 | 🟡 Medium |
| Less than 3 | 🟢 Low |

### Logic

- More than 5 medical records → High Risk
- 3 to 5 medical records → Medium Risk
- Less than 3 medical records → Low Risk

---

# 📊 Reports Generated

The database can generate multiple useful reports.

## 💰 Revenue Reports

- Total revenue collected
- Revenue by department
- Highest-paying patients
- Monthly revenue
- Cumulative revenue

## 👨‍⚕️ Doctor Reports

- Most visited doctor
- Doctor ranking
- Number of patients handled by each doctor
- Consultation fee analysis
- Doctors by specialization

## 👤 Patient Reports

- Recently registered patients
- Patient medical history
- Patient spending
- Hospital stay duration
- Patient risk classification

## 📅 Appointment Reports

- Scheduled appointments
- Completed appointments
- Cancelled appointments
- Monthly appointment statistics
- Running appointment totals

---

# ⚙️ How to Run the Project

## Step 1 — Install MySQL

Install:

- MySQL Server
- MySQL Workbench

---

## Step 2 — Open MySQL Workbench

Open MySQL Workbench and create a new SQL query tab.

---

## Step 3 — Run Database Setup

First execute the database setup SQL file.

The setup performs the following operations:

1. Creates the database
2. Creates all tables
3. Creates Primary Keys
4. Creates Foreign Keys
5. Creates table relationships
6. Inserts sample data

---

## Step 4 — Run the Queries

After successfully creating the database and inserting the sample data, execute the SQL query file containing the 12 tasks.

---

# 📁 Project Structure

Hospital-Management-System/

├── README.md

├── 01 DATABASE.SQL

└── 02 QUERIES.SQL

---

# 📄 File Description

## 01 DATABASE.SQL

This file contains:

- Database creation
- Table creation
- Primary Keys
- Foreign Keys
- Relationships
- Sample data
- Initial database configuration

---

## 02 QUERIES.SQL

This file contains exactly 12 tasks:

1. CRUD Operations
2. WHERE / HAVING / LIMIT
3. AND / OR / NOT
4. ORDER BY / GROUP BY
5. Aggregate Functions
6. Primary & Foreign Keys
7. SQL Joins
8. Subqueries
9. Date & Time Functions
10. String Functions
11. Window Functions
12. CASE Expressions

---

# 🔐 Data Integrity

Data integrity is maintained using:

- Primary Key constraints
- Foreign Key constraints
- NOT NULL constraints
- ENUM values
- Composite Primary Keys

These constraints ensure that related records remain consistent and valid.

---

# 📈 Project Workflow

The general workflow of the system is:

Patient Registration

↓

Doctor Selection

↓

Appointment Scheduling

↓

Medical Examination

↓

Medical Record Creation

↓

Billing

↓

Payment Tracking

↓

Reporting & Analysis

---

# 🧠 Learning Outcomes

This project demonstrates practical knowledge of:

- Database Design
- Relational Data Modeling
- Table Relationships
- Primary Keys
- Foreign Keys
- Composite Keys
- CRUD Operations
- SQL Clauses
- SQL Operators
- Sorting
- Grouping
- Aggregate Functions
- SQL Joins
- Subqueries
- Date Functions
- String Functions
- Window Functions
- CASE Expressions
- Data Analysis
- Data Integrity

---

# ⭐ Key Features

| Feature | Status |
|---|:---:|
| 👤 Patient Management | ✅ |
| 👨‍⚕️ Doctor Management | ✅ |
| 📅 Appointment Management | ✅ |
| 🩺 Medical Records | ✅ |
| 💳 Billing System | ✅ |
| 🏥 Department Management | ✅ |
| 🔑 Primary Keys | ✅ |
| 🔗 Foreign Keys | ✅ |
| 🔄 CRUD Operations | ✅ |
| 🔍 Filtering | ✅ |
| 📊 Grouping & Sorting | ✅ |
| 🔀 SQL Joins | ✅ |
| 🧩 Subqueries | ✅ |
| 📈 Aggregate Functions | ✅ |
| 📅 Date & Time Functions | ✅ |
| 🔤 String Functions | ✅ |
| 📊 Window Functions | ✅ |
| 🧠 CASE Expressions | ✅ |

---

# 🏆 Project Highlights

> A complete SQL-based Hospital Management System demonstrating practical implementation of relational database concepts and advanced SQL techniques.

### Suitable For

- 🎓 Academic Submission
- 💻 MySQL Practical
- 📚 SQL Learning
- 🧪 Database Practice
- 📊 Data Analysis
- 🗃️ Portfolio Project

---

# 🎓 Conclusion

The Hospital Management System provides a structured relational database for managing major hospital operations.

The project combines:

Database Design  
+  
Relationships  
+  
SQL Queries  
+  
Data Analysis

to create a practical and organized hospital database system.

It demonstrates both fundamental SQL concepts and advanced SQL techniques, making it suitable for academic submission and portfolio development.

---

# 📌 Project Information

| Category | Details |
|---|---|
| 🏥 Project | Hospital Management System |
| 🐬 Database | MySQL |
| 📝 Language | SQL |
| 💻 Environment | MySQL Workbench |
| 🗃️ Project Type | Relational Database Management System |
| 📋 Main Tasks | 12 |
| 🗂️ Tables | 7 |
| ✅ Status | Completed |

---

# 🌟 Final Note

This project demonstrates how SQL and relational database concepts can be used to solve a real-world hospital management problem.

The system is structured, scalable, and designed for learning, academic submission, and practical database development.

---

# 👨‍💻 Author

## Rakesh pedduri

**SQL & Data Analytics Learner**

### Technical Skills

`SQL` • `MySQL` • `Excel` • `Power BI` • `Python`

---

## 💙 Thank You

### 🐬 Built with MySQL & SQL

**Learn • Build • Query • Analyze • Improve 🚀**

---

## ⭐ Project Status

**COMPLETED ✅**
