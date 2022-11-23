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

INSERT INTO posts (title, content) VALUES ('Amazing post', 'that has really dull content');
INSERT INTO posts (title, content) VALUES ('Anaother amazing post', 'that also has really dull content');

INSERT INTO comments (content, author_name, post_id) VALUES ('I was amazed at how dull this post was', 'anon78', 1);
INSERT INTO comments (content, author_name, post_id) VALUES ('I whole heartedly agree regarding the dullness of this post', 'DonaldTrump', 1);