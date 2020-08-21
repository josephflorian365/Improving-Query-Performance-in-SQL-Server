/*Query performance tuning*/

/*1.-Uso de STATITICS TIME para 
saber el tiempo ytanscurrido 
de la consulta en ms*/
SET STATISTICS TIME ON
SELECT 
COUNT(H.BusinessEntityID) AS TOTAL_EMPLEADOS 
FROM 
HumanResources.Employee H;
SET STATISTICS TIME OFF

/*2.-Uso de STATITICS IO para 
saber la cantidad de paginas 
leidas y columnas*/
SET STATISTICS IO ON 
SELECT 
COUNT(H.BusinessEntityID) AS TOTAL_EMPLEADOS 
FROM 
HumanResources.Employee H;
SET STATISTICS IO OFF

/*3.-Uso de indice agrupado para 
consumir menos recursos o hacer 
menos recorrido a las columnas*/
SET STATISTICS IO ON 
SELECT LOGINID FROM 
HumanResources.Employee 
WHERE LOGINID = 'adventure-works\mary2'

