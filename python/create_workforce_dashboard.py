#!/usr/bin/env python3

"""
Create the Tableau-ready Workforce Dashboard dataset.

Workflow:

MariaDB
    ↓
SQL joins and attendance aggregation
    ↓
TSV result
    ↓
Python standard-library CSV conversion
    ↓
dashboard/data/workforce_dashboard.csv

Expected grain:
One row per assignment.

This script intentionally does NOT use pandas.
"""

from pathlib import Path
import csv
import subprocess
import sys


BASE = Path(__file__).resolve().parents[1]
DATA = BASE / "dashboard" / "data"
OUTPUT = DATA / "workforce_dashboard.csv"


SQL = r"""
USE daimonupdown;

SELECT
    a.assignment_id,
    a.employee_id,
    a.client_id,
    a.assignment_start_date,
    a.assignment_end_date,
    a.assignment_status,
    a.position,
    a.commute_minutes,
    a.contract_type,
    a.renewal_flag,
    a.replacement_flag,
    a.assignment_reason,

    e.candidate_id,
    e.first_name,
    e.middle_name,
    e.last_name,
    e.date_of_birth,
    e.gender,
    e.nationality,
    e.country_of_birth,
    e.residence_country,
    e.education_level,
    e.degree_field,
    e.english_proficiency,
    e.japanese_proficiency,
    e.hire_eligibility,
    e.employee_type,
    e.created_date,

    c.client_name,
    c.client_type,
    c.prefecture,
    c.city,
    c.client_relationship_start_date,
    c.client_relationship_end_date,
    c.client_status,

    COALESCE(att.attendance_records, 0) AS attendance_records,
    COALESCE(att.days_present, 0) AS days_present,
    COALESCE(att.days_absent, 0) AS days_absent,
    COALESCE(att.days_late, 0) AS days_late,

    CASE
        WHEN COALESCE(att.attendance_records, 0) = 0 THEN NULL
        ELSE ROUND(
            100.0 * att.days_present / att.attendance_records,
            2
        )
    END AS attendance_rate

FROM assignments a

LEFT JOIN employees e
    ON a.employee_id = e.employee_id

LEFT JOIN clients c
    ON a.client_id = c.client_id

LEFT JOIN (
    SELECT
        assignment_id,
        COUNT(*) AS attendance_records,
        SUM(attendance_status = 'Present') AS days_present,
        SUM(attendance_status = 'Absent') AS days_absent,
        SUM(attendance_status = 'Late') AS days_late
    FROM attendance
    GROUP BY assignment_id
) att
    ON a.assignment_id = att.assignment_id

ORDER BY a.assignment_id;
"""


def main() -> None:
    DATA.mkdir(parents=True, exist_ok=True)

    print("Creating Workforce Dashboard dataset...")
    print("Source: MariaDB")
    print("Expected grain: one row per assignment")
    print()

    try:
        result = subprocess.run(
            [
                "sudo",
                "mariadb",
                "--batch",
                "--raw",
            ],
            input=SQL,
            text=True,
            capture_output=True,
            check=True,
        )
    except subprocess.CalledProcessError as error:
        print("ERROR: MariaDB query failed.")

        if error.stderr:
            print(error.stderr)

        sys.exit(error.returncode)

    # MariaDB --batch --raw returns TSV.
    # Use csv.reader directly on the complete text.
    reader = csv.reader(
        result.stdout.splitlines(),
        delimiter="\t"
    )

    rows = list(reader)

    if not rows:
        print("ERROR: MariaDB returned no data.")
        sys.exit(1)

    header = rows[0]
    data_rows = rows[1:]

    expected_rows = 2341
    expected_columns = 40

    print("Rows returned:", len(data_rows))
    print("Columns returned:", len(header))

    if len(data_rows) != expected_rows:
        print()
        print(
            f"ERROR: Expected {expected_rows} assignment rows, "
            f"but MariaDB returned {len(data_rows)}."
        )
        print("The CSV was NOT written.")
        sys.exit(1)

    if len(header) != expected_columns:
        print()
        print(
            f"ERROR: Expected {expected_columns} columns, "
            f"but MariaDB returned {len(header)}."
        )
        print("The CSV was NOT written.")
        sys.exit(1)

    # Make sure every data row has exactly 40 columns.
    bad_rows = []

    for row_number, row in enumerate(data_rows, start=2):
        if len(row) != expected_columns:
            bad_rows.append(
                (row_number, len(row))
            )

    if bad_rows:
        print()
        print("ERROR: Invalid column count detected.")
        print("First bad rows:", bad_rows[:10])
        print("The CSV was NOT written.")
        sys.exit(1)

    # Only write the CSV after all validation passes.
    with OUTPUT.open(
        "w",
        newline="",
        encoding="utf-8"
    ) as destination:

        writer = csv.writer(destination)
        writer.writerow(header)
        writer.writerows(data_rows)

    print()
    print("Created:", OUTPUT)
    print("Rows:", len(data_rows))
    print("Columns:", len(header))
    print("Expected grain: one row per assignment")
    print("Validation: PASSED")


if __name__ == "__main__":
    main()
