# DaimonUpDown — Data Model & Dataset Design

## 1. Purpose

This document defines the Phase 2 data model for the DaimonUpDown Workforce Lifecycle & Retention Analytics project.

The purpose of the data model is to define:

- Required datasets
- What each dataset represents
- Primary keys
- Foreign keys
- Relationships
- Required fields
- Data types
- Business rules
- Historical records
- Data-quality scenarios

The model is designed for a fictional ALT / English-teacher dispatch company operating in Japan.

All data is synthetic and created for educational and portfolio purposes.

---

# 2. Data Modeling Principles

The project will use a relational data model.

The main principles are:

1. Each table represents one clearly defined business entity or event.
2. Each table has a primary key.
3. Foreign keys connect related tables.
4. Historical information is not overwritten.
5. Employee IDs are permanent and are never reused.
6. Employee employment periods are stored separately from the employee master record.
7. One employee may have multiple employment periods.
8. One employee may have multiple assignments.
9. One employee may have multiple training records.
10. One employee may have multiple qualifications.
11. One employee may have multiple visa records.
12. One employee may have multiple compensation records.
13. One client may have multiple assignments.
14. One assignment may have multiple client feedback records.
15. One employee may have multiple employee survey records.
16. Raw data remains separate from cleaned data.

---

# 3. Repository Data Structure

```text
data/
├── raw/
└── cleaned/
```

Raw datasets represent the original synthetic source data.

Cleaned datasets will be created later during the data-cleaning phase.

Raw datasets should not be overwritten during normal analysis.

---

# 4. Core Entity Relationship

```text
Candidate
    │
    ▼
Application
    │
    ▼
Employee
    │
    ├──────────────┬──────────────┬──────────────┬──────────────┐
    ▼              ▼              ▼              ▼
Employment     Training     Qualifications   Visa History
History
    │
    ▼
Assignment
    │
    ▼
Client
    │
    ▼
Client Feedback
```

Employee-related information also connects to:

```text
Employee
    │
    ├── Employee Surveys
    ├── Performance
    ├── Attendance
    ├── Compensation History
    └── Offboarding
```

---

# 5. Candidate Table

## Dataset

`candidates.csv`

## Purpose

Stores people who enter the recruitment process.

A candidate does not automatically become an employee.

One person may apply more than once.

## Primary Key

`candidate_id`

Candidate IDs are permanent and unique and must not be reused.

## Important Fields

| Field | Type | Required | Description |
|---|---|---:|---|
| candidate_id | string | Yes | Permanent candidate identifier |
| first_name | string | Yes | Candidate first name |
| middle_name | string | No | Candidate middle name |
| last_name | string | Yes | Candidate family name |
| date_of_birth | date | Yes | Candidate date of birth |
| gender | string | No | Candidate gender |
| nationality | string | Yes | Candidate nationality |
| country_of_birth | string | No | Country of birth |
| residence_country | string | Yes | Current country of residence |
| education_level | string | Yes | Highest education level |
| degree_field | string | No | Degree field |
| english_proficiency | string | Yes | English proficiency |
| japanese_proficiency | string | No | Japanese proficiency |
| years_teaching_experience | decimal | Yes | Teaching experience |
| recruitment_source | string | Yes | Recruitment source |
| first_application_date | date | Yes | First application date |
| candidate_status | string | Yes | Current candidate status |

---

# 6. Application Table

## Dataset

`applications.csv`

## Purpose

Stores individual applications submitted by candidates.

A candidate may apply multiple times.

## Primary Key

`application_id`

## Foreign Key

`candidate_id` → `candidates.candidate_id`

## Important Fields

| Field | Type | Required | Description |
|---|---|---:|---|
| application_id | string | Yes | Unique application ID |
| candidate_id | string | Yes | Candidate |
| application_date | date | Yes | Application date |
| position_applied | string | Yes | Position applied for |
| recruiter_id | string | No | Recruiter |
| screening_date | date | No | Screening date |
| interview_date | date | No | Interview date |
| offer_date | date | No | Offer date |
| offer_response_date | date | No | Candidate response date |
| rejection_date | date | No | Rejection date |
| application_status | string | Yes | Application status |
| rejection_reason | string | No | Rejection reason |

---

# 7. Employee Table

## Dataset

`employees.csv`

## Purpose

Master employee record.

One row represents one person.

## Primary Key

`employee_id`

## Employee ID Format

```text
DUD + 6 digits
```

