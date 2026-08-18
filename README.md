# Workforce Lifecycle & Retention Analytics

## Objective

This project demonstrates practical Data Analyst skills through a complete business analytics workflow.

The goal is not simply to produce charts or SQL queries, but to demonstrate the ability to:

**Understand a business problem → work with imperfect data → analyze the data → communicate findings → make evidence-based recommendations.**

The project focuses on applying analytical methods to realistic business scenarios, with an emphasis on data quality, objective analysis, clear visualization, and turning data into actionable insights.

---

## Overview

> **Important:** All data used in this project is synthetic and created for educational and portfolio purposes. It does not represent real employees, schools, companies, or confidential business information.

This project is an end-to-end **Data Analytics project** focused on workforce management, employee experience, client satisfaction, and employee retention within a fictional Japan-based **ALT / English-teacher dispatch company**.

The company operates primarily in **Tokyo and the surrounding areas of Saitama, Chiba, and Kanagawa**.

The company recruits, hires, trains, and dispatches ALT and English teachers to schools and educational organizations.

The project follows the teacher lifecycle:

**Recruitment → Hiring → Onboarding → Training → Assignment/Dispatch → Employment → Satisfaction → Performance → Retention → Offboarding**

At the same time, the project analyzes the experience of the schools and educational organizations receiving dispatched teachers.

---

# Business Scenario

The fictional company provides ALT and English-teacher dispatch services to schools and educational organizations in the Tokyo metropolitan area.

The company is responsible for:

- Recruiting teachers
- Hiring teachers
- Employee onboarding
- Initial and continuing training
- Assigning teachers to schools
- Managing teacher assignments
- Monitoring employee performance
- Collecting employee feedback
- Collecting school/client feedback
- Managing employee retention
- Managing turnover and offboarding
- Supporting client relationships
- Responding to client concerns
- Supporting assignment renewals and longer-term relationships

Management wants to understand the complete employee and client lifecycle and identify factors associated with:

- Workforce performance
- Employee satisfaction
- Client satisfaction
- Operational efficiency
- Employee retention
- Employee turnover
- Assignment stability
- Contract renewal

---

# Business Objective

The primary objective is to analyze the teacher lifecycle and determine how recruitment, onboarding, training, assignments, employee experience, performance, client experience, and other workforce factors relate to employee retention, turnover, and client satisfaction.

**Client satisfaction is a major business priority.**

The project will investigate whether effective training, teacher performance, communication, reliability, professionalism, and other factors are associated with higher client satisfaction and stronger assignment renewal.

The analysis will **not assume that a particular factor causes employee turnover or client dissatisfaction**.

Relationships and potential patterns will be investigated using the available data.

---

# Key Business Questions

## Recruitment & Hiring

- How many candidates enter the recruitment process?
- What percentage of candidates are hired?
- Which recruitment sources produce the most hires?
- How long does it take to hire teachers?
- Where do candidates drop out of the recruitment process?
- Which recruitment sources produce teachers with better retention?
- Do repeat applicants have different hiring outcomes?
- How long does each stage of the recruitment process take?

## Onboarding

- How long does onboarding take?
- What percentage of teachers complete onboarding successfully?
- Which locations or positions experience onboarding delays?
- How satisfied are teachers with onboarding?
- Is onboarding performance associated with early turnover?
- Does onboarding performance relate to later employee or client satisfaction?

## Training

- What percentage of teachers complete required training?
- Which training programs have the lowest completion rates?
- How long does training take?
- How do training results differ between positions?
- How satisfied are teachers with training?
- Is training completion associated with retention?
- Is training performance associated with client satisfaction?
- Does continuing training relate to teacher performance?

## Assignment & Dispatch

- How long do teachers wait before receiving an assignment?
- Which locations have the greatest staffing demand?
- Which schools receive the most teacher assignments?
- Which assignments have the highest employee satisfaction?
- Which assignments have the highest turnover?
- Does commute time relate to employee satisfaction or retention?
- How frequently are teachers transferred?
- Which assignments have the highest client complaint rate?
- Does assignment stability relate to retention?

## Employee Satisfaction & Engagement

