CREATE TABLE specialisations (
  id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name text NOT NULL
);

CREATE TABLE areas (
  id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name text NOT NULL
);

CREATE TABLE employers (
  id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name text NOT NULL,
  area_id integer NOT NULL REFERENCES areas(id)
);

CREATE TABLE vacancies (
  id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  compensation_from integer,
  compensation_to integer,
  create_date date,
  title text,
  specialisation_id integer NOT NULL REFERENCES specialisations(id),
  employer_id integer NOT NULL REFERENCES employers(id)
);

CREATE TABLE resumes (
  id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  first_name text NOT NULL,
  second_name text NOT NULL,
  email text,
  experience integer,
  area_id integer,
  create_date date,
  specialisation_id integer NOT NULL REFERENCES specialisations(id)
);

CREATE TABLE responses (
  id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  vacancy_id integer NOT NULL REFERENCES vacancies(id),
  resume_id integer NOT NULL REFERENCES resumes(id),
  response_date date
);