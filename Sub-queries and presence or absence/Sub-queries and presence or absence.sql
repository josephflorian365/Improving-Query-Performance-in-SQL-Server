/**Sub-queries and presence or absence**/

/*1.-Subconsulta de la tabla Production.Product con la tabla 
externa Production.ProductModel mostrando la existencia de 
el producto 'Long-sleeve logo jersey'*/
SELECT DISTINCT Name AS 'Nombre de modelo del producto'
FROM Production.Product p
WHERE EXISTS
(SELECT *
FROM Production.ProductModel pm
WHERE p.ProductModelID =pm.ProductModelID
AND pm.Name = 'Long-sleeve logo jersey') ;

/*2.-Obtener el nombre y número de cuenta de las tablas
Sales.Customer y Sales.Store usando INNER JOIN */
SELECT ss.Name AS 'Nombre',
sc.AccountNumber AS 'Número de cuenta'
FROM 
Sales.Customer sc
INNER JOIN
    (SELECT BusinessEntityID,Name
     FROM Sales.Store ) AS ss
	 on sc.StoreID = ss.BusinessEntityID

/*3.-Mostrar los datos del campo ProductCategoryID 
de la tabla Production.ProductCategory 
si estan presentes en  Production.ProductSubCategory*/
SELECT 
	ProductCategoryID
FROM Production.ProductCategory
INTERSECT
SELECT 
	ProductCategoryID
FROM 
	Production.ProductSubCategory

/*4.-Mostrar los datos del campo ProductCategoryID 
de la tabla Production.ProductCategory 
si no estan presentes en  Production.ProductSubCategory*/
SELECT 
	ProductCategoryID
FROM Production.ProductCategory
EXCEPT
SELECT 
	ProductCategoryID
FROM 
	Production.ProductSubCategory

/*5.-Mostrar el Id e la categorias y sus Nombres*/
SELECT 
	ProductCategoryID,
	Name
FROM Production.ProductCategory
WHERE ProductCategoryID IN
(SELECT
	ProductCategoryID
FROM 
	Production.ProductSubCategory)

/*6.-Mostrar el Id e la categorias y sus Nombres*/
SELECT 
	ProductCategoryID,
	Name
FROM Production.ProductCategory pc
WHERE EXISTS
	(SELECT 1
FROM 
	Production.ProductSubCategory psc
	WHERE 
	pc.ProductCategoryID = psc.ProductCategoryID)

/*7.-Visualizar cantidad de productos por cada subcategorías*/
SELECT 
DISTINCT COUNT(pp.ProductID) as 'Producto', 
	ps.name AS 'Subcategoria' 
FROM Production.Product pp
	LEFT OUTER JOIN 
	Production.ProductSubcategory ps
ON 
	pp.ProductSubcategoryID = ps.ProductSubcategoryID
GROUP BY 
	ps.name