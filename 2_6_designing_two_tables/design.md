# Two Tables Design Recipe Template


## 1. Extract nouns from the user stories or specification
As a blogger
So I can write interesting stuff
I want to write posts having a title.

As a blogger
So I can write interesting stuff
I want to write posts having a content.

As a blogger
So I can let people comment on interesting stuff
I want to allow comments on my posts.

As a blogger
So I can let people comment on interesting stuff
I want the comments to have a content.

As a blogger
So I can let people comment on interesting stuff
I want the author to include their name in comments.

nouns: 
posts, title, content
comments, content, author_name

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| post                  | title, content   
| comment               | content, author_name

1. Name of the first table (always plural): `posts` 

    Column names: `title`, `content`

2. Name of the second table (always plural): `comments` 

    Column names: `content`, `author_name`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

1. Name of the first table (always plural): `posts` 

    Column names: 
    `title` text, 
    `content` text

2. Name of the second table (always plural): `comments` 

    Column names: 
    `content` text, 
    `author_name` text


## 4. Decide on The Tables Relationship

Most of the time, you'll be using a **one-to-many** relationship, and will need a **foreign key** on one of the two tables.

```
# EXAMPLE

1. Can one post have many comments? YES
2. Can one comment have many posts? NO

-> Therefore,
-> A post HAS MANY comments
-> A comment BELONGS TO a post

-> Therefore, the foreign key is on the comments table.
```

*If you can answer YES to the two questions, you'll probably have to implement a Many-to-Many relationship, which is more complex and needs a third table (called a join table).*

## 4. Write the SQL.

```sql
-- EXAMPLE, start with table that doesn't have foreign key
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title text,
  content text
);

-- Then the table with the foreign key.
CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  content text,
  author_name text,
-- The foreign key name is always {other_table_singular}_id
  post_id int,
  constraint fk_post foreign key(post_id)
    references posts(id)
    on delete cascade
-- configures the database to automatically remove related records referencing it (e.g delete all related comments), so there are no "orphans" records 
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 database_name < albums_table.sql
```