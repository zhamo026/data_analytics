-- DaimonUpDown Education
-- 02_create_tables.sql
-- MySQL / MariaDB schema for Workforce Lifecycle & Retention Analytics

CREATE DATABASE IF NOT EXISTS daimonupdown
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE daimonupdown;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS client_feedback;
DROP TABLE IF EXISTS attendance;
DROP TABLE IF EXISTS performance;
DROP TABLE IF EXISTS employee_surveys;
DROP TABLE IF EXISTS onboarding;
DROP TABLE IF EXISTS training;
DROP TABLE IF EXISTS assignments;
DROP TABLE IF EXISTS schools;
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS visa_history;
DROP TABLE IF EXISTS qualifications;
DROP TABLE IF EXISTS compensation_history;
DROP TABLE IF EXISTS offboarding;
DROP TABLE IF EXISTS employment_history;
DROP TABLE IF EXISTS applications;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS candidates;
DROP TABLE IF EXISTS positions;
DROP TABLE IF EXISTS departments;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE departments (
    department_id VARCHAR(20) PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    department_type VARCHAR(50) NOT NULL,
    active_flag BOOLEAN NOT NULL
) ENGINE=InnoDB;

CREATE TABLE positions (
    position_id VARCHAR(20) PRIMARY KEY,
    position_name VARCHAR(100) NOT NULL,
    career_level INT NOT NULL,
    standard_monthly_salary DECIMAL(12,2) NOT NULL,
    trainer_role BOOLEAN NOT NULL,
    CHECK (career_level BETWEEN 1 AND 6),
    CHECK (standard_monthly_salary >= 0)
) ENGINE=InnoDB;

CREATE TABLE candidates (
    candidate_id VARCHAR(20) PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    last_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(50),
    nationality VARCHAR(100) NOT NULL,
    country_of_birth VARCHAR(100),
    residence_country VARCHAR(100) NOT NULL,
    education_level VARCHAR(100) NOT NULL,
    degree_field VARCHAR(100),
    english_proficiency VARCHAR(30) NOT NULL,
    japanese_proficiency VARCHAR(30),
    years_teaching_experience DECIMAL(5,1) NOT NULL,
    recruitment_source VARCHAR(100) NOT NULL,
    first_application_date DATE NOT NULL,
    candidate_status VARCHAR(50) NOT NULL,
    CHECK (years_teaching_experience >= 0)
) ENGINE=InnoDB;

CREATE TABLE clients (
    client_id VARCHAR(20) PRIMARY KEY,
    client_name VARCHAR(200) NOT NULL,
    client_type VARCHAR(100) NOT NULL,
    prefecture VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    client_relationship_start_date DATE NOT NULL,
    client_relationship_end_date DATE,
    client_status VARCHAR(30) NOT NULL,
    CHECK (
        client_relationship_end_date IS NULL
        OR client_relationship_end_date >= client_relationship_start_date
    )
) ENGINE=InnoDB;

CREATE TABLE employees (
    employee_id VARCHAR(20) PRIMARY KEY,
    candidate_id VARCHAR(20),
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    last_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(50),
    nationality VARCHAR(100) NOT NULL,
    country_of_birth VARCHAR(100),
    residence_country VARCHAR(100) NOT NULL,
    education_level VARCHAR(100) NOT NULL,
    degree_field VARCHAR(100),
    english_proficiency VARCHAR(30) NOT NULL,
    japanese_proficiency VARCHAR(30),
    hire_eligibility VARCHAR(50) NOT NULL,
    employee_type VARCHAR(50) NOT NULL,
    created_date DATE NOT NULL,
    CONSTRAINT fk_employees_candidate
        FOREIGN KEY (candidate_id) REFERENCES candidates(candidate_id)
) ENGINE=InnoDB;

CREATE TABLE applications (
    application_id VARCHAR(20) PRIMARY KEY,
    candidate_id VARCHAR(20) NOT NULL,
    application_date DATE NOT NULL,
    position_applied VARCHAR(100) NOT NULL,
    recruiter_id VARCHAR(20),
    screening_date DATE,
    interview_date DATE,
    offer_date DATE,
    offer_response_date DATE,
    rejection_date DATE,
    application_status VARCHAR(50) NOT NULL,
    rejection_reason VARCHAR(200),
    CONSTRAINT fk_applications_candidate
        FOREIGN KEY (candidate_id) REFERENCES candidates(candidate_id)
) ENGINE=InnoDB;

