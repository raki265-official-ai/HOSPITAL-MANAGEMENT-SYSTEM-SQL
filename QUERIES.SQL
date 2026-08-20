USE Hospital_Management;


/* =========================================================
   TASK 1
   IMPLEMENT CRUD OPERATIONS
   ========================================================= */


/* INSERT - New Patient */

INSERT INTO Patients
(
    name,
    dob,
    gender,
    phone_number,
    email,
    address,
    registration_date
)
VALUES
(
    'Riya Kapoor',
    '2001-07-10',
    'Female',
    '9999999999',
    'riya@gmail.com',
    'Noida',
    '2026-03-01'
);


/* INSERT - New Doctor */

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
(
    'Dr. Suresh Kumar',
    'General Medicine',
    '9888888888',
    'suresh@hospital.com',
    'Monday, Friday',
    900
);


/* INSERT - New Appointment */

INSERT INTO Appointments
(
    patient_id,
    doctor_id,
    appointment_date,
    status
)
VALUES
(
    11,
    7,
    '2026-03-10',
    'Scheduled'
);


/* UPDATE - Change Patient Address */

UPDATE Patients
SET address = 'New Delhi'
WHERE patient_id = 1;


/* DELETE - Cancelled appointments older than 6 months */

DELETE FROM Appointments
WHERE status = 'Cancelled'
AND appointment_date < DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
AND NOT EXISTS
(
    SELECT 1
    FROM Billing
    WHERE Billing.appointment_id =
          Appointments.appointment_id
);

SELECT * FROM Patients;
SELECT * FROM Doctors;
SELECT * FROM Appointments;


/* =========================================================
   TASK 2
   USE SQL CLAUSES
   WHERE, HAVING, LIMIT
   ========================================================= */


/* Patients registered in the last year */

SELECT *
FROM Patients
WHERE registration_date >=
      DATE_SUB(CURDATE(), INTERVAL 1 YEAR);


/* Top 5 highest-paying patients */

SELECT
    p.patient_id,
    p.name,
    SUM(b.amount) AS total_paid

FROM Patients p

INNER JOIN Billing b
    ON p.patient_id = b.patient_id

WHERE b.payment_status = 'Paid'

GROUP BY
    p.patient_id,
    p.name

ORDER BY total_paid DESC

LIMIT 5;


/* Doctors charging more than Rs.1000 */

SELECT
    doctor_id,
    name,
    specialization,
    consultation_fee

FROM Doctors

WHERE consultation_fee > 1000;


/* HAVING - Patients who spent more than Rs.2000 */

SELECT
    patient_id,
    SUM(amount) AS total_spent

FROM Billing

WHERE payment_status = 'Paid'

GROUP BY patient_id

HAVING SUM(amount) > 2000;


/* =========================================================
   TASK 3
   APPLY SQL OPERATORS
   AND, OR, NOT
   ========================================================= */


/* Scheduled AND doctor_id = 3 */

SELECT *
FROM Appointments
WHERE status = 'Scheduled'
AND doctor_id = 3;


/* Cardiology OR Neurology */

SELECT *
FROM Doctors
WHERE specialization = 'Cardiology'
OR specialization = 'Neurology';


/* Patients who have NOT visited in the past year */

SELECT *
FROM Patients
WHERE patient_id NOT IN
(
    SELECT DISTINCT patient_id
    FROM Appointments
    WHERE appointment_date >=
          DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
);


/* =========================================================
   TASK 4
   SORTING & GROUPING
   ORDER BY, GROUP BY
   ========================================================= */


/* List all doctors sorted by specialization */

SELECT *
FROM Doctors
ORDER BY specialization ASC;


/* Number of patients assigned to each doctor */

SELECT
    d.doctor_id,
    d.name AS doctor_name,
    COUNT(DISTINCT a.patient_id) AS patient_count

FROM Doctors d

LEFT JOIN Appointments a
    ON d.doctor_id = a.doctor_id

GROUP BY
    d.doctor_id,
    d.name

ORDER BY patient_count DESC;


/* Total revenue generated per department */

SELECT
    dep.department_name,
    COALESCE(SUM(b.amount), 0) AS total_revenue

FROM Departments dep

LEFT JOIN Doctor_Department dd
    ON dep.department_id = dd.department_id

LEFT JOIN Doctors d
    ON dd.doctor_id = d.doctor_id

LEFT JOIN Appointments a
    ON d.doctor_id = a.doctor_id

LEFT JOIN Billing b
    ON a.appointment_id = b.appointment_id
    AND b.payment_status = 'Paid'

