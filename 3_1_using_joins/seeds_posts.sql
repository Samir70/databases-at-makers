-- DROP TABLE IF EXISTS "public"."posts";
-- CREATE TABLE "public"."posts" (
--     "id" SERIAL,
--     "title" text,
--     PRIMARY KEY ("id")
-- );
TRUNCATE TABLE posts RESTART IDENTITY;

INSERT INTO "public"."posts" ("id", "title") VALUES
(1, 'How to use Git'),
(2, 'Ruby classes'),
(3, 'Using IRB'),
(4, 'My weekend in Edinburgh'),
(5, 'The best chocolate cake EVER'),
(6, 'A foodie week in Spain'),
(7, 'SQL basics');
