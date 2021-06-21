select  OP.Año,
convert(varchar,cast(sum ((convert(decimal(19,4),[Order Details].UnitPrice) * [Order Details].Quantity)-(convert(decimal(19,4),[Order Details].UnitPrice)*[Order Details].Quantity* convert(decimal(19,4),[Order Details].Discount))) as money), 1) AS Total
from
(select Orders.customerID, Orders.OrderID as laorden, year(Orders.OrderDate) as Año
from dbo.Orders join dbo.Employees on Orders.EmployeeID = Employees.EmployeeID
where Employees.FirstName='Steven' and Employees.LastName='Buchanan'
) AS OP inner join [Order Details] 
on [Order Details].OrderID = OP.laorden
group BY OP.Año
;