GROUP BY
    dep.department_id,
    dep.department_name

ORDER BY total_revenue DESC;


/* =========================================================
   TASK 5
   AGGREGATE FUNCTIONS
   SUM, AVG, MAX, MIN, COUNT
   ========================================================= */


/* Total revenue collected */

SELECT
    SUM(amount) AS total_revenue

FROM Billing

WHERE payment_status = 'Paid';


/* Most visited doctor */

SELECT
    d.doctor_id,
    d.name AS doctor_name,
    COUNT(a.appointment_id) AS total_visits

FROM Doctors d

INNER JOIN Appointments a
    ON d.doctor_id = a.doctor_id

GROUP BY
    d.doctor_id,
    d.name

ORDER BY total_visits DESC

LIMIT 1;


/* Average consultation fee */

SELECT
    AVG(consultation_fee) AS average_consultation_fee

FROM Doctors;


/* MAX consultation fee */

SELECT
    MAX(consultation_fee) AS maximum_consultation_fee

FROM Doctors;


/* MIN consultation fee */

SELECT
    MIN(consultation_fee) AS minimum_consultation_fee

FROM Doctors;


/* COUNT doctors */

SELECT
    COUNT(*) AS total_doctors

FROM Doctors;


/* =========================================================
   TASK 6
   PRIMARY KEY & FOREIGN KEY RELATIONSHIPS
   ========================================================= */


/* Medical records linked with correct patients and doctors */

SELECT
    mr.record_id,
    p.patient_id,
    p.name AS patient_name,
    d.doctor_id,
    d.name AS doctor_name,
    mr.diagnosis,
    mr.prescription,
    mr.treatment_date

FROM Medical_Records mr

INNER JOIN Patients p
    ON mr.patient_id = p.patient_id

INNER JOIN Doctors d
    ON mr.doctor_id = d.doctor_id;


/* Invoices linked with appointments */

SELECT
    b.invoice_id,
    p.name AS patient_name,
    b.appointment_id,
    a.appointment_date,
    b.amount,
    b.payment_status

FROM Billing b

INNER JOIN Patients p
    ON b.patient_id = p.patient_id

INNER JOIN Appointments a
    ON b.appointment_id = a.appointment_id;


/* =========================================================
   TASK 7
   IMPLEMENT JOINS
   ========================================================= */


/* INNER JOIN
   Doctors with department names
*/

SELECT
    d.doctor_id,
    d.name AS doctor_name,
    d.specialization,
    dep.department_name

FROM Doctors d

INNER JOIN Doctor_Department dd
    ON d.doctor_id = dd.doctor_id

INNER JOIN Departments dep
    ON dd.department_id = dep.department_id;


/* LEFT JOIN
   All patients with completed appointments
*/

SELECT
    p.patient_id,
    p.name AS patient_name,
    a.appointment_id,
    a.appointment_date,
    a.status

FROM Patients p

LEFT JOIN Appointments a
    ON p.patient_id = a.patient_id
    AND a.status = 'Completed';


/* RIGHT JOIN
   All patients including patients without appointments
*/

SELECT
    p.patient_id,
    p.name AS patient_name,
    a.appointment_id,
    a.appointment_date,
    a.status

FROM Appointments a

RIGHT JOIN Patients p
    ON a.patient_id = p.patient_id;


/* FULL OUTER JOIN
   MySQL does not support FULL OUTER JOIN directly.
   LEFT JOIN + RIGHT JOIN + UNION is used.
*/

SELECT
    p.patient_id,
    p.name AS patient_name,
    a.appointment_id,
    a.appointment_date

FROM Patients p

LEFT JOIN Appointments a
    ON p.patient_id = a.patient_id

UNION

SELECT
    p.patient_id,
    p.name AS patient_name,
    a.appointment_id,
    a.appointment_date

FROM Patients p

RIGHT JOIN Appointments a
    ON p.patient_id = a.patient_id;


/* =========================================================
   TASK 8
   USE SUBQUERIES
   ========================================================= */


/* Doctors who have handled more than 50 patients */

SELECT
    d.doctor_id,
    d.name AS doctor_name

FROM Doctors d

WHERE d.doctor_id IN
(
    SELECT doctor_id

    FROM Appointments

    GROUP BY doctor_id

    HAVING COUNT(DISTINCT patient_id) > 50
);


/* Patient who has spent the most on treatments */

SELECT
    p.patient_id,
    p.name AS patient_name,
    SUM(b.amount) AS total_spent

FROM Patients p

INNER JOIN Billing b
    ON p.patient_id = b.patient_id

