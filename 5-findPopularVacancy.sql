SELECT
  v.id,
  v.title
FROM vacancies v
JOIN responses r ON v.id = r.vacancy_id AND (r.response_date - v.create_date) <= 7
GROUP BY v.id, v.title
HAVING count(r.*) > 5
