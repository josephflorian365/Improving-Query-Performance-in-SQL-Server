
/**Introduction, Review and The Order of Things**/

--1.-Agregue formateo a la siguiente consulta
SELECT JOBTITLE AS 'Titulo Profesional',
		BIRTHDATE AS 'Cumpleaños',
		GENDER AS 'Género',
		VACATIONHOURS AS  'Horas de vacaciones'
FROM HUMANRESOURCES.EMPLOYEE
	WHERE MARITALSTATUS = 'M'
		AND VACATIONHOURS > 60
		

--2.-Comente este blque de consulta
/*SELECT NAME,GROUPNAME,MODIFIEDDATE 
	FROM HUMANRESOURCES.DEPARTMENT
		WHERE NAME = 'ENGINEERING' 
			OR NAME = 'MARKETING'*/

--3.-Agregale un nom de variable a cada tabla en la consulta de 2 tablas
SELECT 
	pp.name AS 'PRODUCTO',
	ps.name AS 'SUBCATEGORIA'
FROM 
		Production.Product pp
INNER JOIN
	Production.ProductSubcategory ps
ON 
	pp.ProductSubcategoryID = ps.ProductSubcategoryID

--4.-Ponerle un alias a las siguientes columnas
SELECT 
	ps.name AS 'Subcategoria',
	pc.name AS 'Categoria' 
FROM 
	Production.ProductSubcategory ps
	INNER JOIN Production.ProductCategory pc
ON 
	ps.ProductCategoryID = pc.ProductCategoryID

--5.-Uso de ORDER BY para La suma de las ventas hechas por cada empleado, y agrupadas por año
SELECT pp.FirstName, 
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
ORDER BY pp.BusinessEntityID;
