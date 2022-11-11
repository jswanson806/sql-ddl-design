DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE "medical_center" (
    "id" SERIAL   NOT NULL,
    "address" TEXT   NOT NULL,
    "contact_phone" TEXT   NOT NULL,
    CONSTRAINT "pk_medical_center" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "doctors" (
    "doctor_id" SERIAL   NOT NULL,
    "first_name" TEXT   NOT NULL,
    "last_name" TEXT   NOT NULL,
    "contact_pager" TEXT   NOT NULL,
    "patients" TEXT,
    CONSTRAINT "pk_doctors" PRIMARY KEY (
        "doctor_id"
     )
);

CREATE TABLE "qualification" (
    "qual_id" SERIAL   NOT NULL,
    "NPI_number" VARCHAR(10)   NOT NULL,
    "med_license_number" VARCHAR(10)   NOT NULL,
    "DEA_number" VARCHAR(10)   NOT NULL,
    "malpractice_insurance_number" VARCHAR(10)   NOT NULL,
    "drivers_license_number" VARCHAR(10)   NOT NULL,
    CONSTRAINT "pk_qualification" PRIMARY KEY (
        "qual_id"
     )
);

CREATE TABLE "patients" (
    "patient_id" SERIAL   NOT NULL,
    "first_name" TEXT   NOT NULL,
    "last_name" TEXT   NOT NULL,
    "date_of_birth" DATE   NOT NULL,
    "admitted_date" DATE   NOT NULL,
    "discharge_date" DATE,
    "time_of_death" DATETIME,
    CONSTRAINT "pk_patients" PRIMARY KEY (
        "patient_id"
     )
);

CREATE TABLE "diagnoses" (
    "diagnoses_id" SERIAL   NOT NULL,
    "ailment" TEXT   NOT NULL DEFAULT 'unknown',
    "test_ordered" TEXT,
    "test_results" TEXT,
    "prescribed_meds" TEXT,
    "meds_refillable" BOOLEAN,
    CONSTRAINT "pk_diagnoses" PRIMARY KEY (
        "diagnoses_id"
     )
);

CREATE TABLE "prognosis" (
    "prog_id" SERIAL   NOT NULL,
    "exp_duration" TEXT,
    "exp_outcome" TEXT,
    "est_recovery_time" TEXT,
    "est_survivability" DECIMAL(3,2),
    CONSTRAINT "pk_prognosis" PRIMARY KEY (
        "prog_id"
     )
);

ALTER TABLE "medical_center" ADD CONSTRAINT "fk_medical_center_id" FOREIGN KEY("id")
REFERENCES "doctors" ("doctor_id");

ALTER TABLE "doctors" ADD CONSTRAINT "fk_doctors_doctor_id" FOREIGN KEY("doctor_id")
REFERENCES "qualification" ("qual_id");

ALTER TABLE "doctors" ADD CONSTRAINT "fk_doctors_patients" FOREIGN KEY("patients")
REFERENCES "patients" ("patient_id");

ALTER TABLE "patients" ADD CONSTRAINT "fk_patients_patient_id" FOREIGN KEY("patient_id")
REFERENCES "diagnoses" ("diagnoses_id");

ALTER TABLE "diagnoses" ADD CONSTRAINT "fk_diagnoses_diagnoses_id" FOREIGN KEY("diagnoses_id")
REFERENCES "prognosis" ("prog_id");

