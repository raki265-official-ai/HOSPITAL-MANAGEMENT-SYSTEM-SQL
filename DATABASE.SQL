/* =========================================================
   HOSPITAL MANAGEMENT SYSTEM
   PART 1 - DATABASE, TABLES AND SAMPLE DATA
   ========================================================= */

DROP DATABASE IF EXISTS Hospital_Management;

CREATE DATABASE Hospital_Management;

USE Hospital_Management;


/* =========================================================
   1. PATIENTS TABLE
   ========================================================= */

CREATE TABLE Patients
(
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    dob DATE,
    gender VARCHAR(10),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(200),
    registration_date DATE,
    admission_date DATE,
    discharge_date DATE
);


/* =========================================================
   2. DOCTORS TABLE
   ========================================================= */

CREATE TABLE Doctors
(
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    available_days VARCHAR(100),
    consultation_fee DECIMAL(10,2)
);


/* =========================================================
   3. APPOINTMENTS TABLE
   ========================================================= */

CREATE TABLE Appointments
(
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,

    patient_id INT,
    doctor_id INT,
    appointment_date DATE,

    status ENUM
    (
        'Scheduled',
        'Completed',
        'Cancelled'
    ),

    FOREIGN KEY (patient_id)
        REFERENCES Patients(patient_id),

    FOREIGN KEY (doctor_id)
        REFERENCES Doctors(doctor_id)
);


/* =========================================================
   4. MEDICAL_RECORDS TABLE
   ========================================================= */

CREATE TABLE Medical_Records
(
    record_id INT PRIMARY KEY AUTO_INCREMENT,

    patient_id INT,
    doctor_id INT,
    diagnosis VARCHAR(200),
    prescription VARCHAR(500),
    treatment_date DATE,

    FOREIGN KEY (patient_id)
        REFERENCES Patients(patient_id),

    FOREIGN KEY (doctor_id)
        REFERENCES Doctors(doctor_id)
);


/* =========================================================
   5. BILLING TABLE
   ========================================================= */

CREATE TABLE Billing
(
    invoice_id INT PRIMARY KEY AUTO_INCREMENT,

    patient_id INT,
    appointment_id INT,
    amount DECIMAL(10,2),

    payment_status ENUM
    (
        'Paid',
        'Pending',
        'Cancelled'
    ),

    payment_date DATE,

    FOREIGN KEY (patient_id)
        REFERENCES Patients(patient_id),

    FOREIGN KEY (appointment_id)
        REFERENCES Appointments(appointment_id)
);


/* =========================================================
   6. DEPARTMENTS TABLE
   ========================================================= */

CREATE TABLE Departments
(
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100)
);


/* =========================================================
   7. DOCTOR_DEPARTMENT MAPPING TABLE
   ========================================================= */

CREATE TABLE Doctor_Department
(
    doctor_id INT,
    department_id INT,

    PRIMARY KEY (doctor_id, department_id),

    FOREIGN KEY (doctor_id)
        REFERENCES Doctors(doctor_id),

    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id)
);


/* =========================================================
   INSERT PATIENT DATA
   ========================================================= */

INSERT INTO Patients
(
    name,
    dob,
    gender,
    phone_number,
    email,
    address,
    registration_date,
    admission_date,
    discharge_date
)
VALUES
('Rahul Sharma',
 '1998-05-12',
 'Male',
 '9876543210',
 'rahul@gmail.com',
 'Delhi',
 '2025-01-10',
 '2025-01-15',
 '2025-01-20'),

('Priya Singh',
 '1995-08-20',
 'Female',
 '9876543211',
 'priya@gmail.com',
 'Mumbai',
 '2025-03-12',
 '2025-03-15',
 '2025-03-18'),

('Amit Kumar',
 '1990-02-15',
 'Male',
 '9876543212',
 'amit@gmail.com',
 'Pune',
 '2024-06-10',
 '2024-06-15',
 '2024-06-25'),

('Sneha Patel',
 '2000-11-25',
 'Female',
 NULL,
 'sneha@gmail.com',
 'Ahmedabad',
 '2025-05-20',
 '2025-05-22',
 '2025-05-27'),

('Arjun Mehta',
 '1988-01-10',
 'Male',
 '9876543214',
 'arjun@gmail.com',
 'Jaipur',
 '2024-04-15',
 '2024-04-18',
 '2024-04-30'),

('Neha Verma',
 '1997-09-05',
 'Female',
 '9876543215',
 'neha@gmail.com',
 'Delhi',
 '2025-06-10',
 '2025-06-12',
 '2025-06-15'),

('Vikram Rao',
 '1985-03-18',
 'Male',
 '9876543216',
 'vikram@gmail.com',
 'Hyderabad',
 '2024-02-10',
 '2024-02-15',
 '2024-02-25'),

('Pooja Joshi',
 '1999-12-01',
 'Female',
 '9876543217',
 'pooja@gmail.com',
 'Bangalore',
 '2025-07-01',
 '2025-07-03',
 '2025-07-08'),

('Karan Kapoor',
 '1996-06-15',
 'Male',
 '9876543218',
 'karan@gmail.com',
 'Chennai',
 '2026-01-10',
 NULL,
 NULL),