Head Office:

```text
DUD000001 – DUD000100
```

Teachers:

```text
DUD100001 onward
```

Employee IDs are permanent, unique, and never reused.

A rehire keeps the original Employee ID.

## Important Fields

| Field | Type | Required | Description |
|---|---|---:|---|
| employee_id | string | Yes | Permanent employee identifier |
| candidate_id | string | No | Candidate who became employee |
| first_name | string | Yes | Employee first name |
| middle_name | string | No | Employee middle name |
| last_name | string | Yes | Employee family name |
| date_of_birth | date | Yes | Date of birth |
| gender | string | No | Gender |
| nationality | string | Yes | Nationality |
| country_of_birth | string | No | Country of birth |
| residence_country | string | Yes | Residence country |
| education_level | string | Yes | Highest education |
| degree_field | string | No | Degree field |
| english_proficiency | string | Yes | English proficiency |
| japanese_proficiency | string | No | Japanese proficiency |
| hire_eligibility | string | Yes | Employment eligibility |
| employee_type | string | Yes | Employee classification |
| created_date | date | Yes | Record creation date |

---

# 8. Employment History Table

## Dataset

`employment_history.csv`

## Purpose

Stores each employment period.

An employee may have multiple employment periods.

## Primary Key

`employment_history_id`

## Foreign Key

`employee_id` → `employees.employee_id`

## Important Fields

| Field | Type | Required | Description |
|---|---|---:|---|
| employment_history_id | string | Yes | Employment-period ID |
| employee_id | string | Yes | Employee |
| employment_start_date | date | Yes | Start date |
| employment_end_date | date | No | End date |
| employment_status | string | Yes | Active/inactive |
| employment_type | string | Yes | Employment classification |
| position | string | Yes | Position |
| career_level | integer | Yes | Career level |
| start_reason | string | Yes | Initial hire or rehire |
| end_reason | string | No | End reason |
| assignment_status | string | Yes | Assignment status |

---

# 9. Compensation History Table

## Dataset

`compensation_history.csv`

## Purpose

Stores historical salary changes.

## Primary Key

`compensation_history_id`

## Foreign Key

`employee_id` → `employees.employee_id`

## Important Fields

| Field | Type | Required | Description |
|---|---|---:|---|
| compensation_history_id | string | Yes | Compensation record |
| employee_id | string | Yes | Employee |
| effective_date | date | Yes | Effective date |
| position | string | Yes | Position |
| career_level | integer | Yes | Career level |
| monthly_salary_jpy | integer | Yes | Monthly salary |
| salary_reason | string | Yes | Reason for change |

---

# 10. Qualifications Table

## Dataset

`qualifications.csv`

## Purpose

Stores professional qualifications and certifications.

One employee may have multiple qualifications.

## Primary Key

`qualification_id`

## Foreign Key

`employee_id` → `employees.employee_id`

## Important Fields

| Field | Type | Required | Description |
|---|---|---:|---|
| qualification_id | string | Yes | Qualification record |
| employee_id | string | Yes | Employee |
| qualification_name | string | Yes | Qualification |
| qualification_type | string | Yes | Type |
| issuing_organization | string | No | Issuing organization |
| issue_date | date | No | Issue date |
| expiry_date | date | No | Expiry date |
| qualification_status | string | Yes | Active/expired |

---

# 11. Visa History Table

## Dataset

`visa_history.csv`

## Purpose

Stores historical immigration/work-status information.

## Primary Key

`visa_history_id`

## Foreign Key

`employee_id` → `employees.employee_id`

## Important Fields

| Field | Type | Required | Description |
|---|---|---:|---|
| visa_history_id | string | Yes | Visa record |
| employee_id | string | Yes | Employee |
| status_type | string | Yes | Immigration/status category |
| effective_date | date | Yes | Start date |
| expiry_date | date | No | Expiry date |
| work_authorization | string | Yes | Work eligibility |
| verification_status | string | Yes | Verification status |
| verification_date | date | No | Verification date |

---

# 12. Training Table

## Dataset

`training.csv`

## Purpose

Stores teacher training events.

One employee can have many training records.

Training includes:

- Initial orientation
- On-the-job training
- Continuing training
- Zoom reinforcement training
- Trainer-led training
- Additional support

## Primary Key

`training_id`

## Foreign Keys

`employee_id` → `employees.employee_id`

`trainer_id` → `employees.employee_id`

## Important Fields

