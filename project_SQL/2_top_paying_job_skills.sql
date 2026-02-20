/* QUESTION
WHAT SKILLS ARE REQUIRED FOR THE TOP PAYING DATA ANALYST JOBS?
- USE THE TOP 10 HIHEST PAYING DATA ANALYST JOBS FROM THE FORST QUERRY
- ADD THE SPECIFIC SKILLS REQUIRED FOR THESE ROLES
- WHY? IT PROVIDES A DETAILED LOOK AT WHICH HIGH PAYING JOBS DEMAND CERTAIN SKILLS,
    HELPING JOB SEEKERS TO UNDERSTAD WHICH SKILLS TO DEVELOP THAT ALIGN WITH TOP SALARIES.
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        name AS company_name,
        salary_year_avg
    FROM
        job_postings_fact
    INNER JOIN
        company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT top_paying_jobs.*,
       skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC;