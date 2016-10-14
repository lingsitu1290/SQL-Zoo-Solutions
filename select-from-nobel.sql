/* 
Solutions to SQLZOO select from world
http://sqlzoo.net/wiki/SELECT_from_Nobel_Tutorial
*/ 

/* 1 */
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950

/* 2 */
SELECT winner
FROM nobel
WHERE yr = 1962
AND subject = 'Literature'

/* 3 */
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein'

/* 4 */
SELECT winner
FROM nobel
WHERE yr >=2000 AND subject = 'Peace'

/* 5 */ 
SELECT * 
FROM nobel 
WHERE yr <=1989 AND yr >=1980 AND subject ='Literature'

/* 6 */
SELECT * FROM nobel
WHERE winner = 'Theodore Roosevelt' OR winner='Woodrow Wilson' OR winner='Jimmy'

/* 7 */
SELECT winner
FROM nobel
WHERE winner LIKE 'John%'

/* 8 */
SELECT *
FROM nobel
WHERE (subject = "Physics" AND yr = '1980') OR (subject = 'Chemistry' AND yr = 1984)

/* 9 */ 
SELECT *
FROM nobel 
WHERE yr ='1980' AND (subject !='Chemistry' AND subject !='Medicine')

/* 10 */
SELECT * 
FROM nobel
WHERE (subject='Medicine' AND yr <'1910') OR (subject='Literature' AND yr >= 2004)

/* 11 Non ASCII Characters
Find all details of the prize won by PETER GRÜNBERG

*/
SELECT * 
FROM nobel
WHERE winner = 'PETER GR%NBERG'

/* 12 Escaping single quotes*/
SELECT * 
FROM nobel
WHERE winner = 'EUGENE O\'NEILL'

/* 13 
List the winners, year and subject where the winner 
starts with Sir. Show the the most recent first, then by 
name order.
*/
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'sir%'
ORDER BY yr DESC, winner

/* 14 
The expression subject IN ('Chemistry','Physics') can be used as a value - it will be 0 or 1.

Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.
*/ 

SELECT winner, subject, subject IN ('Physics','Chemistry')
FROM nobel
WHERE yr=1984
ORDER BY subject IN ('Physics','Chemistry'), subject,winner