| Field | Type | Required | Description |
|---|---|---:|---|
| training_id | string | Yes | Training record |
| employee_id | string | Yes | Employee receiving training |
| trainer_id | string | No | Employee providing training |
| training_date | date | Yes | Training date |
| training_type | string | Yes | Training type |
| training_method | string | Yes | In-person or Zoom |
| training_stage | string | Yes | Initial/continuing |
| duration_hours | decimal | Yes | Training duration |
| completion_status | string | Yes | Completion status |
| result | string | Yes | Training result |
| training_score | decimal | No | Training score |
| notes | string | No | Training notes |

---

# 13. Client Table

## Dataset

`clients.csv`

## Purpose

Stores organizations receiving services from DaimonUpDown.

Clients may include:

- Public elementary schools
- Public junior high schools
- Private schools
- Kindergartens
- High schools
- English schools
- Businesses
- Other organizations

## Primary Key

`client_id`

## Important Fields

| Field | Type | Required | Description |
|---|---|---:|---|
| client_id | string | Yes | Client ID |
| client_name | string | Yes | Fictional client name |
| client_type | string | Yes | Organization type |
| prefecture | string | Yes | Prefecture |
| city | string | Yes | City |
| client_relationship_start_date | date | Yes | Relationship start |
| client_relationship_end_date | date | No | Relationship end |
| client_status | string | Yes | Active/inactive |

---

# 14. Assignment Table

## Dataset

`assignments.csv`

## Purpose

Stores teacher-to-client assignments.

This is a central table connecting employees and clients.

## Primary Key

`assignment_id`

## Foreign Keys

`employee_id` → `employees.employee_id`

`client_id` → `clients.client_id`

## Important Fields

| Field | Type | Required | Description |
|---|---|---:|---|
| assignment_id | string | Yes | Assignment ID |
| employee_id | string | Yes | Teacher |
| client_id | string | Yes | Client/school |
| assignment_start_date | date | Yes | Start date |
| assignment_end_date | date | No | End date |
| assignment_status | string | Yes | Status |
| position | string | Yes | Position |
| commute_minutes | integer | Yes | One-way commute |
| contract_type | string | Yes | Monthly/long-term |
| renewal_flag | boolean | Yes | Renewed |
| replacement_flag | boolean | Yes | Replacement |
| assignment_reason | string | Yes | Assignment reason |

---

# 15. Employee Survey Table

## Dataset

`employee_surveys.csv`

## Purpose

Stores monthly employee satisfaction surveys.

## Primary Key

`survey_id`

## Foreign Key

`employee_id` → `employees.employee_id`

## Important Fields

| Field | Type | Required | Description |
|---|---|---:|---|
| survey_id | string | Yes | Survey ID |
| employee_id | string | Yes | Employee |
| survey_date | date | Yes | Survey date |
| overall_satisfaction | integer | Yes | Overall satisfaction |
| management_satisfaction | integer | Yes | Management score |
| compensation_satisfaction | integer | Yes | Compensation score |
| training_satisfaction | integer | Yes | Training score |
| assignment_satisfaction | integer | Yes | Assignment score |
| work_life_balance | integer | Yes | Work-life balance |
| career_satisfaction | integer | Yes | Career score |
| commute_satisfaction | integer | Yes | Commute score |
| engagement_score | integer | Yes | Engagement |
| would_recommend | boolean | Yes | Would recommend |
| comments | string | No | Comments |

Scores use:

```text
1 = Very Dissatisfied
2 = Dissatisfied
3 = Neutral
4 = Satisfied
5 = Very Satisfied
```

---

# 16. Client Feedback Table

## Dataset

`client_feedback.csv`

## Purpose

Stores feedback from schools and other clients.

One assignment may have multiple feedback records.

## Primary Key

`client_feedback_id`

## Foreign Keys

`client_id` → `clients.client_id`

`assignment_id` → `assignments.assignment_id`

`employee_id` → `employees.employee_id`

## Important Fields

| Field | Type | Required | Description |
|---|---|---:|---|
| client_feedback_id | string | Yes | Feedback ID |
| client_id | string | Yes | Client |
| assignment_id | string | Yes | Assignment |
| employee_id | string | Yes | Teacher |
| feedback_date | date | Yes | Feedback date |
| overall_satisfaction | integer | Yes | Overall satisfaction |
| teacher_performance | integer | Yes | Teacher performance |
| reliability | integer | Yes | Reliability |
| communication | integer | Yes | Communication |
| lesson_quality | integer | Yes | Lesson quality |
| professionalism | integer | Yes | Professionalism |
| assignment_satisfaction | integer | Yes | Assignment satisfaction |
| renewal_intention | string | Yes | Renewal intention |
| complaint_flag | boolean | Yes | Complaint flag |
| complaint_category | string | No | Complaint category |
| comments | string | No | Comments |

