# Joins in a many to many relationship

These are the three tables we have in the blogs database:

```sql
select * from tags;
select * from posts_tags;
select * from posts;
```
gives
```
 id |  name
----+---------
  1 | coding
  2 | travel
  3 | cooking
  4 | ruby
(4 rows)
```
```
 post_id | tag_id
---------+--------
       1 |      1
       2 |      1
       3 |      1
       4 |      2
       5 |      3
       6 |      2
       7 |      1
       6 |      3
       2 |      4
       3 |      4
(10 rows)

```
```
 id |            title
----+------------------------------
  1 | How to use Git
  2 | Ruby classes
  3 | Using IRB
  4 | My weekend in Edinburgh
  5 | The best chocolate cake EVER
  6 | A foodie week in Spain
  7 | SQL basics
(7 rows)
```

Note that `posts_tags` has no primary key, it has repeated values in both columns.

Let's make the first join:

```sql
SELECT * FROM posts JOIN posts_tags ON post_id = posts.id;
```

Because `posts_tags` has repeated values in its `post_id` column, it is the rows of the left table `posts` that get repeated to fill out what looks like a new table. 

Think of it as a horrbily named pretend-table called
> `posts join posts_tags on post_id = posts.id`

```
 id |            title             | post_id | tag_id
----+------------------------------+---------+--------
  1 | How to use Git               |       1 |      1
  2 | Ruby classes                 |       2 |      1
  3 | Using IRB                    |       3 |      1
  4 | My weekend in Edinburgh      |       4 |      2
  5 | The best chocolate cake EVER |       5 |      3
  6 | A foodie week in Spain       |       6 |      2
  7 | SQL basics                   |       7 |      1
  6 | A foodie week in Spain       |       6 |      3
  2 | Ruby classes                 |       2 |      4
  3 | Using IRB                    |       3 |      4
(10 rows)
```

Then we can join the table `tags` to what we already have.

But, when we do that, we need another join instruction. 

```sql
select * from posts join posts_tags on post_id = posts.id join tags on tag_id = tags.id;
```
Giving a table where posts_tags is now in the middle.
```
 id |            title             | post_id | tag_id | id |  name
----+------------------------------+---------+--------+----+---------
  1 | How to use Git               |       1 |      1 |  1 | coding
  2 | Ruby classes                 |       2 |      1 |  1 | coding
  3 | Using IRB                    |       3 |      1 |  1 | coding
  4 | My weekend in Edinburgh      |       4 |      2 |  2 | travel
  5 | The best chocolate cake EVER |       5 |      3 |  3 | cooking
  6 | A foodie week in Spain       |       6 |      2 |  2 | travel
  7 | SQL basics                   |       7 |      1 |  1 | coding
  6 | A foodie week in Spain       |       6 |      3 |  3 | cooking
  2 | Ruby classes                 |       2 |      4 |  4 | ruby
  3 | Using IRB                    |       3 |      4 |  4 | ruby
(10 rows)
```