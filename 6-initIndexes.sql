/*
 * employer_id для ускорения джойна, а compensation для ускорения выборки.
 * при этом компенсации используются только для селекта, поэтому прописаны через include,
 * а не в основную часть индекса
 * */
CREATE INDEX employer_compensations_index ON vacancies(employer_id)
INCLUDE(compensation_from, compensation_to);

/*
 * в запросе с поиском месяцев с наибольшим количеством резюме и вакансий
 * требуется постоянно проходить по датам и выделять из них составные части (месяц, год)
 * поэтому есть смысл сделать индексы для дат в этих таблицах
 * */
CREATE INDEX vacancy_create_date_index ON vacancies(create_date);
CREATE INDEX resume_create_date_index ON resumes(create_date);

/*
 * для быстрого поиска откликов по вакансии и дате в задаче с нахождением популярных резюме
 * */
CREATE INDEX vacancy_response_date_index ON responses(vacancy_id, response_date);
