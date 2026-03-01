WITH full_vacancy_responces (id, title, count_responses) AS (
  SELECT
    v.id AS id,
    v.title AS title,
    count(r.id) AS count_responses
  FROM vacancies v
  JOIN responses r ON v.id = r.vacancy_id AND (r.response_date - v.create_date) <= 7
  GROUP BY v.id, v.title
)
SELECT
  id,
  title
FROM full_vacancy_responces
WHERE count_responses > 5