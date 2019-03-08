/* 
185. Department Top Three Salaries (Hard)
The Employee table holds all employees. Every employee has an Id, and there is also a column for the department Id.

+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
| 5  | Janet | 69000  | 1            |
| 6  | Randy | 85000  | 1            |
+----+-------+--------+--------------+
The Department table holds all departments of the company.

+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+
Write a SQL query to find employees who earn the top three salaries in each of the department. For the above tables, your SQL query should return the following rows.

+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| IT         | Randy    | 85000  |
| IT         | Joe      | 70000  |
| Sales      | Henry    | 80000  |
| Sales      | Sam      | 60000  |
+------------+----------+--------+
*/

/*Tip: select top N per group problem*/


/* Solution 1: No subquery. Note, error if e.name not included 'group by' */
SELECT d.Name AS Department, e.Name AS Employee, e.Salary
FROM Department d, Employee e, Employee e2
WHERE d.Id = e.DepartmentId 
	  AND e.DepartmentId = e2.DepartmentId
      AND e2.Salary >= e.Salary
GROUP BY e.DepartmentId, e.Name
HAVING COUNT(DISTINCT e2.Salary) <= 3
ORDER BY e.DepartmentId, e.Salary DESC

/* Solution 2: Use join */
SELECT d.Name AS Department, e.Name AS Employee, e.Salary
FROM Department d JOIN Employee e
ON e.DepartmentId = d.Id
WHERE (SELECT COUNT(DISTINCT(t.Salary))  
       FROM Employee t
       WHERE t.DepartmentId = e.DepartmentId 
       AND t.Salary >= e.Salary) <= 3
ORDER BY e.DepartmentId, e.Salary DESC


/* Solution 3: No join*/
SELECT d.Name AS Department, e.Name AS Employee, e.Salary
FROM Department d, Employee e
WHERE d.Id = e.DepartmentId
      AND 
      (SELECT COUNT(DISTINCT t.Salary)  
       FROM Employee t
       WHERE t.DepartmentId = e.DepartmentId 
       AND t.Salary > e.Salary) < 3
ORDER BY e.DepartmentId, e.Salary DESC

/* Solution 4: use limit. Note: not work in mysql leetcode */ 
SELECT d.Name AS Department, e.Name AS Employee, e.Salary
FROM Department d JOIN Employee e
ON e.DepartmentId = d.Id
WHERE e.Salary IN (
    SELECT t.Salary FROM Employee t
    GROUP BY t.DepartmentId
    ORDER BY t.Salary DESC
    LIMIT 3)


















