--funktsioonid
use AdventureWorksDW2019
select * from DimEmployee

--Tabelisisev��rtusega funktsioon e Inline Table Valued function (ILTVF) koodin�ide:
create function fn_ILTVF_getEmployees()

returns table
as
return (select EmployeeKey,FirstName,cast(BirthDate as Date) as DOB
from dbo.DimEmployee)
drop function fn_ILTVF_getEmployees
--K�IVITA FUNKTSIOONI
select * from fn_ILTVF_getEmployees()