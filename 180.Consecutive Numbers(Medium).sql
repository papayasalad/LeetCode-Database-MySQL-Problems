/*
180.Consecutive Numbers (Medium)

Write a SQL query to find all numbers that appear at least three times consecutively.

+----+-----+
| Id | Num |
+----+-----+
| 1  |  1  |
| 2  |  1  |
| 3  |  1  |
| 4  |  2  |
| 5  |  1  |
| 6  |  2  |
| 7  |  2  |
+----+-----+
For example, given the above Logs table, 1 is the only number that appears consecutively for at least three times.

+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
*/

/* 
Tip: the number appears three consecitive times have Id values adjacent to one another.
*/

Solution 1:
CSELECT DISTINCT a.Num AS ConsecutiveNums
FROM Logs a, Logs b, Logs c
WHERE a.Id = b.Id - 1 AND b.Id = c.Id - 1 
AND a.Num = b.Num AND b.Num = c.Num

Solution 2: 
SELECT DISTINCT a.Num AS ConsecutiveNums
FROM Logs a
LEFT JOIN logs b ON a.Id = b.Id - 1
LEFT JOIN logs c ON a.Id = c.Id - 2
WHERE a.Num = b.Num AND a.Num = c.Num