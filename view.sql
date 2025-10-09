USE AdventureWorksDW2019;

select * from DimEmployee
select * from DimDepartmentGroup

SELECT EmployeeKey, FirstName, BaseRate, Gender, DepartmentName
FROM DimEmployee
JOIN DimDepartmentGroup 
ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupKey

CREATE VIEW vWEmployeeByDepartment
AS
SELECT EmployeeKey, FirstName, BaseRate, DepartmentName
FROM DimEmployee
JOIN DimDepartmentGroup
ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupKey

SELECT * FROM vWEmployeeByDepartment


CREATE VIEW vWCorporateDepartment_Employees
AS
SELECT EmployeeKey, FirstName, BaseRate, DepartmentName
FROM DimEmployee
JOIN DimDepartmentGroup
ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupKey
WHERE DimDepartmentGroup.DepartmentGroupName = 'Corporate'

SELECT * FROM vWCorporateDepartment_Employees

-- View, kus ei ole BaseRate veergu
CREATE VIEW vWEmployeesNonConfData
AS
SELECT EmployeeKey, FirstName, Gender, DepartmentName
FROM DimEmployee
JOIN DimDepartmentGroup
ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupKey

SELECT * FROM vWEmployeesNonConfData

CREATE VIEW vWEmployeesCountByDepartment
AS
SELECT DepartmentName, COUNT(DepartmentGroupKey) AS TotalEmployees
FROM DimEmployee
JOIN DimDepartmentGroup
ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupKey
GROUP BY DepartmentName

SELECT * FROM vWEmployeesCountByDepartment


sp_helptext vWName

ALTER VIEW

DROP VIEW vWName


CREATE VIEW vWEmployeesDataExSalary
AS
SELECT EmployeeKey, FirstName, Gender, DepartmentName
FROM DimEmployee

SELECT * FROM vWEmployeesDataExSalary


UPDATE vWEmployeesDataExSalary
SET FirstName = 'Mikey' WHERE EmployeeKey = 2

SELECT * FROM DimEmployee


DELETE FROM vWEmployeesDataExSalary WHERE EmployeeKey = 2
INSERT INTO vWEmployeesDataExSalary VALUES (2, 'Mikey', 'M', 2)

CREATE VIEW vWEmployeeDetailsByDept
AS
SELECT EmployeeKey, FirstName, Gender, DepartmentName
FROM DimEmployee
JOIN DimDepartmentGroup
ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupKey

SELECT * FROM vWEmployeeDetailsByDept


UPDATE vWEmployeeDetailsByDept
SET DepartmentName = 'Corporate' WHERE FirstName = 'John'

SELECT * FROM DimEmployee
