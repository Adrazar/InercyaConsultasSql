WITH
  cteReports (EmpID, FirstName, LastName, ReportsTo, EmpLevel)
  AS
  (
    SELECT EmployeeID, FirstName, LastName, ReportsTo, 1
    FROM Employees
    WHERE FirstName='Andrew'and LastName='Fuller'
    UNION ALL
    SELECT e.EmployeeID, e.FirstName, e.LastName, e.ReportsTo, 
      r.EmpLevel + 1
    FROM Employees e
      INNER JOIN cteReports r
        ON e.ReportsTo = r.EmpID
  )
SELECT EmpID, FirstName + ' ' + LastName AS FullName, (SELECT FirstName + ' ' + LastName FROM Employees 
    WHERE EmployeeID = cteReports.ReportsTo) AS ManagerName
FROM cteReports 
WHERE cteReports.ReportsTo IS NOT NULL 
ORDER BY EmpLevel, ReportsTo