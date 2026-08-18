#!/usr/bin/env python3

from pathlib import Path
import pandas as pd


BASE = Path(__file__).resolve().parents[1]
DATA = BASE / "dashboard" / "data"

employees = pd.read_csv(DATA / "employees.csv")
assignments = pd.read_csv(DATA / "assignments.csv")
clients = pd.read_csv(DATA / "clients.csv")
attendance = pd.read_csv(DATA / "attendance.csv")


# ------------------------------------------------------------
# 1. Aggregate attendance to ONE ROW PER ASSIGNMENT
# ------------------------------------------------------------

attendance_summary = (
    attendance
    .groupby("assignment_id", as_index=False)
    .agg(
        attendance_records=("attendance_id", "count"),
        days_present=("attendance_status", lambda x: (x == "Present").sum()),
        days_absent=("attendance_status", lambda x: (x == "Absent").sum()),
        days_late=("attendance_status", lambda x: (x == "Late").sum()),
    )
)


# ------------------------------------------------------------
# 2. Join assignments to employees
# ------------------------------------------------------------

workforce = assignments.merge(
    employees,
    on="employee_id",
    how="left",
    suffixes=("", "_employee")
)


# ------------------------------------------------------------
# 3. Join assignments to clients
# ------------------------------------------------------------

workforce = workforce.merge(
    clients,
    on="client_id",
    how="left",
    suffixes=("", "_client")
)


# ------------------------------------------------------------
# 4. Join aggregated attendance
# ------------------------------------------------------------

workforce = workforce.merge(
    attendance_summary,
    on="assignment_id",
    how="left"
)


# ------------------------------------------------------------
# 5. Fill attendance metrics for assignments with no records
# ------------------------------------------------------------

attendance_columns = [
    "attendance_records",
    "days_present",
    "days_absent",
    "days_late",
]

for column in attendance_columns:
    workforce[column] = workforce[column].fillna(0).astype(int)


# ------------------------------------------------------------
# 6. Create useful Tableau measures
# ------------------------------------------------------------

workforce["attendance_rate"] = (
    workforce["days_present"]
    / workforce["attendance_records"].replace(0, pd.NA)
    * 100
).round(2)


# ------------------------------------------------------------
# 7. Save Tableau-ready dataset
# ------------------------------------------------------------

output = DATA / "workforce_dashboard.csv"

workforce.to_csv(
    output,
    index=False,
    encoding="utf-8"
)

print("Created:", output)
print("Rows:", len(workforce))
print("Columns:", len(workforce.columns))
print()
print("Expected grain: one row per assignment")