CREATE TABLE employment_history (
    employment_history_id VARCHAR(30) PRIMARY KEY,
    employee_id VARCHAR(20) NOT NULL,
    employment_start_date DATE NOT NULL,
    employment_end_date DATE,
    employment_status VARCHAR(30) NOT NULL,
    employment_type VARCHAR(50) NOT NULL,
    position VARCHAR(100) NOT NULL,
    career_level INT NOT NULL,
    start_reason VARCHAR(100) NOT NULL,
    end_reason VARCHAR(200),
    assignment_status VARCHAR(50) NOT NULL,
    CONSTRAINT fk_employment_employee
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    CHECK (
        employment_end_date IS NULL
        OR employment_end_date >= employment_start_date
    )
) ENGINE=InnoDB;

CREATE TABLE compensation_history (
    compensation_history_id VARCHAR(30) PRIMARY KEY,
    employee_id VARCHAR(20) NOT NULL,
    effective_date DATE NOT NULL,
    position VARCHAR(100) NOT NULL,
    career_level INT NOT NULL,
    monthly_salary_jpy DECIMAL(12,2) NOT NULL,
    salary_reason VARCHAR(200) NOT NULL,
    CONSTRAINT fk_compensation_employee
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    CHECK (monthly_salary_jpy >= 0)
) ENGINE=InnoDB;

CREATE TABLE qualifications (
    qualification_id VARCHAR(30) PRIMARY KEY,
    employee_id VARCHAR(20) NOT NULL,
    qualification_name VARCHAR(150) NOT NULL,
    qualification_type VARCHAR(100) NOT NULL,
    issuing_organization VARCHAR(200),
    issue_date DATE,
    expiry_date DATE,
    qualification_status VARCHAR(30) NOT NULL,
    CONSTRAINT fk_qualification_employee
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    CHECK (
        expiry_date IS NULL
        OR issue_date IS NULL
        OR expiry_date >= issue_date
    )
) ENGINE=InnoDB;

CREATE TABLE visa_history (
    visa_history_id VARCHAR(30) PRIMARY KEY,
    employee_id VARCHAR(20) NOT NULL,
    status_type VARCHAR(200) NOT NULL,
    effective_date DATE NOT NULL,
    expiry_date DATE,
    work_authorization VARCHAR(50) NOT NULL,
    verification_status VARCHAR(50) NOT NULL,
    verification_date DATE,
    CONSTRAINT fk_visa_employee
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    CHECK (
        expiry_date IS NULL
        OR expiry_date >= effective_date
    )
) ENGINE=InnoDB;

CREATE TABLE onboarding (
    onboarding_id VARCHAR(30) PRIMARY KEY,
    employee_id VARCHAR(20) NOT NULL,
    onboarding_start_date DATE NOT NULL,
    onboarding_end_date DATE,
    onboarding_type VARCHAR(100) NOT NULL,
    onboarding_method VARCHAR(50) NOT NULL,
    duration_days INT,
    completion_status VARCHAR(50) NOT NULL,
    result VARCHAR(100),
    onboarding_satisfaction INT,
    notes TEXT,
    CONSTRAINT fk_onboarding_employee
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    CHECK (duration_days IS NULL OR duration_days >= 0),
    CHECK (
        onboarding_satisfaction IS NULL
        OR onboarding_satisfaction BETWEEN 1 AND 5
    ),
    CHECK (
        onboarding_end_date IS NULL
        OR onboarding_end_date >= onboarding_start_date
    )
) ENGINE=InnoDB;

CREATE TABLE training (
    training_id VARCHAR(30) PRIMARY KEY,
    employee_id VARCHAR(20) NOT NULL,
    trainer_id VARCHAR(20),
    training_date DATE NOT NULL,
    training_type VARCHAR(150) NOT NULL,
    training_method VARCHAR(50) NOT NULL,
    training_stage VARCHAR(50) NOT NULL,
    duration_hours DECIMAL(6,2) NOT NULL,
    completion_status VARCHAR(50) NOT NULL,
    result VARCHAR(100) NOT NULL,
    training_score DECIMAL(6,2),
    notes TEXT,
    CONSTRAINT fk_training_employee
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    CONSTRAINT fk_training_trainer
        FOREIGN KEY (trainer_id) REFERENCES employees(employee_id),
    CHECK (duration_hours >= 0),
    CHECK (
        training_score IS NULL
        OR training_score BETWEEN 0 AND 100
    )
) ENGINE=InnoDB;