- What is the overall employee satisfaction level?
- Which factors contribute most to employee dissatisfaction?
- How satisfied are teachers with management?
- How satisfied are teachers with compensation?
- How satisfied are teachers with training?
- How satisfied are teachers with work-life balance?
- How satisfied are teachers with career development?
- How satisfied are teachers with their assignment?
- How does satisfaction change over time?
- Are lower satisfaction scores associated with higher turnover?

## Client / School Satisfaction

- What is the overall client satisfaction level?
- Which schools have the highest and lowest satisfaction?
- Which assignments receive the most complaints?
- How satisfied are schools with teacher performance?
- How satisfied are schools with reliability and attendance?
- How satisfied are schools with communication?
- How satisfied are schools with lesson quality?
- How satisfied are schools with professionalism?
- Are higher-performing teachers associated with higher client satisfaction?
- Is client satisfaction associated with assignment renewal?
- What are the most common reasons for client dissatisfaction?
- Which teachers consistently receive strong client feedback?
- Does client satisfaction improve after additional teacher training?
- Which factors are associated with clients requesting contract extensions?

## Retention & Turnover

- What is the overall employee turnover rate?
- Which locations have the highest turnover?
- Which positions have the highest turnover?
- How many teachers leave within their first 30, 90, 180, and 365 days?
- What are the most common reasons teachers leave?
- Are satisfaction levels different between teachers who stay and teachers who leave?
- Is turnover associated with commute time?
- Is turnover associated with assignment changes?
- Is turnover associated with training completion?
- Is turnover associated with employee satisfaction?
- Is turnover associated with client satisfaction?
- Is turnover associated with career progression?

## Offboarding

- What are the most common reasons for leaving?
- What percentage of employees complete an exit interview?
- What factors are reported during exit interviews?
- Would former employees recommend the company?
- Which employee groups have the highest voluntary turnover?
- Are former employees eligible for rehire?
- How frequently do former employees return to the company?

---

# Key Performance Indicators

| KPI | Description |
|---|---|
| Headcount | Number of active teachers |
| New Hires | Teachers hired during a selected period |
| Hiring Rate | Percentage of candidates successfully hired |
| Time to Hire | Average time from application to hiring |
| Onboarding Completion Rate | Percentage completing onboarding |
| Training Completion Rate | Percentage completing required training |
| Assignment Rate | Percentage of teachers successfully assigned |
| Average Time to Assignment | Average time between hiring and first assignment |
| Employee Satisfaction | Average employee satisfaction score |
| Employee Engagement | Employee engagement measurement |
| Employee Performance | Employee performance measurement |
| Client Satisfaction | Average school/client satisfaction score |
| Client Complaint Rate | Rate of assignments or clients generating complaints |
| Assignment Renewal Rate | Percentage of assignments/contracts renewed |
| Turnover Rate | Percentage of employees leaving |
| Retention Rate | Percentage of employees remaining |
| Early Turnover | Employees leaving during early tenure |
| Average Tenure | Average length of employment |
| Average Commute Time | Average travel time to assignment |
| Exit Interview Rate | Percentage of departing employees completing an exit interview |

---

# Employee Feedback

Employee feedback may be collected through:

1. Monthly employee surveys
2. Direct contact with DaimonUpDown

Employees may report:

- Problems
- Concerns
- Requests
- Assignment issues
- Training issues
- Workplace issues
- Management concerns
- Compensation concerns
- Career concerns

---

# Client Feedback

Client feedback may include:

- Overall satisfaction
- Teacher performance
- Reliability
- Attendance
- Communication
- Lesson quality
- Professionalism
- Assignment satisfaction
- Complaints
- Contract renewal intention

The project will investigate:

**Employee Experience → Teacher Performance → Client Experience → Assignment Renewal → Retention**

---

# Data

## Current Raw Datasets

- `candidates.csv`
- `applications.csv`
- `employees.csv`
- `employment_history.csv`
- `compensation_history.csv`
- `qualifications.csv`
- `visa_history.csv`
- `training.csv`
- `clients.csv`

## Additional Datasets

- `onboarding.csv`
- `assignments.csv`
- `employee_surveys.csv`
- `client_feedback.csv`
- `performance.csv`
- `attendance.csv`
- `offboarding.csv`

---

# Repository Structure

