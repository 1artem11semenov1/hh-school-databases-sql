SELECT
  area_id,
  avg(compensation_from) AS avg_from,
  avg(compensation_to) AS avg_to,
  avg((compensation_from + compensation_to)/2) AS avg_a_maen_compensation
FROM vacancies v
JOIN employers e ON e.id = v.employer_id
GROUP BY area_id
ORDER BY area_id;
