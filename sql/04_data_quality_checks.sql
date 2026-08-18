-- DaimonUpDown Education
-- 04_data_quality_checks.sql
-- Reusable database validation checks

USE daimonupdown;

-- ============================================================
-- 1. ROW COUNT CHECK
-- Compare database row counts against expected raw CSV counts.
-- ============================================================

SELECT 'applications' AS table_name, COUNT(*) AS row_count FROM applications
UNION ALL SELECT 'assignments', COUNT(*) FROM assignments
UNION ALL SELECT 'attendance', COUNT(*) FROM attendance
UNION ALL SELECT 'candidates', COUNT(*) FROM candidates
UNION ALL SELECT 'client_feedback', COUNT(*) FROM client_feedback
UNION ALL SELECT 'clients', COUNT(*) FROM clients
UNION ALL SELECT 'compensation_history', COUNT(*) FROM compensation_history
UNION ALL SELECT 'departments', COUNT(*) FROM departments
UNION ALL SELECT 'employees', COUNT(*) FROM employees
UNION ALL SELECT 'employee_surveys', COUNT(*) FROM employee_surveys
UNION ALL SELECT 'employment_history', COUNT(*) FROM employment_history
UNION ALL SELECT 'locations', COUNT(*) FROM locations
UNION ALL SELECT 'offboarding', COUNT(*) FROM offboarding
UNION ALL SELECT 'onboarding', COUNT(*) FROM onboarding
UNION ALL SELECT 'performance', COUNT(*) FROM performance
UNION ALL SELECT 'positions', COUNT(*) FROM positions
UNION ALL SELECT 'qualifications', COUNT(*) FROM qualifications
UNION ALL SELECT 'schools', COUNT(*) FROM schools
UNION ALL SELECT 'training', COUNT(*) FROM training
UNION ALL SELECT 'visa_history', COUNT(*) FROM visa_history;


-- ============================================================
-- 2. DUPLICATE PRIMARY KEY CHECK
-- Expected result: 0 for every table.
-- ============================================================

SELECT 'applications' AS table_name,
       COUNT(*) - COUNT(DISTINCT application_id) AS duplicate_ids
FROM applications
UNION ALL SELECT 'assignments', COUNT(*) - COUNT(DISTINCT assignment_id) FROM assignments
UNION ALL SELECT 'attendance', COUNT(*) - COUNT(DISTINCT attendance_id) FROM attendance
UNION ALL SELECT 'candidates', COUNT(*) - COUNT(DISTINCT candidate_id) FROM candidates
UNION ALL SELECT 'client_feedback', COUNT(*) - COUNT(DISTINCT client_feedback_id) FROM client_feedback
UNION ALL SELECT 'clients', COUNT(*) - COUNT(DISTINCT client_id) FROM clients
UNION ALL SELECT 'compensation_history', COUNT(*) - COUNT(DISTINCT compensation_history_id) FROM compensation_history
UNION ALL SELECT 'departments', COUNT(*) - COUNT(DISTINCT department_id) FROM departments
UNION ALL SELECT 'employees', COUNT(*) - COUNT(DISTINCT employee_id) FROM employees
UNION ALL SELECT 'employee_surveys', COUNT(*) - COUNT(DISTINCT survey_id) FROM employee_surveys
UNION ALL SELECT 'employment_history', COUNT(*) - COUNT(DISTINCT employment_history_id) FROM employment_history
UNION ALL SELECT 'locations', COUNT(*) - COUNT(DISTINCT location_id) FROM locations
UNION ALL SELECT 'offboarding', COUNT(*) - COUNT(DISTINCT offboarding_id) FROM offboarding
UNION ALL SELECT 'onboarding', COUNT(*) - COUNT(DISTINCT onboarding_id) FROM onboarding
UNION ALL SELECT 'performance', COUNT(*) - COUNT(DISTINCT performance_id) FROM performance
UNION ALL SELECT 'positions', COUNT(*) - COUNT(DISTINCT position_id) FROM positions
UNION ALL SELECT 'qualifications', COUNT(*) - COUNT(DISTINCT qualification_id) FROM qualifications
UNION ALL SELECT 'schools', COUNT(*) - COUNT(DISTINCT school_id) FROM schools
UNION ALL SELECT 'training', COUNT(*) - COUNT(DISTINCT training_id) FROM training
UNION ALL SELECT 'visa_history', COUNT(*) - COUNT(DISTINCT visa_history_id) FROM visa_history;


-- ============================================================
-- 3. EMPLOYEE FOREIGN KEY CHECKS
-- Expected result: 0 orphaned records.
-- ============================================================

SELECT 'assignments' AS table_name, COUNT(*) AS orphaned_records
FROM assignments a
LEFT JOIN employees e ON a.employee_id = e.employee_id
WHERE e.employee_id IS NULL

UNION ALL

SELECT 'training', COUNT(*)
FROM training t
LEFT JOIN employees e ON t.employee_id = e.employee_id
WHERE e.employee_id IS NULL

UNION ALL

SELECT 'performance', COUNT(*)
FROM performance p
LEFT JOIN employees e ON p.employee_id = e.employee_id
WHERE e.employee_id IS NULL

UNION ALL

SELECT 'attendance', COUNT(*)
FROM attendance a
LEFT JOIN employees e ON a.employee_id = e.employee_id
WHERE e.employee_id IS NULL

UNION ALL

SELECT 'employee_surveys', COUNT(*)
FROM employee_surveys s
LEFT JOIN employees e ON s.employee_id = e.employee_id
WHERE e.employee_id IS NULL

UNION ALL

