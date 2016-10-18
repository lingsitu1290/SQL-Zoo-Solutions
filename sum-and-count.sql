/* Sum and Count 
http://sqlzoo.net/wiki/SUM_and_COUNT
*/

/* 1 */
SELECT SUM(population)
FROM world

/* 2 */
SELECT distinct(continent)
FROM world

/* 3 */
SELECT sum(gdp)
FROM world 
WHERE continent = 'Africa'

/* 4 */
SELECT count(name)
FROM world
WHERE area > 1000000

/* 5 */
SELECT sum(population)
FROM world
WHERE name IN ('France', 'Germany','Spain')

/* 6 */
SELECT continent, COUNT(name)
FROM world
GROUP BY continent

/* 7 */
SELECT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent

/* 8 */
SELECT continent
FROM world
GROUP BY continent
HAVING sum(population) > 100000000