/* PRACTICE PROBLEM ON UNIONS AND SUBQUERRY AND CTE
FIND JOB POSTINGS FROM THE FIRST QUARTER THAT HAVE A SALARY > 70K
- COMBINE JOB POSTINGS TABLE FROM THE FIRST QUARTER OF 2023
- GETS JOB POSTINGS WITH AVERAGE SALARY >70000*/

SELECT quarter_1_jobs.job_title_short,
       quarter_1_jobs.job_location,
       quarter_1_jobs.job_via,
       quarter_1_jobs.salary_year_avg,
       quarter_1_jobs.job_posted_date::DATE
FROM (SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs) AS quarter_1_jobs
WHERE quarter_1_jobs.salary_year_avg > 70000 AND
      quarter_1_jobs.job_title_short = 'Data Analyst'
ORDER BY quarter_1_jobs.salary_year_avg DESC;

/* LAST PRACTICE PROBLEM BEFORE GOING TO BED ON 18-02-2026
find the average salary category for 'Data Analyst' jobs across the entire first quarter.
*/

WITH q1_postings AS (SELECT *
                    FROM january_jobs
                    UNION ALL
                    SELECT *
                    FROM february_jobs
                    UNION ALL
                    SELECT *
                    FROM march_jobs)
SELECT job_title_short,
       salary_year_avg,
       job_posted_date,
    CASE WHEN salary_year_avg > 100000 THEN 'HIGH PAYING'
         WHEN salary_year_avg BETWEEN 70000 AND 100000 THEN 'STANDARD PAYING'
         ELSE 'LOW PAYING'
    END AS salary_category
FROM q1_postings
WHERE job_title_short = 'Data Analyst' AND
      salary_year_avg IS NOT NULL;

      LON