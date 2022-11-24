# using joins

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