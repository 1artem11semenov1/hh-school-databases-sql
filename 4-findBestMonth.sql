WITH vacancies_month (vacancies_count, create_month, create_year) AS (
  SELECT
    count(id) AS vacancies_count,
    EXTRACT(MONTH FROM create_date) AS create_month,
    EXTRACT(YEAR FROM create_date) AS create_year
    FROM vacancies
    GROUP BY create_month, create_year
),
avg_vacancies_month (vacancies_count, create_month) AS (
  SELECT
    floor(avg(vacancies_count)) AS avg_vacancies_count, create_month
    FROM vacancies_month
    GROUP BY create_month
    ORDER BY avg_vacancies_count DESC
    LIMIT 1
),
resumes_month (resumes_count, create_month, create_year) AS (
  SELECT
    count(id) AS resumes_count,
    EXTRACT(MONTH FROM create_date) AS create_month,
    EXTRACT(YEAR FROM create_date) AS create_year
  FROM resumes
  GROUP BY create_month, create_year
),
avg_resumes_month (resumes_count, create_month) AS (
  SELECT
    floor(avg(resumes_count)) AS avg_resumes_count,
    create_month
  FROM resumes_month
  GROUP BY create_month
  ORDER BY avg_resumes_count DESC
  LIMIT 1
)
SELECT
  avm.create_month AS most_popular_vacancy_month,
  arm.create_month AS most_popular_resume_month
FROM avg_vacancies_month avm
CROSS JOIN avg_resumes_month arm
