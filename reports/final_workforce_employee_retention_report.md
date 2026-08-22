# Workforce & Employee Retention Analytics --- Final Report

## 1. Executive Summary

This project combines two complementary workforce analytics views:

-   **Workforce Dashboard** --- assignment-level operational analysis.
-   **Employee Retention Dashboard** --- employee-level retention,
    departures, exit experience, and rehire potential.

The Workforce Dashboard helps explain how assignments are distributed
across statuses, years, and positions. The Employee Retention Dashboard
explains who is leaving, how they are leaving, why they are leaving, and
what departing employees report about their experience.

The strongest retention finding is that **voluntary departures dominate
recorded departures**. Among 320 departed employees, 259 were voluntary
and 61 were involuntary. The most frequently recorded individual leaving
reason was **Relocation (36)**, followed by Personal Reasons (34),
Career Change (33), Assignment Issues (30), Work-Life Balance (29),
Commute (28), and Compensation (27).

The data also shows a potential opportunity to maintain relationships
with former employees: among respondents, 164 said they would return,
and 259 departed employees were marked rehire eligible.

These findings describe observed patterns. They do **not** establish
that any individual factor caused employees to leave.

------------------------------------------------------------------------

## 2. Project Objective

The objective of this project is to turn workforce data into actionable
business analysis covering:

**Recruitment 〡 Onboarding 〡 Training 〡 Assignments 〡 Attendance 〡
Employee Experience 〡 Performance 〡 Client Experience 〡 Retention 〡
Turnover 〡 Offboarding**

The final analysis focuses on two dashboard perspectives:

1.  Workforce deployment and assignment activity.
2.  Employee retention and turnover.

------------------------------------------------------------------------

## 3. The Two Dashboards

### 3.1 Workforce Dashboard

The Workforce Dashboard uses assignment-level information.

It answers questions such as:

-   How do assignment statuses change over time?
-   Which assignment statuses are most common?
-   Which positions account for the largest assignment volumes?

The **Assignments by Status** visualization covers the available years
through 2026 and shows that assignment statuses fluctuate over time
rather than following one uniform pattern.

The **Assignments by Position** visualization shows that assignment
volume is concentrated in particular positions, with ALT / English
Teacher clearly representing the largest displayed assignment group.

#### Workforce interpretation

Operational planning should pay attention to the positions and
assignment statuses carrying the largest workload. Changes in
high-volume assignment groups can have a meaningful operational effect.

Assignment activity should not, however, be interpreted as employee
turnover. The Workforce Dashboard is assignment-level, while the
retention analysis is employee-level.

------------------------------------------------------------------------

### 3.2 Employee Retention Dashboard

The Employee Retention Dashboard uses one row per employee in the
verified dashboard dataset.

The dashboard shows:

-   **1,600 total employees**
-   **1,280 active employees**
-   **320 departed employees**
-   **259 voluntary departures**
-   **61 involuntary departures**

The dashboard displays an **80.0% retention rate**. For reporting
purposes, this should be treated as the dashboard's displayed retention
measure rather than automatically described as an annual retention rate,
because a defined annual reporting period and denominator have not been
established.

------------------------------------------------------------------------

### 3.3 How the Dashboards Fit Together

The dashboards answer different but connected business questions.

**Workforce Dashboard**

> How is the workforce being deployed?

**Employee Retention Dashboard**

> What is happening to employees after they join?

Together:

**Workforce deployment → employee population → departures → reasons for
leaving → exit experience → retention actions**

This distinction is important because assignment counts cannot
automatically be interpreted as employee turnover.

------------------------------------------------------------------------

## 4. Workforce Analysis

### Assignments by Status

The assignment-status visualization shows changing assignment activity
from 2021 through 2026.

The lines for Active, Completed, Ended, Renewed, and Transferred
assignments vary across the reporting period. Renewed assignments reach
a visible high point around 2024 before declining afterward, while
transferred assignments increase strongly after 2021 and remain
comparatively high in later years.

### Assignments by Position

The position visualization shows a strong concentration of assignments
in ALT / English Teacher, followed by Experienced Teacher, Senior
Teacher, and Trainer.

This indicates that workforce deployment is not evenly distributed
across positions.

### Business relevance

Management should monitor the high-volume positions closely because
changes in these areas can affect workforce capacity and assignment
operations.

------------------------------------------------------------------------

## 5. Employee Retention Analysis

### Employee Population

The retention dashboard contains 1,600 employees:

-   Active: **1,280**
-   Inactive/departed: **320**

The employee-level dataset was validated at one row per employee, with
1,600 rows and 1,600 unique employee IDs.

### Departure Type

Departures are predominantly voluntary:

  Departure Type     Employees
  ---------------- -----------
  Voluntary                259
  Involuntary               61
  **Total**            **320**

Voluntary departures represent approximately **80.9%** of recorded
departures.

