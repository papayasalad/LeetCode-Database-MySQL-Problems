/* 
178. Rank Scores
Write a SQL query to rank scores. If there is a tie between two scores,
both should have the same ranking. Note that after a tie, the next ranking
number should be the next consecutive integer value. In other words, there
should be no "holes" between ranks.

+----+-------+
| Id | Score |
+----+-------+
| 1  | 3.50  |
| 2  | 3.65  |
| 3  | 4.00  |
| 4  | 3.85  |
| 5  | 4.00  |
| 6  | 3.65  |
+----+-------+

For example, given the above Scores table, your query should generate the
following report (order by highest score):

+-------+------+
| Score | Rank |
+-------+------+
| 4.00  | 1    |
| 4.00  | 1    |
| 3.85  | 2    |
| 3.65  | 3    |
| 3.65  | 3    |
| 3.50  | 4    |
+-------+------+
*/

/*
Tip: create a temporary columnn to keep unique score values and use count of 
scores >= target score as the score's rank;
Solution 2 uses "DENSE_RANK()", notice it is different than ROW_NUMBER() and RANK()
*/

Solution 1: 

SELECT Score, 
(SELECT count(*) FROM (SELECT DISTINCT Score s FROM Scores) tmp 
WHERE s >= Score) Rank
FROM Scores
ORDER BY Score DESC


Solution 2: Use DENSE_RANK()

SELECT Score, DENSE_RANK() OVER (ORDER BY Score DESC)
FROM Scores

