SELECT DISTINCT Customers.ContactName as ClientName ,Customers.CustomerID, 
       Orders.CustomerID, Orders.EmployeeID, 
       Employees.EmployeeID, Employees.FirstName, Employees.LastName
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID 
INNER JOIN Employees ON Orders.EmployeeID  = Employees.EmployeeID
WHERE Employees.FirstName='Nancy' AND Employees.LastName='Davolio'
Order by ClientName;