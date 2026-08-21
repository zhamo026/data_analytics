# Data Analytics Project

## Table of Contents

- [1. Project Overview](#1-project-overview)
- [2. Quick Summary](#2-quick-summary)
- [3. Repository Structure](#3-repository-structure)
- [4. Raw Data](#4-raw-data)
- [5. SQL](#5-sql)
- [6. Python](#6-python)
- [7. Notebooks](#7-notebooks)
- [8. Dashboard Data](#8-dashboard-data)
- [9. Documentation](#9-documentation)
- [10. Images and Reports](#10-images-and-reports)
- [11. Project Workflow](#11-project-workflow)
- [12. Git Workflow](#12-git-workflow)

---

## 1. Project Overview

This repository contains the DaimonUpDown Education data analytics project.

The project brings together raw workforce data, MariaDB database development, SQL validation and analysis, Python processing, Jupyter notebooks, and Tableau-ready dashboard datasets.

---

## 2. Quick Summary

**Main analytical areas**

- Workforce assignments
- Attendance
- Clients
- Recruitment
- Onboarding and offboarding
- Employee retention
- Data quality

**Main technologies**

- MariaDB / SQL
- Python
- Jupyter Notebook
- Tableau
- Git / GitHub

**Main project flow**

`Raw CSV → Cleaning → MariaDB → SQL validation/analysis → Python processing → Dashboard data → Jupyter/Tableau`

---

## 3. Repository Structure

```text
data_analytics/
├── README.md
├── dashboard/
│   └── data/
├── data/
│   └── raw/
├── docs/
├── images/
├── notebooks/
├── python/
├── reports/
└── sql/
```

| Folder | Purpose |
|---|---|
| `dashboard/` | Dashboard-ready datasets |
| `data/raw/` | Source CSV data |
| `docs/` | Project and data-model documentation |
| `images/` | Image assets |
| `notebooks/` | Jupyter notebooks |
| `python/` | Python processing utilities |
| `reports/` | Reports/output area |
| `sql/` | Database setup, validation, and analysis |

---

## 4. Raw Data

Location:

```text
data/raw/
```

Tracked datasets:

- `applications.csv`
- `assignments.csv`
- `attendance.csv`
- `candidates.csv`
- `client_feedback.csv`
- `clients.csv`
- `compensation_history.csv`
- `departments.csv`
- `employee_surveys.csv`
- `employees.csv`
- `employment_history.csv`
- `locations.csv`
- `offboarding.csv`
- `onboarding.csv`
- `performance.csv`
- `positions.csv`
- `qualifications.csv`
- `schools.csv`
- `training.csv`
- `visa_history.csv`

These are the source datasets used by the project.

---

## 5. SQL

Location:

```text
sql/
```

| File | Purpose |
|---|---|
| `01_create_database.sql` | Creates the project database |
| `02_create_tables.sql` | Creates database tables and relationships |
| `03_load_data.sql` | Loads source data |
| `04_data_quality_checks.sql` | Row counts, duplicate IDs, foreign-key/orphan checks, status checks, and quality summaries |
| `05_recruitment_analysis.sql` | Recruitment analysis |
| `06_onboarding_offboarding.sql` | Onboarding and offboarding analysis |
| `daimonupdown_dump.sql` | MariaDB database dump containing schema/data |
| `.gitkeep` | Keeps the directory tracked |

---

## 6. Python

Location:

```text
python/
```

| File | Purpose |
|---|---|
| `create_workforce_dashboard.py` | Creates the Tableau-ready workforce dataset |
| `merge_excel_to_csv.py` | Merges Excel worksheets into CSV files |
| `tsv_to_csv.py` | Converts TSV files to CSV |
| `.gitkeep` | Keeps the directory tracked |

### Workforce dashboard generator

`create_workforce_dashboard.py` intentionally does **not** use pandas.

Its workflow is:

```text
MariaDB
   ↓
SQL joins + attendance aggregation
   ↓
TSV result
   ↓
Python standard-library CSV conversion
   ↓
dashboard/data/workforce_dashboard.csv
```

Expected grain:

**One row per assignment.**

The generator validates the returned row and column counts before writing the dashboard CSV.

---

## 7. Notebooks

Location:

```text
notebooks/
```

| Notebook | Purpose |
|---|---|
| `01_project_cheat_sheet.ipynb` | Project reference/cheat sheet |
| `02_data_cleaning.ipynb` | Data cleaning and preparation |
| `03_workforce_dashboard.ipynb` | Workforce Dashboard development |
| `04_employee_retention_dashboard.ipynb` | Employee Retention Dashboard development |
| `.gitkeep` | Keeps the directory tracked |

### Workforce Dashboard

The Workforce Dashboard focuses on:

```text
Workforce representation
        ↓
Positions
        ↓
Assignment statuses
        ↓
Assignment outcomes over time
```

### Employee Retention Dashboard

Retention and turnover are handled separately from assignment operations because employee-level employment and offboarding data are required for retention analysis.

---

## 8. Dashboard Data

Location:

```text
dashboard/data/
```

| File | Purpose |
|---|---|
| `assignments.csv` | Assignment data |
| `attendance.csv` | Attendance data |
| `clients.csv` | Client data |
| `employee_retention.csv` | Employee retention dataset |
| `employees.csv` | Employee data |
| `workforce_dashboard.csv` | Tableau-ready workforce dataset |

---

## 9. Documentation

Location:

```text
docs/
```

| File | Purpose |
|---|---|
| `company_definition.md` | Company/project definition |
| `data_model.md` | Data model and relationships |

---

## 10. Images and Reports

### `images/`

Currently contains:

```text
images/.gitkeep
```

Reserved for project image assets.

### `reports/`

Currently contains:

```text
reports/.gitkeep
```

Reserved for reports and generated reporting outputs.

---

## 11. Project Workflow

```text
Raw CSV Data
     ↓
Data Cleaning / Preparation
     ↓
MariaDB Database
     ↓
SQL Data Quality Checks
     ↓
SQL Analysis
     ↓
Python Processing
     ↓
Dashboard-Ready CSV Data
     ↓
Jupyter Dashboard Development
     ↓
Tableau
```

The project keeps **workforce assignment analysis** and **employee retention analysis** as separate analytical areas.

### Workforce assignment analysis

Focuses on:

- assignments
- positions
- clients
- assignment status
- assignment outcomes
- attendance

### Employee retention analysis

Focuses on:

- employees
- employment history
- offboarding
- employee-level retention and turnover

---

## 12. Git Workflow

Typical workflow:

```bash
git status
git add <file>
git commit -m "Descriptive commit message"
git push
git status
```

Before committing:

```bash
git diff --check
```

For Python syntax validation:

```bash
python -m py_compile python/<script>.py
```

A clean repository should end with:

```text
nothing to commit, working tree clean
```

---

## Verified Tracked Files

The README structure above is based on the repository listing supplied for this project.

```text
README.md

dashboard/.gitkeep
dashboard/data/assignments.csv
dashboard/data/attendance.csv
dashboard/data/clients.csv
dashboard/data/employee_retention.csv
dashboard/data/employees.csv
dashboard/data/workforce_dashboard.csv

data/raw/.gitkeep
data/raw/applications.csv
data/raw/assignments.csv
data/raw/attendance.csv
data/raw/candidates.csv
data/raw/client_feedback.csv
data/raw/clients.csv
data/raw/compensation_history.csv
data/raw/departments.csv
data/raw/employee_surveys.csv
data/raw/employees.csv
data/raw/employment_history.csv
data/raw/locations.csv
data/raw/offboarding.csv
data/raw/onboarding.csv
data/raw/performance.csv
data/raw/positions.csv
data/raw/qualifications.csv
data/raw/schools.csv
data/raw/training.csv
data/raw/visa_history.csv

docs/company_definition.md
docs/data_model.md

images/.gitkeep

notebooks/.gitkeep
notebooks/01_project_cheat_sheet.ipynb
notebooks/02_data_cleaning.ipynb
notebooks/03_workforce_dashboard.ipynb
notebooks/04_employee_retention_dashboard.ipynb

python/.gitkeep
python/create_workforce_dashboard.py
python/merge_excel_to_csv.py
python/tsv_to_csv.py

reports/.gitkeep

sql/.gitkeep
sql/01_create_database.sql
sql/02_create_tables.sql
sql/03_load_data.sql
sql/04_data_quality_checks.sql
sql/05_recruitment_analysis.sql
sql/06_onboarding_offboarding.sql
sql/daimonupdown_dump.sql
```
