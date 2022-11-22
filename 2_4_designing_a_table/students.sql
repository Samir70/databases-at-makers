CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  first_name text,
  second_name text,
  cohort text
);

INSERT INTO students (first_name, second_name, cohort) VALUES ('Samir', 'Betmouni', 'October 2022')
