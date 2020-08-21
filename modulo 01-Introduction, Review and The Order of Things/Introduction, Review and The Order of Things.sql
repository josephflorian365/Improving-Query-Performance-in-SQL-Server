
/**Introduction, Review and The Order of Things**/

/*1.-Agregue formateo a la siguiente consulta*/
SELECT JOBTITLE AS 'Titulo Profesional',
		BIRTHDATE AS 'Cumpleaños',
		GENDER AS 'Género',
		VACATIONHOURS AS  'Horas de vacaciones'
FROM HUMANRESOURCES.EMPLOYEE
	WHERE MARITALSTATUS = 'M'
		AND VACATIONHOURS > 60
		
--2.-Tipo de comentario de una línea
--Este es un comentario


--3.-Tipo de comentario de varias lineas
/*Este comentario contiene
mas de una liniea*/

/*4.-Mostrar el nombre del producto
 y el precio del producto
 de la venta del cliente
 numero 18759*/
SELECT 
	name AS Nombre,
	ListPrice AS Precio 
FROM 
	Sales.SalesOrderHeader soh 
JOIN
	Sales.SalesOrderDetail sod 
ON 
	sod.SalesOrderID = soh.SalesOrderID
JOIN 
	Production.Product p 
ON 
	sod.ProductID = p.ProductID
WHERE 
	soh.CUSTOMERID = 18759

/*5.-Visualizar listado de subcategorías 
con sus respectivas categorías*/
SELECT 
	ps.name AS 'Subcategoria',
	pc.name AS 'Categoria' 
FROM 
	Production.ProductSubcategory ps
	INNER JOIN Production.ProductCategory pc
ON 
	ps.ProductCategoryID = pc.ProductCategoryID

/*6.-Mostrar la suma de las ventas 
hechas por cada empleado, y agrupadas por año*/
SELECT pp.FirstName AS 'Nombre', 
		SUM(SalesQuota) AS total_vendido,
		YEAR(QuotaDate) AS año
FROM Sales.SalesPersonQuotaHistory qh
INNER JOIN 
	Person.Person pp
ON 
	qh.BusinessEntityID = pp.BusinessEntityID
GROUP BY pp.BusinessEntityID, 
		YEAR(QuotaDate), 
		pp.FirstName
ORDER BY pp.BusinessEntityID
