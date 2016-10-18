/* 
Solutions to SQLZOO select from world
http://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial
*/ 

/* 1 */
SELECT name FROM world
WHERE population > (SELECT population FROM world WHERE name='Russia')

/* 2 */
SELECT name FROM world
WHERE gdp/population >
(SELECT gdp/population FROM world WHERE name='United Kingdom') AND continent = 'Europe'

/* 3 */
SELECT name, continent
FROM world
WHERE continent IN (SELECT continent FROM world WHERE name IN ('Argentina', 'Australia'))
ORDER BY name

/* 4 */ 
SELECT name, population
FROM world
WHERE population > (SELECT population from world where name = 'Canada') AND population < (SELECT population from world where name ='Poland')

/* 5 */
SELECT name, CONCAT(ROUND((population*100)/(SELECT population 
FROM world WHERE name='Germany'), 0), '%')
FROM world
WHERE population IN (SELECT population
FROM world
WHERE continent='Europe')

/* 6 */
SELECT name
FROM world
WHERE gdp >= ALL(SELECT gdp FROM world WHERE gdp >=0 AND continent = 'Europe') AND continent != 'Europe'

/* 7 */
SELECT continent, name, area
FROM world x
WHERE area >= ALL
(SELECT area FROM world y
WHERE y.continent=x.continent
AND area>0)

/***** HAVE TO COMPLETE *********/