# http://sqlzoo.net/wiki/More_JOIN_operations

SELECT id, title
 FROM movie
 WHERE yr=1962

SELECT yr 
FROM movie
WHERE title = 'Citizen Kane'


SELECT id, title, yr 
FROM movie
WHERE title LIKE '%Star Trek%' 
ORDER BY yr 

SELECT title 
FROM movie
WHERE id = 11768 OR id = 11955 OR id = 21191


SELECT id 
FROM actor 
WHERE name = 'Glenn Close'

SELECT id 
FROM movie
WHERE title = 'Casablanca'

select actor.name 
from actor 
join casting
on actor.id = casting.actorid
where casting.movieid = 11768

SELECT actor.name
FROM actor
JOIN casting
ON actor.id = casting.actorid 
AND movieid = (SELECT id FROM movie WHERE title='Alien')


SELECT movie.title
FROM movie
join casting
ON movie.id = casting.movieid
WHERE casting.actorid = (SELECT id FROM actor WHERE name ='Harrison Ford')


SELECT movie.title
FROM movie
join casting 
ON movie.id = casting.movieid 
WHERE casting.actorid=(SELECT id FROM actor WHERE name ='Harrison Ford') 
AND casting.ord != 1

SELECT movie.title, actor.name
FROM movie 
JOIN casting 
ON movie.id=casting.movieid 
JOIN actor 
ON actor.id = casting.actorid
WHERE ord=1 AND  yr = 1962


SELECT yr, COUNT(title) 
FROM movie 
JOIN casting 
ON movie.id=movieid
JOIN actor ON actorid=actor.id
WHERE name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
 WHERE name='John Travolta'
 GROUP BY yr) AS t
)


SELECT movie.title, actor.name
FROM movie
JOIN casting 
ON movie.id = casting.movieid
JOIN actor on actor.id = casting.actorid
WHERE ord=1 and movieid IN
(SELECT movieid FROM casting 
JOIN actor ON actor.id = actorid 
WHERE name = 'Julie Andrews')


SELECT actor.name
FROM actor
JOIN casting ON actor.id = casting.actorid AND (SELECT COUNT(ord) FROM casting WHERE actorid = actor.id AND ord=1)>=30
GROUP BY name


SELECT title, COUNT(actorid) as cast
FROM movie JOIN casting on id=movieid
WHERE yr = 1978
GROUP BY title
ORDER BY cast DESC, title 

######################

SELECT a.name
  FROM (SELECT movie.*
          FROM movie
          JOIN casting
            ON casting.movieid = movie.id
          JOIN actor
            ON actor.id = casting.actorid
         WHERE actor.name = 'Art Garfunkel') AS m
  JOIN (SELECT actor.*, casting.movieid
          FROM actor
          JOIN casting
            ON casting.actorid = actor.id
         WHERE actor.name != 'Art Garfunkel') as a
    ON m.id = a.movieid;