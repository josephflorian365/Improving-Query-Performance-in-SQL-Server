/*Filtering and Data Interrogation*/

/*1.-Realice una consulta donde se 
visulice horas de vaciones promedio*/
SELECT
  JobTitle AS Profesion,
  AVG(VacationHours)
FROM 
  HumanResources.Employee 
GROUP BY JobTitle
    
/*2.-Mostrar todos los productos
que empiecen por 'Flat'*/
SELECT 
*
FROM 
	Production.Product
WHERE
	Name LIKE 'Flat%'

/*3.Mostrar las horas de vacaciones de 
ingeniero de Diseño si es menor a 40*/
SELECT 
	JobTitle,
	SUM(VacationHours) AS HorasEngineerDesign
FROM 
	HumanResources.Employee
WHERE
	JobTitle='Design Engineer'
GROUP BY JobTitle
HAVING SUM(VacationHours) <40

/*4.-Mostrar todos las ordenes de 
venta que tuvierón al producto 709 
con su precio y numero de seguimiento
de transportista*/
SELECT SalesOrderID,
       ProductID, 
       UnitPrice, 
       CarrierTrackingNumber
FROM Sales.SalesOrderDetail 
WHERE ProductID = 709
UNION
SELECT SalesOrderID,
       ProductID, 
       UnitPrice, 
       CarrierTrackingNumber
FROM Sales.SalesOrderDetail 
WHERE  UnitPrice =  5.7

/*5.-Mostrar todos las 
profesionales registradas
con su respectiva fecha 
de contratación*/
SELECT 
	JobTitle 'Profesion',
	hiredate 'Fecha de contratación'
from 
	HumanResources.Employee
UNION ALL
SELECT 
	JobTitle 'Profesion',
	hiredate 'Fecha de contratación'
FROM 
	HumanResources.Employee

/*6.-Mostrar todas las carreras profesionales*/
SELECT 
DISTINCT JobTitle 'Titulos Profesionales'
FROM 
HumanResources.Employee

