-- DaimonUpDown Education
-- 03_load_data.sql
-- Load all raw CSV files into MariaDB.
-- Uses NULLIF() for nullable date fields so empty CSV values become SQL NULL.

USE daimonupdown;

SET FOREIGN_KEY_CHECKS = 0;

LOAD DATA LOCAL INFILE '/home/lab/Desktop/GitHub/data_analytics/data/raw/departments.csv'
INTO TABLE departments
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/lab/Desktop/GitHub/data_analytics/data/raw/positions.csv'
INTO TABLE positions
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/lab/Desktop/GitHub/data_analytics/data/raw/candidates.csv'
INTO TABLE candidates
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/lab/Desktop/GitHub/data_analytics/data/raw/clients.csv'
INTO TABLE clients
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(client_id,client_name,client_type,prefecture,city,client_relationship_start_date,@client_end_date,client_status)
SET client_relationship_end_date = NULLIF(@client_end_date,'');

LOAD DATA LOCAL INFILE '/home/lab/Desktop/GitHub/data_analytics/data/raw/employees.csv'
INTO TABLE employees
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/lab/Desktop/GitHub/data_analytics/data/raw/applications.csv'
INTO TABLE applications
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(application_id,candidate_id,application_date,position_applied,recruiter_id,
 @screening_date,@interview_date,@offer_date,@offer_response_date,@rejection_date,
 application_status,rejection_reason)
SET screening_date = NULLIF(@screening_date,''),
    interview_date = NULLIF(@interview_date,''),
    offer_date = NULLIF(@offer_date,''),
    offer_response_date = NULLIF(@offer_response_date,''),
    rejection_date = NULLIF(@rejection_date,'');

LOAD DATA LOCAL INFILE '/home/lab/Desktop/GitHub/data_analytics/data/raw/employment_history.csv'
INTO TABLE employment_history
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(employment_history_id,employee_id,employment_start_date,@employment_end_date,
 employment_status,employment_type,position,career_level,start_reason,end_reason,assignment_status)
SET employment_end_date = NULLIF(@employment_end_date,'');

LOAD DATA LOCAL INFILE '/home/lab/Desktop/GitHub/data_analytics/data/raw/compensation_history.csv'
INTO TABLE compensation_history
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/lab/Desktop/GitHub/data_analytics/data/raw/qualifications.csv'
INTO TABLE qualifications
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(qualification_id,employee_id,qualification_name,qualification_type,
 issuing_organization,@issue_date,@expiry_date,qualification_status)
SET issue_date = NULLIF(@issue_date,''),
    expiry_date = NULLIF(@expiry_date,'');

LOAD DATA LOCAL INFILE '/home/lab/Desktop/GitHub/data_analytics/data/raw/visa_history.csv'
INTO TABLE visa_history
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(visa_history_id,employee_id,status_type,effective_date,@expiry_date,
 work_authorization,verification_status,@verification_date)
SET expiry_date = NULLIF(@expiry_date,''),
    verification_date = NULLIF(@verification_date,'');

LOAD DATA LOCAL INFILE '/home/lab/Desktop/GitHub/data_analytics/data/raw/training.csv'
INTO TABLE training
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/lab/Desktop/GitHub/data_analytics/data/raw/assignments.csv'
INTO TABLE assignments
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(assignment_id,employee_id,client_id,assignment_start_date,@assignment_end_date,
 assignment_status,position,commute_minutes,contract_type,renewal_flag,replacement_flag,assignment_reason)
SET assignment_end_date = NULLIF(@assignment_end_date,'');

LOAD DATA LOCAL INFILE '/home/lab/Desktop/GitHub/data_analytics/data/raw/employee_surveys.csv'
INTO TABLE employee_surveys
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/lab/Desktop/GitHub/data_analytics/data/raw/performance.csv'
INTO TABLE performance
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/lab/Desktop/GitHub/data_analytics/data/raw/attendance.csv'
INTO TABLE attendance
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/lab/Desktop/GitHub/data_analytics/data/raw/client_feedback.csv'
INTO TABLE client_feedback
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/lab/Desktop/GitHub/data_analytics/data/raw/schools.csv'
INTO TABLE schools
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/lab/Desktop/GitHub/data_analytics/data/raw/locations.csv'
INTO TABLE locations
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SET FOREIGN_KEY_CHECKS = 1;

LOAD DATA LOCAL INFILE '/home/lab/Desktop/GitHub/data_analytics/data/raw/onboarding.csv'
INTO TABLE onboarding
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(onboarding_id,employee_id,onboarding_start_date,@onboarding_end_date,onboarding_type,
 onboarding_method,duration_days,completion_status,result,@onboarding_satisfaction,notes)
SET onboarding_end_date = NULLIF(@onboarding_end_date,''),
    onboarding_satisfaction = NULLIF(@onboarding_satisfaction,'');

LOAD DATA LOCAL INFILE '/home/lab/Desktop/GitHub/data_analytics/data/raw/offboarding.csv'
INTO TABLE offboarding
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(offboarding_id,employee_id,employment_history_id,offboarding_date,departure_type,leaving_reason,
 @exit_interview_completed,@exit_satisfaction,@would_recommend,@would_return,@rehire_eligible,comments)
SET
  exit_interview_completed = CASE
    WHEN LOWER(TRIM(@exit_interview_completed)) = 'true' THEN 1
    WHEN LOWER(TRIM(@exit_interview_completed)) = 'false' THEN 0
    ELSE NULLIF(@exit_interview_completed,'')
  END,
  exit_satisfaction = NULLIF(@exit_satisfaction,''),
  would_recommend = CASE
    WHEN LOWER(TRIM(@would_recommend)) = 'true' THEN 1
    WHEN LOWER(TRIM(@would_recommend)) = 'false' THEN 0
    ELSE NULLIF(@would_recommend,'')
  END,
  would_return = CASE
    WHEN LOWER(TRIM(@would_return)) = 'true' THEN 1
    WHEN LOWER(TRIM(@would_return)) = 'false' THEN 0
    ELSE NULLIF(@would_return,'')
  END,
  rehire_eligible = CASE
    WHEN LOWER(TRIM(@rehire_eligible)) = 'true' THEN 1
    WHEN LOWER(TRIM(@rehire_eligible)) = 'false' THEN 0
    ELSE NULLIF(@rehire_eligible,'')
  END;
