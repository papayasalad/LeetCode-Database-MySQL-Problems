/* 184.Department Highest Salary 
The Employee table holds all employees. Every
employee has an Id, a salary, and there is also a column for the department Id.

+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
The Department table holds all departments of the company.

+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+
Write a SQL query to find employees who have the highest salary in each of the 
departments. For the above tables, Max has the highest salary in the IT department and 
Henry has the highest salary in the Sales department.

+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| Sales      | Henry    | 80000  |
+------------+----------+--------+
*/


/* Solution 1: Use two joins */
SELECT 
    d.Name AS Department,
    e.Name AS Employee,
    e.Salary
FROM 
    (SELECT max(Salary) AS Salary, DepartmentId
    FROM Employee
    GROUP BY DepartmentId) tmp
    
    JOIN Department d
    ON tmp.DepartmentId = d.Id
    
    JOIN Employee e
    ON e.Salary = tmp.Salary
    AND e.DepartmentId = tmp.DepartmentId


/* Solution 2: Use three "where" conditons, no "join".*/
SELECT 
    d.Name AS Department, 
    e.Name AS Employee, 
    e.Salary
FROM 
    Employee e, 
    Department d, 
    (SELECT max(Salary) AS Salary, DepartmentId 
     FROM Employee 
     GROUP BY DepartmentId) tmp
WHERE 
    e.DepartmentId = d.Id
    AND tmp.Salary = e.Salary
    AND tmp.DepartmentId = e.DepartmentId


/* Solution 3: Use "IN" */
SELECT 
    d.Name AS Department, 
    e.Name AS Employee, 
    e.Salary
FROM Employee e
JOIN Department d 
ON e.DepartmentId = d.Id
WHERE (Salary, DepartmentId) IN
(SELECT max(Salary), DepartmentId FROM Employee GROUP BY DepartmentId)





