# DaimonUpDown Education — Company Definition

## 1. Purpose

This document defines the fictional company, business model, operating environment, employee lifecycle, client relationship model, and business rules used for the Workforce Lifecycle & Retention Analytics project.

All company names, employees, clients, schools, and operational data used in this portfolio project are synthetic.

The company definition is the business foundation for the data model, synthetic datasets, SQL analysis, Python analysis, dashboard, and final business recommendations.

---

# 2. Company Overview

**Company Name:** DaimonUpDown Education

**Business Type:** ALT / English-teacher dispatch and education services company

**Primary Market:** Japan

**Primary Operating Area:** Tokyo metropolitan area, including Tokyo, Saitama, Chiba, and Kanagawa

DaimonUpDown Education recruits, hires, trains, and dispatches English teachers and ALTs to schools and other educational organizations.

The company acts as the employer and operational manager of its teachers while providing teaching services to client organizations.

The business therefore has two important groups:

1. Employees / teachers
2. Clients / schools

The project analyzes both sides of this relationship.

---

# 3. Business Model

DaimonUpDown Education provides English-language teaching and ALT services to educational organizations.

The company is responsible for:

- Recruiting teachers
- Screening candidates
- Interviewing candidates
- Hiring teachers
- Employee onboarding
- Initial teacher training
- On-the-job training
- Continuing professional development
- Teacher dispatch and assignment
- Employee support
- Performance management
- Client communication
- Client satisfaction management
- Assignment renewal
- Employee retention
- Employee offboarding

Clients receive teaching services while DaimonUpDown Education manages the employment relationship and operational support for the teacher.

---

# 4. Business Priorities

The company has several major business priorities.

## 4.1 Employee Retention

Keeping qualified teachers is important because employee turnover creates:

- Recruitment costs
- Training costs
- Administrative work
- Assignment disruption
- Replacement requirements
- Client dissatisfaction risk

## 4.2 Client Satisfaction

Client satisfaction is a major business priority.

The company wants schools and educational organizations to receive reliable, professional, effective teaching services.

Client satisfaction may influence:

- Assignment continuation
- Contract renewal
- Long-term client relationships
- Staffing requirements
- Client complaints
- Business stability

## 4.3 Teacher Performance

Teacher performance affects both employee development and the client experience.

Performance may include:

- Lesson quality
- Classroom management
- Communication
- Reliability
- Professionalism
- Attendance

## 4.4 Operational Efficiency

The company also needs to manage:

- Recruitment time
- Hiring
- Onboarding
- Training
- Assignment placement
- Replacement requests
- Employee support
- Client communication

---

# 5. Employee Lifecycle

The employee lifecycle is:

```text
Recruitment
    ↓
Application
    ↓
Screening
    ↓
Interview
    ↓
Hiring
    ↓
Onboarding
    ↓
Initial Training
    ↓
On-the-Job Training
    ↓
Assignment / Dispatch
    ↓
Employment
    ↓
Continuing Training
    ↓
Performance Evaluation
    ↓
Employee Feedback
    ↓
Client Feedback
    ↓
Retention / Career Progression
    ↓
Offboarding
    ↓
Possible Rehire
```

This lifecycle is the primary foundation of the project.

---

# 6. Recruitment

Candidates can enter the company through multiple recruitment sources.

Examples include:

- Company website
- Job boards
- Indeed
- LinkedIn
- Recruitment agencies
- Employee referrals
- Career fairs
- Other recruitment channels

Recruitment performance will be analyzed by source.

Important recruitment questions include:

- Which sources generate the most candidates?
- Which sources generate the most hires?
- Which sources generate better-retained employees?
- Where do candidates leave the recruitment process?
- How long does recruitment take?

---

# 7. Candidate

A candidate is a person who enters the recruitment process.

A candidate is not automatically an employee.

A candidate may submit more than one application.

The candidate record stores relatively stable personal and background information.

Applications are stored separately because one candidate can have multiple applications.

---

# 8. Applications

An application represents a specific application submitted by a candidate.

