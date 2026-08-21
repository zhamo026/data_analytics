# Workforce Lifecycle & Retention Analytics

> End-to-end Data Analytics portfolio project analyzing recruitment, workforce management, employee experience, client satisfaction, assignments, retention, and turnover.

## Quick Summary

| Area | Summary |
|---|---|
| **Business** | Fictional Japan-based ALT / English-teacher dispatch company |
| **Goal** | Understand workforce lifecycle, employee retention, turnover, and client satisfaction |
| **Data** | Synthetic recruitment, workforce, assignment, attendance, performance, survey, feedback, and retention data |
| **Analysis** | Data Quality → SQL → Python → Statistics → Visualization |
| **Dashboard** | Power BI |
| **Current Phase** | Phase 2 — Data Model & Dataset Design |
| **Important** | All data is synthetic and created for educational and portfolio purposes |

---

## Table of Contents

- [Business Scenario](#business-scenario)
- [Overview](#overview)
- [Business Objective](#business-objective)
- [Key Business Questions](#key-business-questions)
- [Key Performance Indicators](#key-performance-indicators)
- [Employee Feedback](#employee-feedback)
- [Client Feedback](#client-feedback)
- [Data](#data)
- [Repository Structure](#repository-structure)
- [Analytical Workflow](#analytical-workflow)
- [Data Quality](#data-quality)
- [SQL](#sql)
- [Python](#python)
- [Dashboard](#dashboard)
- [Business Recommendations](#business-recommendations)
- [Limitations](#limitations)
- [Tools](#tools)
- [Project Status](#project-status)
- [Portfolio Objective](#portfolio-objective)

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

Management wants to understand workforce performance, employee satisfaction, client satisfaction, operational efficiency, retention, turnover, assignment stability, and contract renewal.

# Overview

> **Important:** All data used in this project is synthetic and created for educational and portfolio purposes. It does not represent real employees, schools, companies, or confidential business information.

This project is an end-to-end **Data Analytics project** focused on workforce management, employee experience, client satisfaction, and employee retention within a fictional Japan-based **ALT / English-teacher dispatch company**.

The company operates primarily in **Tokyo and the surrounding areas of Saitama, Chiba, and Kanagawa**.

The project follows the teacher lifecycle:

**Recruitment → Hiring → Onboarding → Training → Assignment/Dispatch → Employment → Satisfaction → Performance → Retention → Offboarding**

At the same time, the project analyzes the experience of schools and educational organizations receiving dispatched teachers.

# Business Objective

The primary objective is to analyze the teacher lifecycle and determine how recruitment, onboarding, training, assignments, employee experience, performance, client experience, and other workforce factors relate to employee retention, turnover, and client satisfaction.

**Client satisfaction is a major business priority.**

The project will investigate whether effective training, teacher performance, communication, reliability, professionalism, and other factors are associated with higher client satisfaction and stronger assignment renewal.

The analysis will **not assume that a particular factor causes employee turnover or client dissatisfaction**. Relationships and potential patterns will be investigated using the available data.

# Key Business Questions

## Recruitment & Hiring

- How many candidates enter the recruitment process?
- What percentage of candidates are hired?
- Which recruitment sources produce the most hires?
- How long does it take to hire teachers?
- Where do candidates drop out?
- Which recruitment sources produce teachers with better retention?
- Do repeat applicants have different hiring outcomes?
- How long does each recruitment stage take?

## Onboarding

- How long does onboarding take?
- What percentage complete onboarding successfully?
- Which locations or positions experience onboarding delays?
- How satisfied are teachers with onboarding?
- Is onboarding performance associated with early turnover?
- Does onboarding performance relate to later employee or client satisfaction?

## Training

- What percentage complete required training?
- Which programs have the lowest completion rates?
- How long does training take?
- How do training results differ by position?
- How satisfied are teachers with training?
- Is training completion associated with retention?
- Is training performance associated with client satisfaction?
- Does continuing training relate to teacher performance?

## Assignment & Dispatch

- How long do teachers wait before receiving an assignment?
- Which locations have the greatest staffing demand?
- Which schools receive the most assignments?
- Which assignments have the highest employee satisfaction?
- Which assignments have the highest turnover?
- Does commute time relate to satisfaction or retention?
- How frequently are teachers transferred?
- Which assignments have the highest complaint rate?
- Does assignment stability relate to retention?

## Employee Satisfaction & Engagement

- What is the overall employee satisfaction level?
- Which factors contribute most to dissatisfaction?
- How satisfied are teachers with management, compensation, training, work-life balance, career development, and assignments?
- How does satisfaction change over time?
- Are lower satisfaction scores associated with higher turnover?

## Client / School Satisfaction

- What is the overall client satisfaction level?
- Which schools have the highest and lowest satisfaction?
- Which assignments receive the most complaints?
- How satisfied are schools with teacher performance, reliability, attendance, communication, lesson quality, and professionalism?
- Is client satisfaction associated with assignment renewal?
- What are common reasons for client dissatisfaction?
- Which teachers consistently receive strong client feedback?
- Does client satisfaction improve after additional teacher training?
- Which factors are associated with clients requesting contract extensions?

## Retention & Turnover

- What is the overall employee turnover rate?
- Which locations and positions have the highest turnover?
- How many teachers leave within their first 30, 90, 180, and 365 days?
- What are the most common reasons teachers leave?
- Are satisfaction levels different between teachers who stay and those who leave?
- Is turnover associated with commute time, assignment changes, training completion, satisfaction, client satisfaction, or career progression?

## Offboarding

- What are the most common reasons for leaving?
- What percentage complete an exit interview?
- What factors are reported during exit interviews?
- Would former employees recommend the company?
- Which employee groups have the highest voluntary turnover?
- Are former employees eligible for rehire?
- How frequently do former employees return?

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

# Employee Feedback

Employee feedback may be collected through:

1. Monthly employee surveys
2. Direct contact with DaimonUpDown

Employees may report problems, concerns, requests, assignment issues, training issues, workplace issues, management concerns, compensation concerns, and career concerns.

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

This represents an analytical framework rather than a claim that these relationships are causal.

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

# Repository Structure

```text
data_analytics/
├── README.md
├── data/
│   ├── raw/
│   └── cleaned/
├── docs/
│   └── company_definition.md
├── sql/
├── python/
├── notebooks/
├── dashboard/
├── reports/
└── images/
```

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

# Data Quality

The project intentionally includes realistic data-quality scenarios:

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

Raw data will be preserved. Cleaned data will be stored separately.

Data-quality checks validate:

- Row counts
- Duplicate primary keys
- Foreign-key relationships
- Missing required values
- Invalid dates
- Invalid categorical values
- Business-rule violations
- Referential integrity

# SQL

SQL will be used to answer business questions using:

- `SELECT`
- `WHERE`
- `ORDER BY`
- `GROUP BY`
- `HAVING`
- `CASE`
- `JOIN`
- CTEs
- Subqueries
- Window functions
- Date calculations
- Aggregations

SQL will also be used for data-quality validation and reusable database checks.

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
- Dashboard dataset preparation

The workforce dashboard generator uses Python's standard library for CSV generation and **does not require Pandas**.

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

# Business Recommendations

Recommendations will only be made after the data has been analyzed.

Each recommendation will identify:

1. **Finding**
2. **Supporting evidence**
3. **Potential business impact**
4. **Recommended action**

The project will not present unsupported correlations as proven causes.

# Limitations

This is a portfolio project using synthetic data.

Therefore:

- Data does not represent a real company.
- Employees and clients are fictional.
- Results are not real-world company findings.
- Correlation does not automatically indicate causation.
- Survey responses may contain subjective bias.
- Some relevant business factors may not be represented.
- Results should be interpreted within the scope of the available data.

# Tools

- SQL
- Python
- NumPy
- Matplotlib
- Jupyter Notebook
- Power BI
- Git
- GitHub

> **Note:** Individual Python scripts may use different libraries depending on the task. The workforce dashboard generator specifically uses Python's standard library and does not require Pandas.

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
- Database validation

No analytical findings will be created before the data has been generated, validated, cleaned, and analyzed.

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

The objective is to demonstrate not only technical ability, but also the ability to connect technical analysis to practical business questions and decisions.
