# using joins

```sql
select * from albums join artists on albums.artist_id = artists.id;
```
Notice that the `albums` table is returned in full, but each row has three new columns. Those columns are rows from the `artists` table. A row is selected from artists based on the `join` condition we gave. That is why those two columns always have the same value.

It's as if we are selecting data from a new table that somehow has two id columns.
```
 id |        title         | release_year | artist_id | id |     name     | genre
----+----------------------+--------------+-----------+----+--------------+-------
  1 | Doolittle            |         1989 |         1 |  1 | Pixies       | Rock
  2 | Surfer Rosa          |         1988 |         1 |  1 | Pixies       | Rock
  3 | Waterloo             |         1974 |         2 |  2 | ABBA         | Pop
  4 | Super Trouper        |         1980 |         2 |  2 | ABBA         | Pop
  5 | Bossanova            |         1990 |         1 |  1 | Pixies       | Rock
  6 | Lover                |         2019 |         3 |  3 | Taylor Swift | Pop
  7 | Folklore             |         2020 |         3 |  3 | Taylor Swift | Pop
  8 | I Put a Spell on You |         1965 |         4 |  4 | Nina Simone  | Pop
  9 | Baltimore            |         1978 |         4 |  4 | Nina Simone  | Pop
 10 | Here Comes the Sun   |         1971 |         4 |  4 | Nina Simone  | Pop
 11 | Fodder on My Wings   |         1982 |         4 |  4 | Nina Simone  | Pop
 12 | Ring Ring            |         1973 |         2 |  2 | ABBA         | Pop
(12 rows)
```

## exercise 1
```sql
select title, 
        release_year, 
        name as artist  
    from albums join artists 
    on artist_id = artists.id
    where name = 'ABBA';
```
Gives:
```
     title     | release_year | artist
---------------+--------------+--------
 Waterloo      |         1974 | ABBA
 Super Trouper |         1980 | ABBA
 Ring Ring     |         1973 | ABBA
 (3 rows)
```

## exercise 2

```sql
select albums.id, title 
    from albums join artists 
    on artist_id = artists.id 
    where name = 'Taylor Swift';
```
Gives
```
 id |  title
----+----------
  6 | Lover
  7 | Folklore
(2 rows)
```

# Exercise 3

```sql
select albums.id, title 
    from albums join artists 
    on artist_id = artists.id 
    where name = 'Pixies' and release_year = '1988';
```
Gives:
```
 id |    title
----+-------------
  2 | Surfer Rosa
(1 row)
```

## exercise 4

```sql
 select albums.id, title 
    from albums join artists 
    on artist_id = artists.id 
    where name = 'Nina Simone' and release_year > 1975;
```
Gives
```
 id |       title
----+--------------------
  9 | Baltimore
 11 | Fodder on My Wings
(2 rows)
```