The recruitment process may include:

```text
Application
    ↓
Screening
    ↓
Interview
    ↓
Offer
    ↓
Offer Response
    ↓
Hire / Rejection / Withdrawal
```

Applications are used to analyze the recruitment funnel.

---

# 9. Hiring

A candidate becomes an employee when the hiring process is successfully completed.

Hiring analysis may include:

- Hiring rate
- Time to hire
- Recruitment source
- Position applied for
- Candidate experience
- Application outcomes

The employee record is separate from the application record.

---

# 10. Employees

Teachers are full-time employees of DaimonUpDown Education.

Employee IDs are permanent.

An employee keeps the same Employee ID throughout their relationship with the company.

If an employee leaves and later returns, the employee retains the original Employee ID.

Employee IDs are never reused.

Teacher Employee IDs use:

```text
DUD100001 onward
```

Head Office Employee IDs are reserved for:

```text
DUD000001 – DUD000100
```

---

# 11. Head Office

DaimonUpDown Education has operational and administrative staff supporting the teacher workforce.

Head Office functions may include:

- Recruitment
- Human Resources
- Training
- Dispatch
- Client Relations
- Employee Support
- Finance
- Administration
- Management

Head Office employees are also represented in the employee master data.

---

# 12. Employee Types

The project distinguishes between:

- Teacher employees
- Head Office employees

Teachers are the primary population for:

- Assignments
- Teaching performance
- Client feedback
- Teacher training
- Attendance
- Employee satisfaction
- Retention analysis

---

# 13. Employment History

An employee record represents the person.

Employment history represents a specific employment period.

An employee may have multiple employment periods.

Example:

```text
Employee: DUD100245

Employment Period 1
2021-04-01 → 2025-08-31

Employment Period 2
2026-04-01 → Present
```

The employee remains:

```text
DUD100245
```

Historical employment records are not overwritten.

---

# 14. Visa and Work Eligibility

Teachers may have different immigration and work-status situations in Japan.

The project records visa/work-status information separately from the employee master record.

Visa history can contain multiple historical records for an employee.

The data model may include:

- Status type
- Effective date
- Expiry date
- Work authorization
- Verification status
- Verification date

Work eligibility is an operational requirement for employment.

---

# 15. Onboarding

After hiring, teachers complete onboarding.

Onboarding introduces employees to:

- Company procedures
- Employment expectations
- Administrative requirements
- Teaching responsibilities
- Communication procedures
- Operational expectations

Onboarding is measured separately from training.

The project tracks:

- Onboarding start date
- Onboarding end date
- Duration
- Completion
- Result
- Satisfaction

---

# 16. Initial Training

Initial teacher training is approximately two weeks.

The initial training structure consists of:

## Week 1 — Orientation / Initial Training

Teachers receive foundational training covering the expectations and practical requirements of their role.

## Week 2 — On-the-Job Training

Teachers receive practical experience and support before or around the beginning of their assignment.

Training is intended to prepare teachers for actual classroom responsibilities.

---

# 17. Continuing Training

Training does not end after initial onboarding.

Teachers receive continuing training throughout employment.

Continuing training may include:

- Classroom management
- Lesson planning
- Communication
- Cultural training
- Professional development
- Zoom reinforcement
- Additional support
- Six-month review support

Continuing reinforcement training generally occurs approximately every two to three months.

Zoom is used for general reinforcement training.

---

# 18. Training Support

Teachers may receive additional support when needed.

Additional support may be provided because of:

- Performance concerns
- Classroom difficulties
- Client feedback
- Employee requests
- Management observations
- Training needs

The purpose of additional training is improvement and support.

---

# 19. Training Measurement

Training records may include:

- Training type
- Training method
- Training stage
- Training date
- Duration
- Completion status
- Result
- Training score
- Trainer
- Notes

Training performance can later be compared with:

- Employee satisfaction
- Teacher performance
- Client satisfaction
- Retention
- Turnover

The analysis must not assume that training causes any specific outcome before the data is analyzed.

---

# 20. Trainers