SELECT 'qualifications', COUNT(*)
FROM qualifications q
LEFT JOIN employees e ON q.employee_id = e.employee_id
WHERE e.employee_id IS NULL

UNION ALL

SELECT 'visa_history', COUNT(*)
FROM visa_history v
LEFT JOIN employees e ON v.employee_id = e.employee_id
WHERE e.employee_id IS NULL

UNION ALL

SELECT 'onboarding', COUNT(*)
FROM onboarding o
LEFT JOIN employees e ON o.employee_id = e.employee_id
WHERE e.employee_id IS NULL

UNION ALL

SELECT 'offboarding', COUNT(*)
FROM offboarding o
LEFT JOIN employees e ON o.employee_id = e.employee_id
WHERE e.employee_id IS NULL;


-- ============================================================
-- 4. CANDIDATE / APPLICATION CHECK
-- ============================================================

SELECT COUNT(*) AS orphaned_applications
FROM applications a
LEFT JOIN candidates c
    ON a.candidate_id = c.candidate_id
WHERE c.candidate_id IS NULL;


-- ============================================================
-- 5. CLIENT / ASSIGNMENT CHECK
-- ============================================================

SELECT COUNT(*) AS orphaned_assignment_clients
FROM assignments a
LEFT JOIN clients c
    ON a.client_id = c.client_id
WHERE c.client_id IS NULL;


-- ============================================================
-- 6. CLIENT FEEDBACK RELATIONSHIPS
-- ============================================================

SELECT 'client' AS relationship, COUNT(*) AS orphaned_records
FROM client_feedback f
LEFT JOIN clients c
    ON f.client_id = c.client_id
WHERE c.client_id IS NULL

UNION ALL

SELECT 'assignment', COUNT(*)
FROM client_feedback f
LEFT JOIN assignments a
    ON f.assignment_id = a.assignment_id
WHERE a.assignment_id IS NULL

UNION ALL

SELECT 'employee', COUNT(*)
FROM client_feedback f
LEFT JOIN employees e
    ON f.employee_id = e.employee_id
WHERE e.employee_id IS NULL;


-- ============================================================
-- 7. OFFBOARDING / EMPLOYMENT HISTORY CHECK
-- ============================================================

SELECT COUNT(*) AS orphaned_offboarding_history
FROM offboarding o
LEFT JOIN employment_history h
    ON o.employment_history_id = h.employment_history_id
WHERE h.employment_history_id IS NULL;


-- ============================================================
-- 8. EMPLOYMENT HISTORY / EMPLOYEE CHECK
-- ============================================================

SELECT COUNT(*) AS orphaned_employment_history
FROM employment_history h
LEFT JOIN employees e
    ON h.employee_id = e.employee_id
WHERE e.employee_id IS NULL;


-- ============================================================
-- 9. BASIC NULL CHECKS FOR CORE IDENTIFIERS
-- ============================================================

SELECT 'employees.employee_id' AS field_name, COUNT(*) AS null_count
FROM employees
WHERE employee_id IS NULL

UNION ALL

SELECT 'employees.candidate_id', COUNT(*)
FROM employees
WHERE candidate_id IS NULL

UNION ALL

SELECT 'assignments.employee_id', COUNT(*)
FROM assignments
WHERE employee_id IS NULL

UNION ALL

SELECT 'assignments.client_id', COUNT(*)
FROM assignments
WHERE client_id IS NULL

UNION ALL

SELECT 'performance.employee_id', COUNT(*)
FROM performance
WHERE employee_id IS NULL

UNION ALL

SELECT 'attendance.employee_id', COUNT(*)
FROM attendance
WHERE employee_id IS NULL;


-- ============================================================
-- 10. DATE LOGIC CHECKS
-- ============================================================

SELECT COUNT(*) AS invalid_client_dates
FROM clients
WHERE client_relationship_end_date IS NOT NULL
  AND client_relationship_end_date < client_relationship_start_date;


SELECT COUNT(*) AS invalid_assignment_dates
FROM assignments
WHERE assignment_end_date IS NOT NULL
  AND assignment_end_date < assignment_start_date;


SELECT COUNT(*) AS invalid_employment_dates
FROM employment_history
WHERE employment_end_date IS NOT NULL
  AND employment_end_date < employment_start_date;


SELECT COUNT(*) AS invalid_onboarding_dates
FROM onboarding
WHERE onboarding_end_date IS NOT NULL
  AND onboarding_end_date < onboarding_start_date;


-- ============================================================
-- 11. BOOLEAN / STATUS VALUE CHECKS
-- ============================================================

SELECT DISTINCT client_status
FROM clients
ORDER BY client_status;


SELECT DISTINCT assignment_status
FROM assignments
ORDER BY assignment_status;


SELECT DISTINCT employment_status
FROM employment_history
ORDER BY employment_status;


SELECT DISTINCT candidate_status
FROM candidates
ORDER BY candidate_status;


SELECT DISTINCT completion_status
FROM onboarding
ORDER BY completion_status;


-- ============================================================
-- 12. DATA QUALITY SUMMARY
-- ============================================================

SELECT
    (SELECT COUNT(*) FROM employees) AS employees,
    (SELECT COUNT(*) FROM assignments) AS assignments,
    (SELECT COUNT(*) FROM attendance) AS attendance,
    (SELECT COUNT(*) FROM performance) AS performance,
    (SELECT COUNT(*) FROM training) AS training,
    (SELECT COUNT(*) FROM offboarding) AS offboarding,
    (SELECT COUNT(*) FROM client_feedback) AS client_feedback;