```text
data_analytics/
│
├── README.md
│
├── data/
│   ├── raw/
│   └── cleaned/
│
├── docs/
│   └── company_definition.md
│
├── sql/
│
├── python/
│
├── notebooks/
│
├── dashboard/
│
├── reports/
│
└── images/
```

---

# Analytical Workflow

```text
Business Problem
       ↓
Business Questions
       ↓
Company & Business Definition
       ↓
Data Model
       ↓
Synthetic Data
       ↓
Data Quality Assessment
       ↓
Data Cleaning
       ↓
Exploratory Data Analysis
       ↓
SQL Analysis
       ↓
Statistical Analysis
       ↓
Visualization
       ↓
Dashboard
       ↓
Business Insights
       ↓
Recommendations
       ↓
Final Report
```

---

# Data Quality

The project will intentionally include realistic data-quality problems.

Examples:

- Missing values
- Duplicate records
- Invalid dates
- Inconsistent categories
- Incorrect data types
- Impossible values
- Outliers
- Referential-integrity problems
- Inconsistent employee records
- Inconsistent assignment records

Raw data will be preserved.

Cleaned data will be stored separately.

---

# SQL

SQL will be used to answer business questions using:

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- CASE
- JOIN
- CTEs
- Subqueries
- Window functions
- Date calculations
- Aggregations

The SQL analysis will focus on business questions rather than syntax demonstrations.

---

# Python

Python will be used for:

- Data loading
- Data inspection
- Data-quality checks
- Data cleaning
- Data transformation
- Exploratory analysis
- Aggregation
- Statistical analysis
- Visualization

Primary libraries:

- Pandas
- NumPy
- Matplotlib

---

# Dashboard

A Power BI dashboard will be developed after the data has been cleaned and analyzed.

## Executive Overview

- Headcount
- New hires
- Turnover
- Retention
- Employee satisfaction
- Client satisfaction
- Training completion
- Average tenure
- Assignment rate

## Recruitment

- Candidate funnel
- Hiring trends
- Time to hire
- Recruitment source performance

## Employee Experience

- Employee satisfaction
- Employee engagement
- Training satisfaction
- Management satisfaction
- Compensation satisfaction
- Career development
- Work-life balance

## Client Experience

- Client satisfaction
- Teacher performance
- Reliability
- Communication
- Lesson quality
- Professionalism
- Complaints
- Assignment renewal

## Retention

- Turnover trends
- Early turnover
- Turnover by location
- Turnover by position
- Turnover by assignment
- Reasons for leaving
- Satisfaction vs. retention

---

# Business Recommendations

Recommendations will only be made after the data has been analyzed.

Each recommendation will identify:

1. Finding
2. Supporting evidence
3. Potential business impact
4. Recommended action

The project will not present unsupported correlations as proven causes.

---

# Limitations

This is a portfolio project using synthetic data.

Therefore:

- Data does not represent a real company.
- Employees and clients are fictional.
- Results are not real-world company findings.
- Correlation does not automatically indicate causation.
- Survey responses may contain subjective bias.
- Some relevant business factors may not be represented in the dataset.

---

# Tools

- SQL
- Python
- Pandas
- NumPy
- Matplotlib
- Jupyter Notebook
- Power BI
- Git
- GitHub

---

# Project Status

**Current Phase: Phase 2 — Data Model & Dataset Design**

## Phase 1 — Completed

Phase 1 established:

- Company definition
- Business model
- Employee lifecycle
- Client relationship
- Recruitment model
- Training structure
- Career structure
- Assignment process
- Contract model
- Employee satisfaction
- Client satisfaction
- Retention model
- Offboarding model
- Business questions
- KPI framework

## Phase 2 — Current

Phase 2 focuses on:

- Data model
- Dataset relationships
- Primary keys
- Foreign keys
- Required fields
- Data types
- Business rules
- Data-quality scenarios
- Synthetic raw data

No analytical findings will be created before the data has been generated, validated, cleaned, and analyzed.

---

# Portfolio Objective

This project demonstrates the complete Data Analyst workflow:

**Understand → Collect → Validate → Clean → Analyze → Visualize → Communicate → Recommend**

The final portfolio will demonstrate practical ability in:

- Business analysis
- Data modeling
- Data cleaning
- SQL
- Python
- Statistics
- Visualization
- Dashboard development
- Data storytelling
- Evidence-based recommendations
