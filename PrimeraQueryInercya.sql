SELECT Products.ProductID, Products.ProductName, Products.CategoryID, Products.Discontinued, Categories.CategoryName
FROM dbo.Products Inner Join  dbo.Categories 
ON Products.CategoryID = Categories.CategoryID
WHERE Discontinued = 0
ORDER BY Products.ProductName