CREATE TABLE locations (
    location_id VARCHAR(20) PRIMARY KEY,
    prefecture VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    area_name VARCHAR(150) NOT NULL,
    latitude DECIMAL(10,7),
    longitude DECIMAL(10,7),
    region VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE schools (
    school_id VARCHAR(20) PRIMARY KEY,
    client_id VARCHAR(20) NOT NULL,
    school_name VARCHAR(200) NOT NULL,
    school_type VARCHAR(100) NOT NULL,
    prefecture VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    opening_date DATE,
    school_status VARCHAR(30) NOT NULL,
    CONSTRAINT fk_school_client
        FOREIGN KEY (client_id) REFERENCES clients(client_id)
) ENGINE=InnoDB;

CREATE TABLE assignments (
    assignment_id VARCHAR(30) PRIMARY KEY,
    employee_id VARCHAR(20) NOT NULL,
    client_id VARCHAR(20) NOT NULL,
    assignment_start_date DATE NOT NULL,
    assignment_end_date DATE,
    assignment_status VARCHAR(50) NOT NULL,
    position VARCHAR(100) NOT NULL,
    commute_minutes INT NOT NULL,
    contract_type VARCHAR(50) NOT NULL,
    renewal_flag BOOLEAN NOT NULL,
    replacement_flag BOOLEAN NOT NULL,
    assignment_reason VARCHAR(100) NOT NULL,
    CONSTRAINT fk_assignment_employee
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    CONSTRAINT fk_assignment_client
        FOREIGN KEY (client_id) REFERENCES clients(client_id),
    CHECK (commute_minutes >= 0),
    CHECK (
        assignment_end_date IS NULL
        OR assignment_end_date >= assignment_start_date
    )
) ENGINE=InnoDB;

CREATE TABLE employee_surveys (
    survey_id VARCHAR(30) PRIMARY KEY,
    employee_id VARCHAR(20) NOT NULL,
    survey_date DATE NOT NULL,
    overall_satisfaction INT NOT NULL,
    management_satisfaction INT NOT NULL,
    compensation_satisfaction INT NOT NULL,
    training_satisfaction INT NOT NULL,
    assignment_satisfaction INT NOT NULL,
    work_life_balance INT NOT NULL,
    career_satisfaction INT NOT NULL,
    commute_satisfaction INT NOT NULL,
    engagement_score INT NOT NULL,
    would_recommend BOOLEAN NOT NULL,
    comments TEXT,
    CONSTRAINT fk_survey_employee
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    CHECK (overall_satisfaction BETWEEN 1 AND 5),
    CHECK (management_satisfaction BETWEEN 1 AND 5),
    CHECK (compensation_satisfaction BETWEEN 1 AND 5),
    CHECK (training_satisfaction BETWEEN 1 AND 5),
    CHECK (assignment_satisfaction BETWEEN 1 AND 5),
    CHECK (work_life_balance BETWEEN 1 AND 5),
    CHECK (career_satisfaction BETWEEN 1 AND 5),
    CHECK (commute_satisfaction BETWEEN 1 AND 5),
    CHECK (engagement_score BETWEEN 1 AND 5)
) ENGINE=InnoDB;

CREATE TABLE performance (
    performance_id VARCHAR(30) PRIMARY KEY,
    employee_id VARCHAR(20) NOT NULL,
    assignment_id VARCHAR(30),
    reviewer_id VARCHAR(20),
    review_date DATE NOT NULL,
    review_type VARCHAR(100) NOT NULL,
    lesson_quality INT NOT NULL,
    classroom_management INT NOT NULL,
    professionalism INT NOT NULL,
    communication INT NOT NULL,
    reliability INT NOT NULL,
    overall_score DECIMAL(5,2) NOT NULL,
    improvement_required BOOLEAN NOT NULL,
    comments TEXT,
    CONSTRAINT fk_performance_employee
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    CONSTRAINT fk_performance_assignment
        FOREIGN KEY (assignment_id) REFERENCES assignments(assignment_id),
    CONSTRAINT fk_performance_reviewer
        FOREIGN KEY (reviewer_id) REFERENCES employees(employee_id),
    CHECK (lesson_quality BETWEEN 1 AND 5),
    CHECK (classroom_management BETWEEN 1 AND 5),
    CHECK (professionalism BETWEEN 1 AND 5),
    CHECK (communication BETWEEN 1 AND 5),
    CHECK (reliability BETWEEN 1 AND 5),
    CHECK (overall_score BETWEEN 1 AND 5)
) ENGINE=InnoDB;

CREATE TABLE attendance (
    attendance_id VARCHAR(30) PRIMARY KEY,
    employee_id VARCHAR(20) NOT NULL,
    assignment_id VARCHAR(30),
    attendance_date DATE NOT NULL,
    attendance_status VARCHAR(50) NOT NULL,
    absence_reason VARCHAR(200),
    approved_flag BOOLEAN NOT NULL,
    CONSTRAINT fk_attendance_employee
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    CONSTRAINT fk_attendance_assignment
        FOREIGN KEY (assignment_id) REFERENCES assignments(assignment_id)
) ENGINE=InnoDB;

CREATE TABLE client_feedback (
    client_feedback_id VARCHAR(30) PRIMARY KEY,
    client_id VARCHAR(20) NOT NULL,
    assignment_id VARCHAR(30) NOT NULL,
    employee_id VARCHAR(20) NOT NULL,
    feedback_date DATE NOT NULL,
    overall_satisfaction INT NOT NULL,
    teacher_performance INT NOT NULL,
    reliability INT NOT NULL,
    communication INT NOT NULL,
    lesson_quality INT NOT NULL,
    professionalism INT NOT NULL,
    assignment_satisfaction INT NOT NULL,
    renewal_intention VARCHAR(30) NOT NULL,
    complaint_flag BOOLEAN NOT NULL,
    complaint_category VARCHAR(100),
    comments TEXT,
    CONSTRAINT fk_feedback_client
        FOREIGN KEY (client_id) REFERENCES clients(client_id),
    CONSTRAINT fk_feedback_assignment
        FOREIGN KEY (assignment_id) REFERENCES assignments(assignment_id),
    CONSTRAINT fk_feedback_employee
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    CHECK (overall_satisfaction BETWEEN 1 AND 5),
    CHECK (teacher_performance BETWEEN 1 AND 5),
    CHECK (reliability BETWEEN 1 AND 5),
    CHECK (communication BETWEEN 1 AND 5),
    CHECK (lesson_quality BETWEEN 1 AND 5),
    CHECK (professionalism BETWEEN 1 AND 5),
    CHECK (assignment_satisfaction BETWEEN 1 AND 5)
) ENGINE=InnoDB;

CREATE TABLE offboarding (
    offboarding_id VARCHAR(30) PRIMARY KEY,
    employee_id VARCHAR(20) NOT NULL,
    employment_history_id VARCHAR(30) NOT NULL,
    offboarding_date DATE NOT NULL,
    departure_type VARCHAR(50) NOT NULL,
    leaving_reason VARCHAR(200) NOT NULL,
    exit_interview_completed BOOLEAN NOT NULL,
    exit_satisfaction INT,
    would_recommend BOOLEAN,
    would_return BOOLEAN,
    rehire_eligible BOOLEAN NOT NULL,
    comments TEXT,
    CONSTRAINT fk_offboarding_employee
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    CONSTRAINT fk_offboarding_employment
        FOREIGN KEY (employment_history_id)
        REFERENCES employment_history(employment_history_id),
    CHECK (
        exit_satisfaction IS NULL
        OR exit_satisfaction BETWEEN 1 AND 5
    )
) ENGINE=InnoDB;

CREATE INDEX idx_applications_candidate ON applications(candidate_id);
CREATE INDEX idx_employees_candidate ON employees(candidate_id);
CREATE INDEX idx_employment_employee ON employment_history(employee_id);
CREATE INDEX idx_compensation_employee ON compensation_history(employee_id);
CREATE INDEX idx_qualification_employee ON qualifications(employee_id);
CREATE INDEX idx_visa_employee ON visa_history(employee_id);
CREATE INDEX idx_onboarding_employee ON onboarding(employee_id);
CREATE INDEX idx_training_employee ON training(employee_id);
CREATE INDEX idx_training_trainer ON training(trainer_id);
CREATE INDEX idx_assignment_employee ON assignments(employee_id);
CREATE INDEX idx_assignment_client ON assignments(client_id);
CREATE INDEX idx_survey_employee ON employee_surveys(employee_id);
CREATE INDEX idx_performance_employee ON performance(employee_id);
CREATE INDEX idx_attendance_employee ON attendance(employee_id);
CREATE INDEX idx_feedback_client ON client_feedback(client_id);
CREATE INDEX idx_feedback_assignment ON client_feedback(assignment_id);
CREATE INDEX idx_feedback_employee ON client_feedback(employee_id);
CREATE INDEX idx_offboarding_employee ON offboarding(employee_id);