Scores use:

```text
1 = Very Dissatisfied
2 = Dissatisfied
3 = Neutral
4 = Satisfied
5 = Very Satisfied
```

---

# 17. Performance Table

## Dataset

`performance.csv`

## Purpose

Stores formal employee performance evaluations.

## Primary Key

`performance_id`

## Foreign Keys

`employee_id` → `employees.employee_id`

`assignment_id` → `assignments.assignment_id`

`reviewer_id` → `employees.employee_id`

## Important Fields

| Field | Type | Required | Description |
|---|---|---:|---|
| performance_id | string | Yes | Performance ID |
| employee_id | string | Yes | Employee |
| assignment_id | string | No | Assignment |
| reviewer_id | string | No | Reviewer |
| review_date | date | Yes | Review date |
| review_type | string | Yes | Review type |
| lesson_quality | integer | Yes | Lesson quality |
| classroom_management | integer | Yes | Classroom management |
| professionalism | integer | Yes | Professionalism |
| communication | integer | Yes | Communication |
| reliability | integer | Yes | Reliability |
| overall_score | decimal | Yes | Overall score |
| improvement_required | boolean | Yes | Improvement required |
| comments | string | No | Comments |

---

# 18. Attendance Table

## Dataset

`attendance.csv`

## Purpose

Stores employee attendance information.

## Primary Key

`attendance_id`

## Foreign Keys

`employee_id` → `employees.employee_id`

`assignment_id` → `assignments.assignment_id`

## Important Fields

| Field | Type | Required | Description |
|---|---|---:|---|
| attendance_id | string | Yes | Attendance ID |
| employee_id | string | Yes | Employee |
| assignment_id | string | No | Assignment |
| attendance_date | date | Yes | Date |
| attendance_status | string | Yes | Attendance status |
| absence_reason | string | No | Reason |
| approved_flag | boolean | Yes | Approved |

---

# 19. Offboarding Table

## Dataset

`offboarding.csv`

## Purpose

Stores detailed information about employees leaving the company.

## Primary Key

`offboarding_id`

## Foreign Keys

`employee_id` → `employees.employee_id`

`employment_history_id` → `employment_history.employment_history_id`

## Important Fields

| Field | Type | Required | Description |
|---|---|---:|---|
| offboarding_id | string | Yes | Offboarding ID |
| employee_id | string | Yes | Employee |
| employment_history_id | string | Yes | Ending employment period |
| offboarding_date | date | Yes | Offboarding date |
| departure_type | string | Yes | Voluntary/involuntary |
| leaving_reason | string | Yes | Main reason |
| exit_interview_completed | boolean | Yes | Exit interview |
| exit_satisfaction | integer | No | Satisfaction at departure |
| would_recommend | boolean | No | Would recommend |
| would_return | boolean | No | Would return |
| rehire_eligible | boolean | Yes | Rehire eligible |
| comments | string | No | Exit comments |

---

# 20. School Table

## Dataset

`schools.csv`

## Purpose

Provides a detailed school/location entity when a client operates multiple locations.

## Primary Key

`school_id`

## Foreign Key

`client_id` → `clients.client_id`

## Important Fields

| Field | Type | Required | Description |
|---|---|---:|---|
| school_id | string | Yes | School ID |
| client_id | string | Yes | Parent client |
| school_name | string | Yes | Fictional school name |
| school_type | string | Yes | School type |
| prefecture | string | Yes | Prefecture |
| city | string | Yes | City |
| opening_date | date | No | Opening date |
| school_status | string | Yes | Active/inactive |

---

# 21. Location Table

## Dataset

`locations.csv`

## Purpose

Stores operational geographic locations.

## Primary Key

`location_id`

## Important Fields

| Field | Type | Required | Description |
|---|---|---:|---|
| location_id | string | Yes | Location ID |
| prefecture | string | Yes | Prefecture |
| city | string | Yes | City |
| area_name | string | Yes | Local area |
| latitude | decimal | No | Latitude |
| longitude | decimal | No | Longitude |
| region | string | Yes | Operational region |

