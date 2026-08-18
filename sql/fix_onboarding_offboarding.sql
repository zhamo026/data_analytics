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
