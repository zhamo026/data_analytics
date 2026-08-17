# Workforce Lifecycle & Retention Analytics
---

# Objective

This project is designed to demonstrate practical Data Analyst skills through a complete business analytics workflow.

The goal is not simply to produce charts or SQL queries, but to demonstrate the ability to:

**Understand a business problem → work with imperfect data → analyze the data → communicate findings → make evidence-based recommendations.**

---

## Overview

> **Important:** All data used in this project is synthetic and created for educational and portfolio purposes. It does not represent real employees, schools, companies, or confidential business information.


This project is an end-to-end **Data Analytics project** focused on workforce management, employee experience, client satisfaction, and employee retention within a fictional Japan-based **ALT / English-teacher dispatch company**.

The company operates primarily in **Tokyo and the surrounding areas of Saitama, Chiba, and Kanagawa**.

The company recruits, hires, trains, and dispatches ALT and English teachers to schools and educational organizations.

The project follows the teacher lifecycle:

**Recruitment → Hiring → Onboarding → Training → Assignment/Dispatch → Employment → Satisfaction → Performance → Retention → Offboarding**

At the same time, the project analyzes the experience of the schools and educational organizations receiving dispatched teachers.

The purpose of the project is to demonstrate how data analytics can be used to understand workforce performance, employee experience, client satisfaction, operational efficiency, and employee retention.

---

## Business Scenario

The fictional company provides ALT and English-teacher dispatch services to schools and educational organizations in the Tokyo metropolitan area.

The company is responsible for:

* Recruiting teachers
* Hiring teachers
* Completing employee onboarding
* Providing training
* Assigning teachers to schools
* Managing teacher assignments
* Monitoring employee performance
* Collecting employee feedback
* Collecting school/client feedback
* Managing employee retention
* Managing turnover and offboarding

Management wants to better understand the complete employee and client lifecycle and identify factors associated with workforce performance, employee satisfaction, client satisfaction, and retention.

The company currently has access to workforce and assignment data but needs a structured analytical approach to turn that data into useful business insights.

---

## Business Objective

The primary objective is to analyze the teacher lifecycle and determine how recruitment, onboarding, training, assignments, employee experience, performance, and other workforce factors relate to employee retention, turnover, and client satisfaction.

The analysis will be used to identify:

* Hiring effectiveness
* Onboarding performance
* Training completion
* Assignment and dispatch efficiency
* Employee satisfaction
* Employee dissatisfaction
* Employee engagement
* Employee performance
* Client/school satisfaction
* Employee retention
* Employee turnover
* Offboarding patterns and reasons for leaving
* Potential opportunities to improve employee retention
* Potential opportunities to improve client satisfaction
* Potential operational bottlenecks

The analysis will **not assume that a particular factor causes employee turnover or client dissatisfaction**. Relationships and potential patterns will be investigated using the available data.

---

# Key Business Questions

## Recruitment & Hiring

* How many candidates enter the recruitment process?
* What percentage of candidates are hired?
* Which recruitment sources produce the most hires?
* How long does it take to hire teachers?
* Which positions are the most difficult to fill?
* Where do candidates drop out of the recruitment process?
* Which recruitment sources produce teachers with better retention?

## Onboarding

* How long does onboarding take?
* What percentage of teachers complete onboarding successfully?
* Which locations or positions experience onboarding delays?
* How satisfied are teachers with their onboarding experience?
* Is onboarding performance associated with early employee turnover?
* Does onboarding satisfaction differ between employee groups?

## Training

* What percentage of teachers complete required training?
* Which training programs have the lowest completion rates?
* How long does training take?
* How do training results differ between positions?
* How satisfied are teachers with their training?
* Is training completion associated with employee retention?
* Is training performance associated with client satisfaction?

## Assignment & Dispatch

* How long do teachers wait before receiving an assignment?
* Which locations have the greatest staffing demand?
* Which schools receive the most teacher assignments?
* Which assignments have the highest employee satisfaction?
* Which assignments have the highest turnover?
* Does commute time relate to employee satisfaction or retention?
* How frequently are teachers transferred between assignments?
* Which assignments are most difficult to staff?
* Which assignments have the highest rate of client complaints?

## Employee Satisfaction & Engagement