---

# 22. Department Table

## Dataset

`departments.csv`

## Purpose

Stores company departments.

## Primary Key

`department_id`

## Important Fields

| Field | Type | Required | Description |
|---|---|---:|---|
| department_id | string | Yes | Department ID |
| department_name | string | Yes | Department name |
| department_type | string | Yes | Department category |
| active_flag | boolean | Yes | Active department |

---

# 23. Position Table

## Dataset

`positions.csv`

## Purpose

Stores company career positions.

## Primary Key

`position_id`

## Career Structure

| Level | Position | Standard Monthly Salary |
|---:|---|---:|
| 1 | ALT / English Teacher | ¥250,000 |
| 2 | Experienced Teacher | ¥260,000 |
| 3 | Senior Teacher | ¥270,000 |
| 4 | Trainer | ¥280,000 |
| 5 | Senior Trainer | ¥290,000 |
| 6 | Lead Trainer | ¥300,000 |

## Important Fields

| Field | Type | Required | Description |
|---|---|---:|---|
| position_id | string | Yes | Position ID |
| position_name | string | Yes | Position |
| career_level | integer | Yes | Career level |
| standard_monthly_salary | integer | Yes | Standard salary |
| trainer_role | boolean | Yes | Trainer role |

---

# 24. Primary Key Rules

Every table must have a unique primary key.

Examples:

```text
candidates.candidate_id
applications.application_id
employees.employee_id
employment_history.employment_history_id
compensation_history.compensation_history_id
qualifications.qualification_id
visa_history.visa_history_id
training.training_id
clients.client_id
assignments.assignment_id
employee_surveys.survey_id
client_feedback.client_feedback_id
performance.performance_id
attendance.attendance_id
offboarding.offboarding_id
```

---

# 25. Foreign Key Rules

Foreign keys must reference existing records.

Examples:

```text
applications.candidate_id
    → candidates.candidate_id

employees.candidate_id
    → candidates.candidate_id

employment_history.employee_id
    → employees.employee_id

training.employee_id
    → employees.employee_id

training.trainer_id
    → employees.employee_id

qualifications.employee_id
    → employees.employee_id

visa_history.employee_id
    → employees.employee_id

assignments.employee_id
    → employees.employee_id

assignments.client_id
    → clients.client_id

employee_surveys.employee_id
    → employees.employee_id

client_feedback.client_id
    → clients.client_id

client_feedback.assignment_id
    → assignments.assignment_id

client_feedback.employee_id
    → employees.employee_id

performance.employee_id
    → employees.employee_id

attendance.employee_id
    → employees.employee_id

offboarding.employee_id
    → employees.employee_id
```

---

# 26. Employee ID Rules

Employee IDs follow:

```text
DUD + 6 digits
```

Head Office:

```text
DUD000001 – DUD000100
```

Teachers:

```text
DUD100001 onward
```

Rules:

- IDs are permanent.
- IDs are unique.
- IDs are never reused.
- A rehire keeps the original employee ID.
- Head Office IDs are not used for teachers.
- Teacher IDs start at DUD100001.

---

# 27. Historical Data Rules

Historical records should not be overwritten.

Examples:

```text
Employee
    ↓
Compensation History
    ↓
Multiple salary records
```

```text
Employee
    ↓
Employment History
    ↓
Multiple employment periods
```

```text
Employee
    ↓
Visa History
    ↓
Multiple visa records
```

```text
Employee
    ↓
Assignments
    ↓
Multiple assignment records
```

```text
Employee
    ↓
Training
    ↓
Multiple training records
```

---

# 28. Business Rules

## Employee

- All teachers are full-time employees.
- Employee IDs are permanent.
- Employee IDs are never reused.
- Rehires retain their original Employee ID.

## Training

- Initial training lasts approximately two weeks.
- Week 1 consists of orientation/initial training.
- Week 2 consists of on-the-job training.
- Continuing reinforcement training occurs approximately every 2–3 months.
- Zoom is used for general reinforcement training.
- Six-month reviews are part of employee development.

## Career

- Career progression is based primarily on performance and internal evaluation.
- Length of service alone does not guarantee promotion.
- Trainer promotions require internal evaluation.
- Senior Trainers recommend candidates for trainer progression.
- Lead Trainers approve trainer promotions.

## Assignment

- Teachers are dispatched according to staffing demand and operational requirements.
- Teachers cannot simply select any school they want.
- Assignments may change.
- Assignments may be renewed.
- Assignments may involve replacements.

