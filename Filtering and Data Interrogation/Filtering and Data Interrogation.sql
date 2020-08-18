/*Filtering and Data Interrogation*/

--1.-Realice una consulta donde se visulice horas de vaciones promedio
SELECT
  BusinessEntityID,
  LoginID,
  JobTitle,
  VacationHours
FROM 
  HumanResources.Employee E1
WHERE 
  VacationHours > (SELECT
    AVG(VacationHours)
    FROM HumanResources.Employee E2)

--2.-Realice una consulta de Production.Product donde Name empiece con 'Flat'
SELECT 
*
FROM 
	Production.Product
WHERE
	Name LIKE 'Flat%'

--3. Horas de vacaciones de ingeniero de Diseño menor a 40
SELECT 
	JobTitle,
	SUM(VacationHours) AS HorasEngineerDesign
FROM 
	HumanResources.Employee
WHERE
	JobTitle='Design Engineer'
GROUP BY JobTitle
HAVING SUM(VacationHours) <40

--4.-Traer los datos unicos de HumanResources.Employee Uso de UNION 
SELECT 
JobTitle
from 
HumanResources.Employee
UNION
SELECT 
JobTitle
FROM 
HumanResources.Employee

--5.-Traer todos los datos de HumanResources.Employee Uso de UNION ALL
SELECT 
JobTitle
from 
HumanResources.Employee
UNION ALL
SELECT 
JobTitle
FROM 
HumanResources.Employee

--6.-Traer todos los datos de la columna de Titlos profesionales de HumanResources.Employee Uso de UNION ALL
SELECT 
DISTINCT JobTitle 'Titulos Profesionales'
FROM 
HumanResources.Employee