### Why Employees Leave

  Leaving Reason         Departures
  -------------------- ------------
  Relocation                     36
  Personal Reasons               34
  Career Change                  33
  Assignment Issues              30
  Work-Life Balance              29
  Commute                        28
  Compensation                   27
  Returning Home                 22
  Career Development             20
  Contract End                   15
  Policy Violation               14
  Client Request                 13
  Attendance                     11
  Performance                     8

**Relocation is the most frequently recorded individual reason, with 36
departures.**

However, the next several categories are close in size. This means the
data does not support a conclusion that one single issue explains
employee turnover.

Instead, the departure pattern spans personal, career, assignment,
work-life, location, and compensation-related reasons.

------------------------------------------------------------------------

## 6. Exit Experience

### Exit Satisfaction

The Exit Satisfaction visualization contains 253 recorded responses:

    Rating   Responses
  -------- -----------
         1          54
         2          57
         3          47
         4          49
         5          46

The largest response category is **2**, with 57 responses.

Ratings 1--2 account for 111 responses, while ratings 4--5 account for
95 responses.

This indicates that the exit experience is mixed rather than
concentrated entirely at the positive end.

Missing exit-survey responses should remain missing and should not be
interpreted as negative responses.

### Would Recommend

Among the 253 recorded responses:

-   Yes: **186**
-   No: **67**

Approximately **73.5%** of respondents said they would recommend the
organization.

### Would Return

Among the 253 recorded responses:

-   Yes: **164**
-   No: **89**

Approximately **64.8%** said they would return.

### Rehire Eligibility

Among the 320 departed employees:

-   Eligible: **259**
-   Not eligible: **61**

Rehire eligibility is therefore aligned with the voluntary/involuntary
departure split in the current data: 259 employees are eligible and 61
are not.

------------------------------------------------------------------------

## 7. Key Business Insights

### Insight 1 --- Voluntary departure is the dominant departure pattern

The majority of departures are voluntary.

**Implication:** understanding the employee decisions behind voluntary
exits should be a central part of retention planning.

------------------------------------------------------------------------

### Insight 2 --- No single reason explains turnover

Relocation is the largest individual reason, but Personal Reasons,
Career Change, Assignment Issues, Work-Life Balance, Commute, and
Compensation are all relatively close.

**Implication:** retention should use a portfolio of targeted
interventions rather than relying on one universal solution.

------------------------------------------------------------------------

### Insight 3 --- Assignment and career factors deserve investigation

Assignment Issues, Career Change, and Career Development all appear
among recorded leaving reasons.

**Implication:** management should investigate assignment fit, career
progression, and development opportunities as potential areas for
retention improvement.

This is an observed association, not proof of causation.

------------------------------------------------------------------------

### Insight 4 --- Former employees retain positive sentiment in many cases

Among employees with recorded exit-survey responses, more respondents
said they would recommend the organization and would return than said
they would not.

**Implication:** some departures may be compatible with a continuing
positive relationship with the organization.

------------------------------------------------------------------------

### Insight 5 --- Rehire eligibility represents a potential talent pool

The dashboard identifies 259 departed employees as rehire eligible.

**Implication:** maintaining appropriate relationships with eligible
former employees could create a future recruitment opportunity.

------------------------------------------------------------------------

# 8. Risk Assessment

The following risk assessment is based only on patterns visible in the
existing dashboards.

  --------------------------------------------------------------------------
  Risk Area            Assessment        Evidence          Business Concern
  -------------------- ----------------- ----------------- -----------------
  Voluntary turnover   **High            259 of 320        A large share of
                       attention**       departures were   departures may
                                         voluntary         warrant deeper
                                                           retention
                                                           investigation

  Concentration of     **Medium          Several leading   A single
  leaving reasons      attention**       reasons are       retention
                                         relatively close  solution is
                                         rather than one   unlikely to
                                         dominant cause    address all
                                                           departures

  Assignment-related   **Medium          Assignment Issues Assignment fit
  risk                 attention**       is one of the     and workforce
                                         leading recorded  deployment should
                                         reasons           be investigated

  Career-development   **Medium          Career Change and Career pathways
  risk                 attention**       Career            may warrant
                                         Development       further
                                         appear among      investigation
                                         recorded reasons  

  Work-life/location   **Medium          Work-Life         Location and
  risk                 attention**       Balance, Commute, work-life factors
                                         and Relocation    may affect
                                         are prominent     retention for
                                         reasons           some employees

  Exit-experience risk **Medium          Satisfaction      Departure
                       attention**       responses include feedback should
                                         substantial low   be reviewed
                                         ratings           systematically

  Former-employee      **Opportunity**   259 departed      Former employees
  opportunity                            employees are     may represent a
                                         rehire eligible;  potential future
                                         164 respondents   talent pool
                                         would return      
  --------------------------------------------------------------------------

### Risk interpretation