WHERE b.payment_status = 'Paid'

GROUP BY
    p.patient_id,
    p.name

ORDER BY total_spent DESC

LIMIT 1;


/* Appointments where doctor specializes in Dermatology */

SELECT
    *

FROM Appointments

WHERE doctor_id IN
(
    SELECT doctor_id

    FROM Doctors

    WHERE specialization = 'Dermatology'
);


/* =========================================================
   TASK 9
   DATE & TIME FUNCTIONS
   ========================================================= */


/* Extract month from appointment_date
   and count visits per month
*/

SELECT
    MONTH(appointment_date) AS month_number,
    COUNT(*) AS total_visits

FROM Appointments

GROUP BY MONTH(appointment_date)

ORDER BY month_number;


/* Calculate total hospital stay duration */

SELECT
    patient_id,
    name AS patient_name,
    admission_date,
    discharge_date,

    DATEDIFF(
        discharge_date,
        admission_date
    ) AS stay_duration_days

FROM Patients

WHERE admission_date IS NOT NULL
AND discharge_date IS NOT NULL;


/* Format treatment_date as DD-MM-YYYY */

SELECT
    record_id,
    diagnosis,
    treatment_date,

    DATE_FORMAT(
        treatment_date,
        '%d-%m-%Y'
    ) AS formatted_treatment_date

FROM Medical_Records;


/* =========================================================
   TASK 10
   STRING MANIPULATION FUNCTIONS
   ========================================================= */


/* Convert all patient names to uppercase */

SELECT
    patient_id,
    name,
    UPPER(name) AS uppercase_name

FROM Patients;


/* Trim whitespace from doctor names */

SELECT
    doctor_id,
    name,
    TRIM(name) AS trimmed_name

FROM Doctors;


/* Replace missing phone numbers with "Not Available" */

SELECT
    patient_id,
    name,

    COALESCE(
        phone_number,
        'Not Available'
    ) AS phone_number

FROM Patients;


/* =========================================================
   TASK 11
   WINDOW FUNCTIONS
   ========================================================= */


/* Rank doctors based on number of patients treated */

SELECT
    doctor_id,
    doctor_name,
    total_patients,

    RANK() OVER
    (
        ORDER BY total_patients DESC
    ) AS doctor_rank

FROM
(
    SELECT
        d.doctor_id,
        d.name AS doctor_name,

        COUNT(DISTINCT a.patient_id)
        AS total_patients

    FROM Doctors d

    LEFT JOIN Appointments a
        ON d.doctor_id = a.doctor_id

    GROUP BY
        d.doctor_id,
        d.name

) AS doctor_statistics

ORDER BY doctor_rank;


/* Show cumulative revenue per month */

SELECT
    payment_month,
    monthly_revenue,

    SUM(monthly_revenue) OVER
    (
        ORDER BY payment_month
    ) AS cumulative_revenue

FROM
(
    SELECT
        DATE_FORMAT(
            payment_date,
            '%Y-%m'
        ) AS payment_month,

        SUM(amount) AS monthly_revenue

    FROM Billing

    WHERE payment_status = 'Paid'
    AND payment_date IS NOT NULL

    GROUP BY
        DATE_FORMAT(
            payment_date,
            '%Y-%m'
        )

) AS monthly_data

ORDER BY payment_month;


/* Display running total of appointments */

SELECT
    appointment_id,
    appointment_date,

    COUNT(*) OVER
    (
        ORDER BY
            appointment_date,
            appointment_id

        ROWS BETWEEN
            UNBOUNDED PRECEDING
            AND CURRENT ROW

    ) AS running_total_appointments

FROM Appointments

ORDER BY
    appointment_date,
    appointment_id;


/* =========================================================
   TASK 12
   APPLY SQL CASE EXPRESSIONS
   ========================================================= */


/*
   Patient Risk Level:

   More than 5 records  = High
   3 to 5 records       = Medium
   Otherwise             = Low
*/

SELECT
    p.patient_id,
    p.name AS patient_name,

    COUNT(mr.record_id) AS total_medical_records,

    CASE

        WHEN COUNT(mr.record_id) > 5
            THEN 'High'

        WHEN COUNT(mr.record_id) BETWEEN 3 AND 5
            THEN 'Medium'

        ELSE 'Low'

    END AS Patient_Risk_Level

FROM Patients p

LEFT JOIN Medical_Records mr
    ON p.patient_id = mr.patient_id

GROUP BY
    p.patient_id,
    p.name

ORDER BY
    total_medical_records DESC;


/* =========================================================
   END
   ========================================================= */