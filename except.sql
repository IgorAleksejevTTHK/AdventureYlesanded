USE AdventureWorksDW2019;

select * from DimEmployee
select * from DimCustomer

SELECT EmployeeKey, FirstName, Gender
FROM DimEmployee
<
FROM DimEmployee
WHERE EmployeeKey NOT IN (SELECT CustomerKey FROM DimCustomer)

INSERT INTO DimEmployee VALUES (1, 'Mark', 'Male')

SELECT EmployeeKey, FirstName, Gender
FROM DimEmployee
EXCEPT
SELECT CustomerKey, FirstName, Gender
FROM DimCustomer

SELECT EmployeeKey, FirstName, Gender
FROM DimEmployee
WHERE EmployeeKey NOT IN (SELECT CustomerKey FROM DimCustomer)


SELECT EmployeeKey, FirstName, Gender
FROM DimEmployee
EXCEPT
SELECT CustomerKey, FirstName
FROM DimCustomer

SELECT EmployeeKey, FirstName, Gender
FROM DimEmployee
WHERE EmployeeKey NOT IN (SELECT CustomerKey, FirstName FROM DimCustomer)
