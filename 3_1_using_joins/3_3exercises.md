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