* What is the overall employee satisfaction level?
* Which factors contribute most to employee dissatisfaction?
* How satisfied are teachers with management?
* How satisfied are teachers with compensation?
* How satisfied are teachers with training?
* How satisfied are teachers with work-life balance?
* How satisfied are teachers with career development?
* How does employee satisfaction change over time?
* Are lower satisfaction scores associated with higher turnover?

## Client / School Satisfaction

* What is the overall client satisfaction level?
* Which schools have the highest satisfaction?
* Which schools have the lowest satisfaction?
* Which assignments receive the most complaints?
* How satisfied are schools with teacher performance?
* How satisfied are schools with teacher reliability and attendance?
* How satisfied are schools with communication?
* How satisfied are schools with lesson quality?
* How satisfied are schools with teacher professionalism?
* Are higher-performing teachers associated with higher client satisfaction?
* Is client satisfaction associated with assignment renewal?
* Which locations or assignment types have lower client satisfaction?
* What are the most common reasons for client dissatisfaction?

## Retention & Turnover

* What is the overall employee turnover rate?
* Which locations have the highest turnover?
* Which positions have the highest turnover?
* How many teachers leave within their first 30, 90, 180, and 365 days?
* What are the most common reasons teachers leave?
* Are satisfaction levels different between teachers who stay and teachers who leave?
* Is employee turnover associated with commute time?
* Is employee turnover associated with assignment changes?
* Is employee turnover associated with training completion?
* Is employee turnover associated with employee satisfaction?

## Offboarding

* What are the most common reasons for leaving?
* What percentage of employees complete an exit interview?
* What factors are reported during exit interviews?
* Would former employees recommend the company?
* Which employee groups have the highest voluntary turnover?
* Are there common dissatisfaction patterns among employees who leave?
* Are former employees eligible for rehire?

---

# Key Performance Indicators

The project will track KPIs including:

| KPI                        | Description                                                    |
| -------------------------- | -------------------------------------------------------------- |
| Headcount                  | Number of active teachers                                      |
| New Hires                  | Teachers hired during a selected period                        |
| Hiring Rate                | Percentage of candidates successfully hired                    |
| Time to Hire               | Average time from application to hiring                        |
| Onboarding Completion Rate | Percentage of teachers completing onboarding                   |
| Training Completion Rate   | Percentage completing required training                        |
| Assignment Rate            | Percentage of teachers successfully assigned                   |
| Average Time to Assignment | Average time between hiring and first assignment               |
| Employee Satisfaction      | Average employee satisfaction score                            |
| Employee Engagement        | Employee engagement measurement                                |
| Employee Performance       | Average or aggregated performance measurement                  |
| Client Satisfaction        | Average school/client satisfaction score                       |
| Client Complaint Rate      | Percentage of assignments or clients generating complaints     |
| Assignment Renewal Rate    | Percentage of assignments or contracts renewed                 |
| Turnover Rate              | Percentage of employees leaving                                |
| Retention Rate             | Percentage of employees remaining                              |
| Early Turnover             | Employees leaving within defined early-tenure periods          |
| Average Tenure             | Average length of employment                                   |
| Average Commute Time       | Average travel time to assignment                              |
| Exit Interview Rate        | Percentage of departing employees completing an exit interview |

Additional KPIs may be added if the analysis demonstrates that they provide meaningful business value.

---

# Data

The project will use multiple related synthetic datasets representing different stages of the employee, assignment, and client lifecycle.

Planned datasets include:

* `candidates.csv`
* `applications.csv`
* `employees.csv`
* `onboarding.csv`
* `training.csv`
* `assignments.csv`
* `employee_surveys.csv`
* `client_feedback.csv`
* `performance.csv`
* `attendance.csv`
* `offboarding.csv`
* `schools.csv`
* `clients.csv`
* `locations.csv`
* `departments.csv`
* `positions.csv`

The datasets will contain realistic data-quality problems so that the project demonstrates practical data-cleaning and quality-control skills.

Examples include:

* Missing values
* Duplicate records
* Incorrect data types
* Invalid dates
* Inconsistent categories
* Invalid numerical values
* Impossible values
* Outliers
* Referential-integrity problems
* Inconsistent employee or assignment records

Raw data will be preserved separately from cleaned data.

---

# Employee & Client Feedback

The project will analyze feedback from both sides of the dispatch relationship.

### Employee Feedback

Employee surveys may measure:

* Overall satisfaction
* Management satisfaction
* Compensation satisfaction
* Training satisfaction
* Assignment satisfaction
* Work-life balance
* Career development
* Engagement
* Workplace experience
* Commute satisfaction

