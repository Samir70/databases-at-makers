-- nouns: movies, title, genre, release_year
CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title text,
  genre text,
  release_year int
);

INSERT INTO movies (title, genre, release_year) VALUES ('Star Wars', 'Fantasy', 1976)