('Meena Iyer',
 '1993-04-22',
 'Female',
 '9876543219',
 'meena@gmail.com',
 'Kolkata',
 '2026-02-15',
 NULL,
 NULL);


/* =========================================================
   INSERT DOCTOR DATA
   ========================================================= */

INSERT INTO Doctors
(
    name,
    specialization,
    phone_number,
    email,
    available_days,
    consultation_fee
)
VALUES
('Dr. Raj Malhotra',
 'Cardiology',
 '9000000001',
 'raj@hospital.com',
 'Monday, Wednesday, Friday',
 1500),

('Dr. Anjali Gupta',
 'Neurology',
 '9000000002',
 'anjali@hospital.com',
 'Tuesday, Thursday',
 1800),

('Dr. Amit Shah',
 'Dermatology',
 '9000000003',
 'amit@hospital.com',
 'Monday, Thursday, Saturday',
 1200),

('Dr. Neeraj Singh',
 'Orthopedics',
 '9000000004',
 'neeraj@hospital.com',
 'Monday, Tuesday, Wednesday',
 1000),

('Dr. Kavita Rao',
 'General Medicine',
 '9000000005',
 'kavita@hospital.com',
 'Tuesday, Friday, Saturday',
 800),

('Dr. Rohan Mehta',
 'Cardiology',
 '9000000006',
 'rohan@hospital.com',
 'Wednesday, Thursday, Saturday',
 2000);


/* =========================================================
   INSERT DEPARTMENT DATA
   ========================================================= */

INSERT INTO Departments
(
    department_name
)
VALUES
('Cardiology'),
('Neurology'),
('Dermatology'),
('Orthopedics'),
('General Medicine');


/* =========================================================
   INSERT DOCTOR-DEPARTMENT DATA
   ========================================================= */

INSERT INTO Doctor_Department
(
    doctor_id,
    department_id
)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,1);


/* =========================================================
   INSERT APPOINTMENT DATA
   ========================================================= */

INSERT INTO Appointments
(
    patient_id,
    doctor_id,
    appointment_date,
    status
)
VALUES
(1,1,'2025-01-20','Completed'),
(1,2,'2025-02-15','Completed'),
(2,1,'2025-03-20','Completed'),
(2,3,'2025-04-10','Completed'),
(3,4,'2024-07-15','Completed'),
(4,3,'2025-06-20','Scheduled'),
(5,5,'2024-05-10','Completed'),
(6,6,'2025-07-15','Completed'),
(7,1,'2024-03-10','Completed'),
(8,3,'2025-07-20','Cancelled'),
(9,6,'2026-01-20','Completed'),
(10,2,'2026-02-20','Scheduled');


/* =========================================================
   INSERT MEDICAL RECORD DATA
   ========================================================= */

INSERT INTO Medical_Records
(
    patient_id,
    doctor_id,
    diagnosis,
    prescription,
    treatment_date
)
VALUES
(1,1,'Hypertension','Amlodipine','2025-01-20'),
(1,2,'Migraine','Sumatriptan','2025-02-15'),
(1,1,'High Blood Pressure','Amlodipine','2025-03-20'),
(2,1,'Heart Checkup','Aspirin','2025-03-20'),
(2,3,'Skin Allergy','Cetirizine','2025-04-10'),
(3,4,'Back Pain','Painkiller','2024-07-15'),
(4,3,'Acne','Skin Cream','2025-06-20'),
(5,5,'Fever','Paracetamol','2024-05-10'),
(6,6,'Chest Pain','Aspirin','2025-07-15'),
(7,1,'Heart Disease','Heart Medication','2024-03-10'),
(8,3,'Skin Infection','Antibiotic','2025-07-20'),
(1,1,'Follow Up','Amlodipine','2025-04-20'),
(1,2,'Migraine Follow Up','Sumatriptan','2025-05-20'),
(9,6,'Chest Checkup','Aspirin','2026-01-20'),
(10,2,'Headache','Medicine','2026-02-20');


/* =========================================================
   INSERT BILLING DATA
   ========================================================= */

INSERT INTO Billing
(
    patient_id,
    appointment_id,
    amount,
    payment_status,
    payment_date
)
VALUES
(1,1,1500,'Paid','2025-01-20'),
(1,2,1800,'Paid','2025-02-15'),
(2,3,1500,'Paid','2025-03-20'),
(2,4,1200,'Paid','2025-04-10'),
(3,5,1000,'Paid','2024-07-15'),
(4,6,1200,'Pending',NULL),
(5,7,800,'Paid','2024-05-10'),
(6,8,2000,'Paid','2025-07-15'),
(7,9,1500,'Paid','2024-03-10'),
(8,10,1200,'Cancelled',NULL),
(9,11,2000,'Paid','2026-01-20'),
(10,12,1800,'Pending',NULL);


/* =========================================================
   CHECK DATABASE
   ========================================================= */

SHOW TABLES;

SELECT * FROM Patients;
SELECT * FROM Doctors;
SELECT * FROM Appointments;
SELECT * FROM Medical_Records;
SELECT * FROM Billing;
SELECT * FROM Departments;
SELECT * FROM Doctor_Department;