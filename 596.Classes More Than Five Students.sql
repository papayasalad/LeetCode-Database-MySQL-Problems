/*
596.Classes More Than Five Students (Easy)
There is a table courses with columns: student and class

Please list out all classes which have more than or equal to 5 students.

For example, the table:

+---------+------------+
| student | class      |
+---------+------------+
| A       | Math       |
| B       | English    |
| C       | Math       |
| D       | Biology    |
| E       | Math       |
| F       | Computer   |
| G       | Math       |
| H       | Math       |
| I       | Math       |
+---------+------------+
Should output:

+---------+
| class   |
+---------+
| Math    |
+---------+

*/

/* GROUP BY AND HAVING */
/* Solution1 */
SELECT class
FROM courses
GROUP BY class
HAVING COUNT(DISTINCT student) >= 5 

/* Solution2 */
SELECT t.class
FROM (SELECT class, COUNT(DISTINCT student) AS cnt
      FROM courses 
      GROUP BY class) t
WHERE t.cnt >= 5 



