-- DaimonUpDown Education
-- 05_recruitment_analysis.sql
-- Recruitment funnel and hiring analysis

USE daimonupdown;

-- ============================================================
-- 1. APPLICATION PIPELINE
-- ============================================================

SELECT
    application_status,
    COUNT(*) AS applications,
    ROUND(
        100.0 * COUNT(*) /
        (SELECT COUNT(*) FROM applications),
        2
    ) AS pct_of_applications
FROM applications
GROUP BY application_status
ORDER BY applications DESC;


-- ============================================================
-- 2. APPLICATIONS BY RECRUITMENT SOURCE
-- ============================================================

SELECT
    c.recruitment_source,
    COUNT(*) AS candidates
FROM candidates c
GROUP BY c.recruitment_source
ORDER BY candidates DESC;


-- ============================================================
-- 3. CANDIDATE STATUS
-- ============================================================

SELECT
    candidate_status,
    COUNT(*) AS candidates,
    ROUND(
        100.0 * COUNT(*) /
        (SELECT COUNT(*) FROM candidates),
        2
    ) AS pct_of_candidates
FROM candidates
GROUP BY candidate_status
ORDER BY candidates DESC;


-- ============================================================
-- 4. APPLICATIONS BY POSITION
-- ============================================================

SELECT
    position_applied,
    COUNT(*) AS applications
FROM applications
GROUP BY position_applied
ORDER BY applications DESC;


-- ============================================================
-- 5. APPLICATION OUTCOME BY RECRUITMENT SOURCE
-- ============================================================

SELECT
    c.recruitment_source,
    a.application_status,
    COUNT(*) AS applications
FROM applications a
JOIN candidates c
    ON a.candidate_id = c.candidate_id
GROUP BY
    c.recruitment_source,
    a.application_status
ORDER BY
    c.recruitment_source,
    applications DESC;


-- ============================================================
-- 6. INTERVIEW CONVERSION
-- ============================================================

SELECT
    COUNT(*) AS total_applications,
    SUM(interview_date IS NOT NULL) AS interviewed,
    ROUND(
        100.0 * SUM(interview_date IS NOT NULL) / COUNT(*),
        2
    ) AS interview_rate
FROM applications;


-- ============================================================
-- 7. OFFER CONVERSION
-- ============================================================

SELECT
    COUNT(*) AS total_applications,
    SUM(offer_date IS NOT NULL) AS offers,
    ROUND(
        100.0 * SUM(offer_date IS NOT NULL) / COUNT(*),
        2
    ) AS offer_rate
FROM applications;


-- ============================================================
-- 8. OFFER ACCEPTANCE
-- ============================================================

SELECT
    COUNT(*) AS offers_with_response,
    SUM(
        LOWER(application_status) IN ('hired', 'accepted', 'offer accepted')
    ) AS accepted_offers,
    ROUND(
        100.0 *
        SUM(
            LOWER(application_status) IN ('hired', 'accepted', 'offer accepted')
        )
        /
        NULLIF(
            COUNT(*),
            0
        ),
        2
    ) AS acceptance_rate
FROM applications
WHERE offer_date IS NOT NULL;


-- ============================================================
-- 9. APPLICATION PROCESSING TIME
-- ============================================================

SELECT
    ROUND(
        AVG(
            DATEDIFF(
                COALESCE(
                    rejection_date,
                    offer_response_date,
                    offer_date,
                    interview_date
                ),
                application_date
            )
        ),
        1
    ) AS avg_days_in_pipeline
FROM applications
WHERE application_date IS NOT NULL
  AND COALESCE(
        rejection_date,
        offer_response_date,
        offer_date,
        interview_date
      ) IS NOT NULL;


-- ============================================================
-- 10. APPLICATIONS BY YEAR
-- ============================================================

SELECT
    YEAR(application_date) AS application_year,
    COUNT(*) AS applications
FROM applications
GROUP BY YEAR(application_date)
ORDER BY application_year;


-- ============================================================
-- 11. TOP RECRUITMENT SOURCES BY HIRED CANDIDATES
-- ============================================================

SELECT
    c.recruitment_source,
    COUNT(DISTINCT a.candidate_id) AS hired_candidates
FROM applications a
JOIN candidates c
    ON a.candidate_id = c.candidate_id
WHERE LOWER(a.application_status) IN ('hired', 'accepted', 'offer accepted')
GROUP BY c.recruitment_source
ORDER BY hired_candidates DESC;


-- ============================================================
-- 12. REJECTION REASONS
-- ============================================================

SELECT
    rejection_reason,
    COUNT(*) AS rejected_applications
FROM applications
WHERE rejection_reason IS NOT NULL
  AND TRIM(rejection_reason) <> ''
GROUP BY rejection_reason
ORDER BY rejected_applications DESC;


-- ============================================================
-- 13. RECRUITMENT SUMMARY
-- ============================================================

SELECT
    (SELECT COUNT(*) FROM candidates) AS total_candidates,
    (SELECT COUNT(*) FROM applications) AS total_applications,
    (SELECT COUNT(*) FROM applications
     WHERE interview_date IS NOT NULL) AS interviewed,
    (SELECT COUNT(*) FROM applications
     WHERE offer_date IS NOT NULL) AS offers,
    (SELECT COUNT(*) FROM candidates
     WHERE candidate_status = 'Hired') AS hired_candidates;
