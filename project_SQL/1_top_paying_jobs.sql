/* WHAT ARE THE TOP PAYING DATA ANALYST JOBS?
- IDENTIFY THE TOP 10 HIGHEST PAYING DATA ANALYST ROLES THAT ARE AVAILABLE REMOTELY
- FOCUSES ON JOB POSTINGS WITH SPECIFIED SALARIES (REMOVE NULL)
- WHY? HIGHLIGHT THE TOP-PAYING OPPORTUNITIES FOR DATA ANALYSTS
*/

SELECT
    job_id,
    job_title,
    name AS company_name,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN
    company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;

--querry 1 done