--funktsioonid
use AdventureWorksDW2019
select * from DimEmployee

--Tabelisiseväärtusega funktsioon e Inline Table Valued function (ILTVF) koodinäide:
create function fn_ILTVF_getEmployees()

returns table
as
return (select EmployeeKey,FirstName,cast(BirthDate as Date) as DOB
from dbo.DimEmployee)
drop function fn_ILTVF_getEmployees
--KÄIVITA FUNKTSIOONI
select * from fn_ILTVF_getEmployees()