### Client / School Feedback

Client feedback may measure:

* Overall satisfaction
* Teacher performance
* Reliability
* Attendance
* Communication
* Lesson quality
* Professionalism
* Skill/position fit
* Assignment satisfaction
* Contract renewal intention
* Complaints
* Other feedback

This allows the analysis to investigate the relationship between **employee experience and client experience**.

---

# Data Structure

The project will use a structure similar to:

```text
data_analytics/
│
├── README.md
│
├── data/
│   ├── raw/
│   └── cleaned/
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

The repository will be built incrementally as the project progresses.

---

# Tools & Technologies

The project is expected to use:

* **SQL**
* **Python**
* **Pandas**
* **Matplotlib**
* **Jupyter Notebook**
* **Power BI**
* **GitHub**

Each technology will be used for an appropriate part of the analytical workflow.

---

# Analytical Workflow

The project will follow a professional analytics workflow:

```text
Business Problem
       ↓
Business Questions
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

# Data Quality & Cleaning

Data cleaning will be documented rather than performed invisibly.

For each major data-quality issue, the project will document:

1. What the problem is
2. How the problem was identified
3. Why it matters
4. What decision was made
5. How the data was corrected
6. What effect the correction had

The original raw data will not be overwritten during normal analysis.

---

# SQL Analysis

SQL will be used to answer progressively more advanced business questions.

Topics will include:

* `SELECT`
* `WHERE`
* `ORDER BY`
* `GROUP BY`
* `HAVING`
* `CASE`
* `JOIN`
* `INNER JOIN`
* `LEFT JOIN`
* Common Table Expressions
* Subqueries
* Window functions
* Date calculations
* Aggregations

The SQL analysis will focus on answering actual business questions rather than demonstrating SQL syntax without purpose.

---

# Python & Pandas

Python will be used for:

* Loading data
* Inspecting datasets
* Data-quality checks
* Data cleaning
* Data transformation
* Exploratory data analysis
* Aggregation
* Statistical analysis
* Visualization

The analysis will use **Pandas** for data manipulation and **Matplotlib** for appropriate visualizations.

---

# Dashboard

A professional **Power BI dashboard** will eventually be developed.

Planned dashboard areas include:

## Executive Overview

* Headcount
* New hires
* Turnover rate
* Retention rate
* Employee satisfaction
* Client satisfaction
* Training completion
* Average tenure
* Assignment rate

## Recruitment

* Candidate funnel
* Hiring trends
* Time to hire
* Recruitment source performance

## Employee Lifecycle

* Onboarding completion
* Training completion
* Assignment status
* Time to assignment

## Employee Experience

* Employee satisfaction
* Employee engagement
* Work-life balance
* Management satisfaction
* Compensation satisfaction
* Career development

## Client Experience

* Client satisfaction
* Teacher performance ratings
* Reliability
* Communication
* Lesson quality
* Complaints
* Assignment renewal

## Retention

* Turnover trends
* Early turnover
* Turnover by location
* Turnover by position
* Turnover by assignment
* Reasons for leaving
* Employee satisfaction vs. retention

Dashboard filters may include:

* Date
* Region
* Prefecture
* Location
* School
* Position
* Employment status
* Employee segment
* Assignment

---

# Business Recommendations

Recommendations will only be made after the data has been analyzed.

Each recommendation will identify:

1. The finding
2. The supporting evidence
3. The potential business impact
4. The recommended action

The project will avoid presenting unsupported correlations as proven causes.

---

# Limitations

Because this is a portfolio project:

* The datasets are synthetic.
* The results do not represent an actual company or school.
* Relationships found in the data should not automatically be interpreted as causal.
* Employee and client survey responses may contain subjective bias.
* Some workforce and business factors may not be represented in the available data.

These limitations will be considered when interpreting the final results.

---

# Project Status

**Current Phase: Phase 1 — Business Problem Definition**

Completed:

* ALT / English-teacher dispatch business scenario
* Japan / Tokyo operating environment
* Employee lifecycle concept
* Client/school satisfaction concept
* Initial business objectives
* Initial business questions
* Initial KPI framework
* Initial dataset plan

Next:

* Define the fictional company
* Define stakeholders
* Finalize the core business questions
* Define the data model
* Design the synthetic datasets

---

