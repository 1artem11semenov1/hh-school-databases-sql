SELECT
  e.area_id,
  floor(avg(compensation_from)) AS avg_from,
  floor(avg(compensation_to)) AS avg_to,
  floor(avg((compensation_from + compensation_to)/2)) AS avg_a_maen_compensation
FROM vacancies v
JOIN employers e ON e.id = v.employer_id
GROUP BY e.area_id
ORDER BY e.area_id;