These ratings are **prioritization levels**, not statistical risk
scores.

The data identifies areas that deserve management attention. It does not
establish probability of future turnover or causal relationships.

------------------------------------------------------------------------

# 9. Recommendations

## Recommendation 1 --- Focus first on voluntary departures

Because voluntary departures represent the majority of recorded
departures, retention efforts should prioritize understanding voluntary
exit decisions.

Use structured stay interviews and exit interviews to monitor:

-   Career development
-   Assignment experience
-   Work-life balance
-   Commute/location
-   Compensation
-   Personal circumstances

------------------------------------------------------------------------

## Recommendation 2 --- Strengthen career-development conversations

Career Change and Career Development appear among the recorded departure
reasons.

Potential actions include:

-   clearer career pathways
-   regular development conversations
-   internal progression opportunities
-   skills-development planning

These actions should be evaluated against future retention outcomes
rather than assumed to reduce turnover.

------------------------------------------------------------------------

## Recommendation 3 --- Review assignment fit

Assignment Issues is one of the leading recorded reasons for departure.

Management should investigate whether specific assignment
characteristics are associated with departures.

Potential areas to review include assignment fit, location, assignment
duration, and employee preferences.

The current dashboard does not prove that assignment conditions cause
turnover.

------------------------------------------------------------------------

## Recommendation 4 --- Investigate location and work-life challenges

Relocation, Commute, and Work-Life Balance are all prominent recorded
reasons.

Potential responses include reviewing:

-   assignment location
-   commute burden
-   relocation support
-   employee location preferences
-   work-life expectations

------------------------------------------------------------------------

## Recommendation 5 --- Use exit feedback as an early-warning signal

Exit satisfaction and exit-sentiment information should be reviewed
regularly.

The goal should be to identify repeated employee-experience issues
before they appear repeatedly in future departures.

------------------------------------------------------------------------

## Recommendation 6 --- Maintain a rehire-eligible talent pool

The dashboard identifies 259 departed employees as rehire eligible,
while 164 respondents indicated that they would return.

Where appropriate, the organization could maintain relationships with
former employees who left in good standing.

This could reduce future recruitment effort for suitable roles.

------------------------------------------------------------------------

# 10. Limitations

The analysis has several important limitations:

1.  The dashboards describe observed patterns and do not establish
    causation.
2.  The displayed 80.0% retention measure should not automatically be
    described as an annual retention rate.
3.  Exit-survey fields contain missing responses.
4.  Some departure reasons are personal or external and may not be
    directly controllable by the organization.
5.  The Workforce Dashboard is assignment-level, while the Employee
    Retention Dashboard is employee-level.
6.  The analysis is limited to the fields and reporting period available
    in the project data.
7.  Risk levels in this report are analytical prioritization judgments,
    not predictive risk scores.
8.  The project does not currently demonstrate that a particular
    retention intervention will cause turnover to decrease.

------------------------------------------------------------------------

# 11. Data Quality and Validation

The final Employee Retention dataset was validated at the employee
level.

Verified results:

-   Total employees: **1,600**
-   Unique employee IDs: **1,600**
-   Duplicate employee IDs: **0**
-   Active employees: **1,280**
-   Inactive employees: **320**
-   Employees with offboarding dates: **320**
-   Active employees with an offboarding date: **0**
-   TSV rows: **1,600**
-   Final CSV rows: **1,600**
-   Successful TSV-to-CSV conversion

The employee-level grain check confirmed one row per employee in the
final CSV.

NULL offboarding and exit-survey values were preserved rather than
interpreted as negative responses or zero values.

------------------------------------------------------------------------

# 12. Final Conclusion

The project demonstrates an end-to-end analytics workflow connecting
operational workforce data with employee retention analysis.

The Workforce Dashboard shows how assignments are distributed across
statuses, years, and positions.

The Employee Retention Dashboard shows who is leaving, how they are
leaving, why they are leaving, and what departing employees report about
their experience.

The most important retention observation is that **voluntary departures
dominate**, with **Relocation** being the most frequently recorded
individual leaving reason.

At the same time, exit-sentiment results show that many departing
employees would still recommend the organization or consider returning.

This creates two complementary opportunities:

**1. Reduce preventable voluntary departures where the organization has
influence.**

**2. Maintain relationships with former employees who remain positive
toward the organization and are eligible for rehire.**

The strongest next step is not to create more charts, but to use these
findings to guide targeted retention questions and monitor whether
future workforce outcomes change.

------------------------------------------------------------------------

## Dashboard Resources

-   [Workforce Dashboard
    dataset](../dashboard/data/workforce_dashboard.csv)
-   [Employee Retention
    dataset](../dashboard/data/employee_retention.csv)
-   [Workforce Dashboard image](../images/workforce_dashboard.png)
-   [Employee Retention Dashboard
    image](../images/employee_retention_dashboard.png)
