WITH rand_areas(id, name) AS (
  SELECT
    generate_series(1,10) AS id,
    md5(random()::text) AS name
)
INSERT INTO areas (name)
SELECT
  name
FROM rand_areas;

WITH rand_employers(id, name, area_id) AS (
  SELECT
    generate_series(1,2500) AS id,
    md5(random()::text) AS name,
    floor(random() * 10 + 1)::int AS area_id
)
INSERT INTO employers (name, area_id)
SELECT
  name,
  area_id
FROM rand_employers;

WITH rand_specialisations(id, name) AS (
  SELECT
    generate_series(1,500) AS id,
    md5(random()::text) AS name
)
INSERT INTO specialisations (name)
SELECT
  name
FROM rand_specialisations;

WITH rand_vacancies(id, salary, create_date, specialisation_id, employer_id, title) AS (
  SELECT
    generate_series(1,10000) AS id,
    round((random() * 100000)::int, -3) AS salary,
    '2020-01-01'::date + (random() * (CURRENT_DATE - '2020-01-01'::date))::int AS create_date,
    floor(random() * 500 + 1)::int AS specialisation_id,
    floor(random() * 2500 + 1)::int AS employer_id,
    md5(random()::text) AS title
)
INSERT INTO vacancies (compensation_from, compensation_to, create_date, specialisation_id, employer_id, title)
SELECT
  salary,
  salary + floor(random() * 20000 + 1)::int,
  create_date,
  specialisation_id,
  employer_id,
  title
FROM rand_vacancies;

WITH rand_resumes(id, first_name, second_name, email, experience, area_id, create_date, specialisation_id) AS (
  SELECT
    generate_series(1,100000) AS id,
    md5(random()::text) AS first_name,
    md5(random()::text) AS second_name,
    CONCAT(md5(random()::text), '@gmail.com') AS email,
    floor(random() * 50 + 1)::int AS experience,
    floor(random() * 10 + 1)::int AS area_id,
    '2020-01-01'::date + (random() * (CURRENT_DATE - '2020-01-01'::date))::int AS create_date,
    floor(random() * 500 + 1)::int AS specialisation_id
)
INSERT INTO resumes (first_name, second_name, email, experience, area_id, create_date, specialisation_id)
SELECT
  first_name,
  second_name,
  email,
  experience,
  area_id,
  create_date,
  specialisation_id
FROM rand_resumes;

WITH rand_responses(id, vacancy_id, resume_id, response_date) AS (
  SELECT
    generate_series(1,1000000) AS id,
    floor(random() * 10000 + 1)::int AS vacancy_id,
    floor(random() * 100000 + 1)::int AS resume_id,
    '2020-01-01'::date + (random() * (CURRENT_DATE - '2020-01-01'::date))::int AS response_date
)
INSERT INTO responses (vacancy_id, resume_id, response_date)
SELECT
  vacancy_id,
  resume_id,
  response_date
FROM rand_responses;
