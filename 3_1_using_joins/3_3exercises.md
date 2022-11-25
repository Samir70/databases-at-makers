# double joins

```sql
select posts.id, title from posts join posts_tags on post_id = posts.id join tags on tag_id = tags.id where tags.id = 2;;
```

```
 id |          title
----+-------------------------
  4 | My weekend in Edinburgh
  6 | A foodie week in Spain
(2 rows)
```


## challenge

```sql
INSERT INTO tags (id, name) VALUES (5, 'sql');
INSERT INTO posts (id, title) VALUES (8, 'SQL for beginners');
INSERT INTO posts_tags (post_id, tag_id) VALUES (7, 5), (8, 5);

SELECT posts.id, title FROM posts JOIN posts_tags ON post_id = posts.id JOIN tags ON tag_id = tags.id WHERE tags.id = 5;
```

```
id |       title
----+-------------------
  7 | SQL basics
  8 | SQL for beginners
(2 rows)
```


## Sam's challenge
```sql
select * from posts join posts_tags on posts.id = post_id join tags on tags.id = tag_id where tag_id = 2 or tag_id = 3;
```
```
 id |            title             | post_id | tag_id | id |  name
----+------------------------------+---------+--------+----+---------
  6 | A foodie week in Spain       |       6 |      2 |  2 | travel
  4 | My weekend in Edinburgh      |       4 |      2 |  2 | travel
  6 | A foodie week in Spain       |       6 |      3 |  3 | cooking
  5 | The best chocolate cake EVER |       5 |      3 |  3 | cooking
(4 rows)
```

It looks like it found the records with a tag_id = 2 then the records with tag_id = 3
 ## Looking for both a tag and a post id
```sql
 select * from posts join posts_tags on posts.id = post_id join tags on tags.id = tag_id where tag_id = 2 or post_id = 3;
```
```
 id |          title          | post_id | tag_id | id |  name
----+-------------------------+---------+--------+----+--------
  3 | Using IRB               |       3 |      1 |  1 | coding
  6 | A foodie week in Spain  |       6 |      2 |  2 | travel
  4 | My weekend in Edinburgh |       4 |      2 |  2 | travel
  3 | Using IRB               |       3 |      4 |  4 | ruby
(4 rows)
```

In the table of full results, both the posts with id=6 are after the post with id=4. So why do we get the above order?

Results are in the order of the full table if you look for the same thing with ids from the left and right tables rather than the middle table:

```sql
 select * from posts join posts_tags on posts.id = post_id join tags on tags.id = tag_id where tags.id = 2 or posts.id = 3;
```
```
 id |          title          | post_id | tag_id | id |  name
----+-------------------------+---------+--------+----+--------
  3 | Using IRB               |       3 |      1 |  1 | coding
  4 | My weekend in Edinburgh |       4 |      2 |  2 | travel
  6 | A foodie week in Spain  |       6 |      2 |  2 | travel
  3 | Using IRB               |       3 |      4 |  4 | ruby
(4 rows)
```

It looks like it just went down the table of all results and selected them in that order.

## The whole table.
```sql
select * from posts join posts_tags on posts.id = post_id join tags on tags.id = tag_id;
```
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
  7 | SQL basics                   |       7 |      5 |  5 | sql
  8 | SQL for beginners            |       8 |      5 |  5 | sql
(12 rows)
```