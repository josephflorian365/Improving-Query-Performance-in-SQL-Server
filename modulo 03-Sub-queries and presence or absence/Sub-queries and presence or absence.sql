/**Sub-queries and presence or absence**/

/*1.-Mostrar la existencia del 
producto 'Long-sleeve logo jersey'*/
SELECT DISTINCT Name AS 'Nombre de modelo del producto'
FROM 
	Production.Product p
WHERE 
EXISTS
(SELECT *
FROM 
	Production.ProductModel pm
WHERE 
	p.ProductModelID =pm.ProductModelID
AND 
	pm.Name = 'Long-sleeve logo jersey') ;

/*2.-Obtener el nombre y número 
de cuenta de los clientes */
SELECT ss.Name AS 'Nombre',
sc.AccountNumber AS 'Número de cuenta'
FROM 
Sales.Customer sc
INNER JOIN
    (SELECT BusinessEntityID,Name
     FROM Sales.Store ) AS ss
	 on sc.StoreID = ss.BusinessEntityID

/*3.-Mostrar los datos identificadores
que se encuentren en las categorias
con las subcategorias*/
SELECT 
	ProductCategoryID
FROM Production.ProductCategory
INTERSECT
SELECT 
	ProductCategoryID
FROM 
	Production.ProductSubCategory

/*4.-Mostrar los datos que se encuentran 
en los prroductos pero no en 
inventario de productos*/
SELECT 
	p.ProductId
FROM 
	Production.Product AS p
EXCEPT
SELECT 
	pinv.ProductID
FROM 
	Production.ProductInventory AS pinv

/*5.-Mostrar los nombres de las categorias*/
SELECT 
	Name
FROM Production.ProductCategory
WHERE ProductCategoryID IN
(SELECT
	ProductCategoryID
FROM 
	Production.ProductSubCategory)

/*6.-Comprobar si existen registros 
de las categ0orias de los productos 
con sus respectivos nombres*/
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

/*7.-Visualizar cantidad de productos 
por cada subcategorías incluyendo nulos*/
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