Trainers are employees who have progressed into training responsibilities.

The career structure includes:

```text
Level 1 — ALT / English Teacher
Level 2 — Experienced Teacher
Level 3 — Senior Teacher
Level 4 — Trainer
Level 5 — Senior Trainer
Level 6 — Lead Trainer
```

Trainer roles may include:

- Delivering training
- Supporting teachers
- Observing performance
- Providing feedback
- Recommending improvements
- Supporting new teachers

---

# 21. Career Progression

Career progression is based primarily on:

- Performance
- Internal evaluation
- Professional development
- Demonstrated ability
- Leadership capability

Length of service alone does not guarantee promotion.

Promotion is an internal process.

---

# 22. Trainer Progression

Senior Trainers participate in trainer development and may recommend candidates for progression into trainer roles.

Lead Trainers approve trainer promotions.

Trainer progression therefore follows an internal evaluation process rather than automatic promotion based solely on tenure.

---

# 23. Assignments and Dispatch

After training, teachers are assigned to client organizations.

A teacher cannot simply select any school they want.

Assignments are determined by operational requirements and staffing demand.

Assignment decisions may consider:

- Client requirements
- Teacher qualifications
- Teacher experience
- Teacher position
- Staffing demand
- Location
- Availability
- Operational requirements

---

# 24. Assignment Changes

A teacher may have multiple assignments during employment.

Assignments may change because of:

- Staffing requirements
- Transfers
- Replacement needs
- Client requests
- Contract changes
- Operational decisions

Assignment history is preserved.

---

# 25. Commute

Commute time is an important employee-experience variable.

The project records one-way commute time for assignments.

Commute time may be analyzed against:

- Employee satisfaction
- Assignment satisfaction
- Work-life balance
- Turnover
- Retention

The analysis will determine whether relationships exist rather than assuming commute causes turnover.

---

# 26. Clients

Clients are organizations that receive teaching services.

Clients may include:

- Public elementary schools
- Public junior high schools
- High schools
- Private schools
- Kindergartens
- English schools
- Education organizations

Clients may operate one or multiple school locations.

---

# 27. Schools

A client may represent an organization while individual schools represent specific locations.

This distinction allows the project to analyze:

```text
Client
    ↓
School
    ↓
Assignment
    ↓
Teacher
```

This supports analysis at both the organization and school level.

---

# 28. Client Relationship

Client relationships can continue over multiple years.

The project records:

- Relationship start date
- Relationship end date
- Client status
- Assignments
- Feedback
- Satisfaction
- Renewal intention

Long-term relationships are important to the business.

---

# 29. Client Feedback

Client feedback is collected to understand the quality of the service being delivered.

Feedback may measure:

- Overall satisfaction
- Teacher performance
- Reliability
- Communication
- Lesson quality
- Professionalism
- Assignment satisfaction
- Renewal intention

---

# 30. Client Complaints

Client complaints are tracked separately within client feedback.

Complaint categories may include:

- Attendance
- Communication
- Lesson quality
- Professionalism
- Punctuality
- Classroom management

Complaints are important because they may affect:

- Client satisfaction
- Teacher support
- Assignment continuation
- Assignment replacement
- Contract renewal

---

# 31. Client Satisfaction

Client satisfaction is a major business priority.

Client satisfaction uses a defined five-point scale:

```text
1 = Very Dissatisfied
2 = Dissatisfied
3 = Neutral
4 = Satisfied
5 = Very Satisfied
```

Client satisfaction can be analyzed over time and by:

- Client
- School
- Teacher
- Assignment
- Location
- Position
- Performance
- Attendance
- Training

---

# 32. Employee Satisfaction

Employee satisfaction is primarily measured through monthly employee surveys.

The survey may measure:

- Overall satisfaction
- Management satisfaction
- Compensation satisfaction
- Training satisfaction
- Assignment satisfaction
- Work-life balance
- Career satisfaction
- Commute satisfaction
- Engagement

The same five-point scale is used:

```text
1 = Very Dissatisfied
2 = Dissatisfied
3 = Neutral
4 = Satisfied
5 = Very Satisfied
```

---

# 33. Direct Employee Contact

Employees may directly contact DaimonUpDown Education when they have:

- Problems
- Concerns
- Requests
- Assignment issues
- Training issues
- Workplace issues
- Management concerns
- Compensation concerns
- Career concerns

Direct employee contact is part of the employee-support model.

---

# 34. Employee Engagement

Employee engagement is measured as part of the employee survey process.

Engagement may be analyzed against:

- Satisfaction
- Training
- Assignment
- Career development
- Work-life balance
- Retention
- Turnover

---

# 35. Performance Evaluation

Teachers receive performance evaluations.

Performance may be reviewed through:

- Six-month reviews
- School visits
- Annual reviews
- Performance improvement reviews

Performance measures include:

- Lesson quality
- Classroom management
- Professionalism
- Communication
- Reliability
- Overall performance

---

# 36. Attendance

Attendance is important for both teacher performance and client satisfaction.

Attendance records may include:

- Present
- Absent
- Paid Leave
- Sick Leave
- Other approved status

Absence reasons may be recorded.

Attendance may be analyzed against:

- Client complaints
- Client satisfaction
- Performance
- Assignment stability
- Employee retention

---

# 37. Contracts

Teacher contracts generally operate on a monthly renewal basis.

Clients may request longer contracts.

Yearly contracts may occur when a client relationship is successful and stable.

Contract analysis may therefore include:

- Contract type
- Assignment period
- Renewal
- Client satisfaction
- Employee performance
- Client feedback

---

# 38. Assignment Renewal

Assignment renewal is an important business outcome.

A client may:

- Renew an assignment
- Consider renewal
- Decline renewal

Renewal may be influenced by the overall client experience.

The project will analyze relationships between renewal and:

- Client satisfaction
- Teacher performance
- Reliability
- Attendance
- Communication
- Lesson quality
- Professionalism

---

# 39. Employee Retention

Employee retention is a major business objective.

Retention analysis will examine:

- Length of employment
- Employee satisfaction
- Engagement
- Training
- Assignment satisfaction
- Commute
- Compensation
- Career development
- Performance
- Client feedback

---

# 40. Employee Turnover

Turnover occurs when an employee leaves employment.

The project distinguishes between:

- Voluntary departure
- Involuntary departure
- Contract end
- Other employment-ending events

Turnover may be analyzed by:

- Location
- Position
- Career level
- Tenure
- Assignment
- Satisfaction
- Commute
- Training
- Compensation
- Reason for leaving

---

# 41. Early Turnover

Early turnover is particularly important.

The project may examine employees leaving within:

- 30 days
- 90 days
- 180 days
- 365 days

Early turnover may indicate potential issues in:

- Recruitment
- Hiring
- Onboarding
- Training
- Assignment
- Employee expectations
- Support

---

# 42. Offboarding

When employment ends, an offboarding record may be created.

Offboarding may include:

- Departure date
- Departure type
- Leaving reason
- Exit interview
- Exit satisfaction
- Would recommend
- Would return
- Rehire eligibility
- Comments

---

# 43. Exit Interviews

Exit interviews provide information about why employees leave.

The project may analyze:

- Reasons for leaving
- Exit satisfaction
- Recommendation intention
- Return intention
- Rehire eligibility

Exit interviews are used as a source of employee feedback.

---

# 44. Rehire

An employee may be eligible for rehire.

A returning employee retains the original Employee ID.

A rehire creates a new employment period in employment history.

Example:

```text
Employee
DUD100245

Employment Period 1
2021–2025

Employment Period 2
2026–Present
```

The person remains the same employee entity.

---

# 45. Compensation

Compensation is stored historically.

Salary changes should not overwrite previous salary records.

Compensation history may include:

- Effective date
- Position
- Career level
- Monthly salary
- Reason for change

Compensation may be analyzed against:

- Career progression
- Employee satisfaction
- Retention
- Turnover

---

# 46. Qualifications

Employees may hold multiple qualifications.

