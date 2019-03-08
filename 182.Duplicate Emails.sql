/*
182.Duplicate Emails (Easy)
Write a SQL query to find all duplicate emails in a table named Person.

+----+---------+
| Id | Email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
For example, your query should return the following for the above table:

+---------+
| Email   |
+---------+
| a@b.com |
+---------+
Note: All emails are in lowercase.
*/

/* Solution 1: */
SELECT temp.Email 
FROM (SELECT count(ID) AS count, Email
     From Person
     GROUP BY Email) temp
WHERE temp.count > 1

/* Solution 2: Using HAVING */
SELECT Email
FROM Person
GROUP BY Email
HAVING count(Id) > 1

/* Solution 3: self-join*/
SELECT DISTINCT t1.Email
FROM Person t1
JOIN Person t2
ON t1.email = t2.email and t1.id <> t2.id