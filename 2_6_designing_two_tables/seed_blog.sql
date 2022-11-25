CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title text,
  content text
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  content text,
  author_name text,
  post_id int,
  constraint fk_post foreign key(post_id)
    references posts(id)
    on delete cascade
);

INSERT INTO posts (title, content) VALUES ('Post 1', 'Donald wants us to drink bleach.');
INSERT INTO posts (title, content) VALUES ('Post 2', 'Donald knew that buying gas from Russia was wrong');
INSERT INTO posts (title, content) VALUES ('Post 3', 'Donald is running for President');

INSERT INTO comments (content, author_name, post_id) VALUES ('I was amazed at how dull this post was', 'anon78', 1);
INSERT INTO comments (content, author_name, post_id) VALUES ('I did not say that. The mainstream media is misquoting me in order to kill the masses', 'DonaldTrump', 1);
INSERT INTO comments (content, author_name, post_id) VALUES ('This blog is a way better platform than twitter!', 'DonaldTrump', 1);
INSERT INTO comments (content, author_name, post_id) VALUES ('Buy gas for £2 a year, just give bank details to crook@ocg.co.uk', 'H', 2);
INSERT INTO comments (content, author_name, post_id) VALUES ('Buy gas from the USA and help make America great again', 'DonaldTrump', 2);