Qualifications may include:

- TEFL
- TESOL
- CELTA
- Education degrees
- English degrees
- Linguistics degrees
- Other relevant qualifications

Qualification records are stored separately because one employee may have multiple qualifications.

---

# 47. Business Questions

The company definition supports analysis of questions such as:

### Recruitment

- Which recruitment sources produce the most hires?
- Which sources produce better retention?
- How long does hiring take?
- Where do candidates leave the recruitment funnel?

### Employee Experience

- What drives employee dissatisfaction?
- Which factors are associated with retention?
- Which employees are at higher risk of turnover?

### Training

- Does training completion relate to performance?
- Does additional training relate to client satisfaction?
- Which training programs have the strongest outcomes?

### Client Experience

- Which factors are associated with client satisfaction?
- Which assignments generate complaints?
- Is teacher performance associated with renewal?

### Retention

- Which groups have the highest turnover?
- What are the most common reasons for leaving?
- Is commute associated with turnover?
- Is satisfaction associated with retention?

---

# 48. Analytical Principles

The project will distinguish between:

**Observation**

What the data shows.

**Relationship**

Variables that appear to move together.

**Recommendation**

A business action supported by evidence.

The project will not automatically interpret correlation as causation.

Recommendations will be based on observed evidence and business context.

---

# 49. Data Model Connection

The company definition supports the following major entities:

```text
Candidates
    ↓
Applications
    ↓
Employees
    ↓
Employment History
    ├── Compensation History
    ├── Qualifications
    ├── Visa History
    ├── Training
    ├── Employee Surveys
    ├── Performance
    ├── Attendance
    └── Offboarding

Clients
    ↓
Schools
    ↓
Assignments
    ↓
Client Feedback
```

---

# 50. Project Goal

The final goal is to understand the relationship between:

```text
Recruitment
    ↓
Hiring
    ↓
Onboarding
    ↓
Training
    ↓
Assignment
    ↓
Employee Experience
    ↓
Teacher Performance
    ↓
Client Experience
    ↓
Assignment Renewal
    ↓
Employee Retention
```

The analysis will use synthetic data to demonstrate a complete professional Data Analyst workflow.

---

# 51. Portfolio Outcome

The completed project should demonstrate the ability to:

- Understand a business
- Define business requirements
- Translate business processes into a data model
- Design relational datasets
- Generate realistic synthetic data
- Identify data-quality issues
- Clean data
- Write SQL
- Analyze data with Python
- Build dashboards
- Communicate findings
- Make evidence-based recommendations

The project is designed to demonstrate practical Data Analyst capability rather than simply demonstrate technical syntax.

---

# 52. Data and Privacy

All data in this portfolio project is synthetic.

No real employee records, client records, school records, personal documents, or confidential company information are intended to be represented.

The names and organizations generated for the project are fictional.

---

# 53. Phase 1 Completion

The company definition establishes the business foundation required before the data model and datasets are finalized.

Phase 1 defines:

- Company
- Business model
- Employees
- Clients
- Recruitment
- Hiring
- Onboarding
- Initial training
- Continuing training
- Career progression
- Trainer structure
- Assignment and dispatch
- Contracts
- Employee satisfaction
- Employee support
- Client satisfaction
- Client feedback
- Performance
- Attendance
- Retention
- Turnover
- Offboarding
- Rehire
- Visa/work eligibility
- Qualifications
- Compensation
- Business questions

---

# 54. Phase 2

Phase 2 uses this company definition to build the relational data model and synthetic datasets.

The data model defines:

- Tables
- Primary keys
- Foreign keys
- Relationships
- Dataset grain
- Data types
- Historical records
- Business rules
- Data-quality scenarios

---

# 55. Phase 3

After the datasets are generated and validated, the project moves into:

- Data-quality assessment
- Data cleaning
- Exploratory data analysis
- SQL analysis
- Python analysis
- Visualization
- Dashboard development
- Business insights
- Recommendations
- Final reporting

No business conclusion should be presented before the relevant data has been analyzed.
