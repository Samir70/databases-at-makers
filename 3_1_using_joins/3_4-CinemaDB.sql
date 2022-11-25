-- As a cinema company manager,
-- So I can keep track of movies being shown,
-- I want to keep a list of movies with their title and release date.

DROP TABLE IF EXISTS "public"."movies";

CREATE TABLE "public"."movies" (
    "id" SERIAL,
    "title" text,
    "release_date" int,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."movies" (id, title, release_date) VALUES 
(1, 'Blade Runner', 1986),
(2, 'Alien', 1988),
(3, 'Star Wars', 1977),
(4, 'Die Hard', 1990),
(5, 'Force 10 From Navarone', 1979),
(6, 'Jaws', 1978),
(7, 'Omen', 1978);

-- As a cinema company manager,
-- So I can keep track of movies being shown,
-- I want to keep a list of my cinemas with their city name (e.g 'London' or 'Manchester').

DROP TABLE IF EXISTS "public"."cinemas";

CREATE TABLE "public"."cinemas" (
    "id" SERIAL,
    "city" text,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."cinemas" ("id", "city") VALUES 
(1, 'Manchester'),
(2, 'Londen'),
(3, 'Liverpool'),
(4, 'Aylesbury');

-- As a cinema company manager,
-- So I can keep track of movies being shown,
-- I want to be able to list which cinemas are showing a specific movie.

DROP TABLE IF EXISTS "public"."cinemas_movies";

CREATE TABLE "public"."cinemas_movies" (
    "cinema_id" int,
    "movie_id" int
);

INSERT INTO "public"."cinemas_movies" ("cinema_id", "movie_id") VALUES 
(1, 2),
(1, 3),
(1, 5),
(1, 6),
(1, 7),
(2, 2),
(2, 1),
(2, 5),
(2, 6),
(3, 6),
(3, 1),
(3, 2),
(3, 4),
(3, 5),
(4, 5),
(4, 6),
(4, 7),
(4, 1);

-- As a cinema company manager,
-- So I can keep track of movies being shown,
-- I want to be able to list which movies are being shown a specific cinema.

-- SELECT title FROM cinemas 
--     JOIN cinemas_movies ON cinemas.id = cinema_id
--     JOIN movies ON movies.id = movie_id
--     WHERE cinema_id = 3

--          title
-- ------------------------
--  Blade Runner
--  Alien
--  Die Hard
--  Force 10 From Navarone
--  Jaws
-- (5 rows)