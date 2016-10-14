/* 
Solutions to SQLZOO select from world
http://sqlzoo.net/wiki/SELECT_from_WORLD_Tutorial
*/ 

/*
1. Read the notes about this table. Observe the result of running a simple SQL command.
*/
SELECT name, continent, population FROM world

/* 2. */

SELECT name FROM world
WHERE population>250000000

/* 3. */ 
SELECT name, gdp/population
FROM world
WHERE population >= 200000000

/* 4. */
SELECT name, population/1000000
FROM world 
WHERE continent ='South America'

/* 5. */
SELECT name, population 
FROM world
WHERE name IN ('France', 'Germany','Italy')

/* 6. */
SELECT name
FROM world 
WHERE name LIKE 'United%'

/* 7. */
SELECT name, population, area
FROM world
WHERE area >= 3000000 OR population>=250000000

/* 8. Exclusive OR (XOR). Show the countries that are big by area or big by population but not both. Show name, population and area.
*/
SELECT name, population, area
FROM world
WHERE area >= 3000000 xor population>=250000000

/* 9 */
SELECT name, round(population/1000000, 2), round(gdp/1000000000, 2)
FROM world
WHERE continent = 'South America'

/* 10 */
SELECT name, round(gdp/population, -3)
FROM world
WHERE gdp > 1000000000000

/* 11 */
SELECT name, continent,
       CASE WHEN continent='Caribbean' THEN 'North America'
            ELSE continent END
FROM world
WHERE name LIKE 'J%'

 /* 12 */
SELECT name,
        CASE WHEN continent='Europe' OR continent='Asia' THEN 'Eurasia'
            WHEN continent='North America' OR continent='South America' OR continent='Caribbean' THEN 'America'
                ELSE continent END
FROM world
WHERE name LIKE 'A%' or name LIKE 'B%'

/* 13 */
SELECT name, continent,
CASE WHEN continent = 'Oceania' THEN 'Australasia'
     WHEN continent = 'Eurasia' OR name = 'Turkey' THEN 'Europe/Asia'
     WHEN continent = 'Caribbean' AND name LIKE 'B%' THEN 'North America'
     WHEN continent = 'Caribbean' AND name NOT LIKE 'B%' THEN 'South America'
     ELSE continent END
FROM world
WHERE tld IN ('.ag','.ba','.bb','.ca','.cn','.nz','.ru','.tr','.uk')
ORDER BY name