## Contracts

- Teacher contracts generally operate on a monthly renewal basis.
- Clients may request longer contracts.
- Yearly contracts may occur for successful long-term relationships.

## Satisfaction

- Employee satisfaction is primarily measured monthly.
- Employees may directly contact the company about problems.
- Client satisfaction is a major business priority.
- Client feedback includes teacher performance, reliability, communication, lesson quality, and professionalism.

---

# 29. Data Quality Scenarios

The synthetic datasets may intentionally contain realistic issues.

Examples:

### Missing Values

- Missing survey responses
- Missing end dates
- Missing qualification expiry dates
- Missing comments
- Missing optional visa information

### Duplicate Records

- Duplicate applications
- Duplicate survey submissions
- Duplicate feedback records

### Invalid Dates

- End date before start date
- Training date before employment date
- Assignment date outside employment period
- Visa expiry before effective date

### Referential Integrity

- Application referencing missing candidate
- Assignment referencing missing employee
- Assignment referencing missing client
- Feedback referencing missing assignment

### Category Problems

```text
Senior Trainer
Senior trainer
senior_trainer
SENIOR TRAINER
```

These should be detected and standardized during cleaning.

### Numerical Problems

- Negative commute time
- Satisfaction score outside 1–5
- Negative salary
- Impossible age
- Invalid training duration

---

# 30. Data Validation

Before analysis, the project should validate:

- Primary-key uniqueness
- Foreign-key integrity
- Date consistency
- Required fields
- Valid categories
- Valid numerical ranges
- Duplicate records
- Employee lifecycle consistency
- Assignment consistency
- Historical consistency

---

# 31. Dataset Generation Order

Datasets should be generated in dependency order.

Recommended sequence:

```text
1. candidates.csv
2. applications.csv
3. employees.csv
4. employment_history.csv
5. positions.csv
6. departments.csv
7. compensation_history.csv
8. qualifications.csv
9. visa_history.csv
10. clients.csv
11. schools.csv
12. locations.csv
13. training.csv
14. assignments.csv
15. employee_surveys.csv
16. performance.csv
17. attendance.csv
18. client_feedback.csv
19. offboarding.csv
```

---

# 32. Relationship Summary

| Parent | Child | Relationship |
|---|---|---|
| Candidate | Application | One-to-Many |
| Candidate | Employee | One-to-Many / historical relationship |
| Employee | Employment History | One-to-Many |
| Employee | Compensation History | One-to-Many |
| Employee | Qualifications | One-to-Many |
| Employee | Visa History | One-to-Many |
| Employee | Training | One-to-Many |
| Employee | Assignment | One-to-Many |
| Employee | Employee Survey | One-to-Many |
| Employee | Performance | One-to-Many |
| Employee | Attendance | One-to-Many |
| Employee | Offboarding | One-to-Many |
| Client | School | One-to-Many |
| Client | Assignment | One-to-Many |
| Assignment | Client Feedback | One-to-Many |
| Assignment | Attendance | One-to-Many |
| Assignment | Performance | One-to-Many |

---

# 33. Dataset Grain

Each dataset must have a clearly defined grain.

### employees.csv

One row = one person

### applications.csv

One row = one application

### employment_history.csv

One row = one employment period

### training.csv

One row = one training event

### assignments.csv

One row = one teacher-to-client assignment period

### employee_surveys.csv

One row = one employee survey submission

### client_feedback.csv

One row = one client feedback submission

### performance.csv

One row = one employee performance review

### attendance.csv

One row = one employee attendance event

### offboarding.csv

One row = one employment offboarding event

---

# 34. Phase 2 Completion Criteria

Phase 2 will be considered complete when:

- All required datasets are defined.
- Every dataset has a documented grain.
- Every dataset has a primary key.
- Foreign-key relationships are documented.
- Required fields are documented.
- Data types are documented.
- Business rules are documented.
- Dataset dependencies are documented.
- Synthetic datasets have been generated.
- Referential integrity has been validated.
- Data-quality scenarios have been introduced and documented.

---

# 35. Current Phase

**Phase 2 — Data Model & Dataset Design**

The next implementation step is to generate and validate the remaining datasets according to this model.

No analytical findings should be produced until:

1. The data model is finalized.
2. The synthetic datasets are generated.
3. Relationships are validated.
4. Data quality is assessed.
5. Data is cleaned.
6. Analysis is performed.
