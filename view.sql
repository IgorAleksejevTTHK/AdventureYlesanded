
use adventureworksdw2019


select * from dimemployee
select * from dimdepartmentgroup

-- liidame töötajad ja osakonnad
select employeekey, firstname, baserate, gender, departmentname
from dimemployee
join dimdepartmentgroup
on dimemployee.departmentname = dimdepartmentgroup.departmentgroupkey

-- loome view, kus töötaja info koos osakonnaga
create view vwemployeebydepartment
as
select employeekey, firstname, baserate, departmentname
from dimemployee
join dimdepartmentgroup
on dimemployee.departmentname = dimdepartmentgroup.departmentgroupkey


select * from vwemployeebydepartment

-- loome view ainult Corporate osakonnaga töötajatele
create view vwcorporatedepartment_employees
as
select employeekey, firstname, baserate, departmentname
from dimemployee
join dimdepartmentgroup
on dimemployee.departmentname = dimdepartmentgroup.departmentgroupkey
where dimdepartmentgroup.departmentgroupname = 'Corporate'

select * from vwcorporatedepartment_employees

-- view ilma BaseRate veeruta (tundlik info eemaldatud)
create view vwemployeesnonconfdata
as
select employeekey, firstname, gender, departmentname
from dimemployee
join dimdepartmentgroup
on dimemployee.departmentname = dimdepartmentgroup.departmentgroupkey

select * from vwemployeesnonconfdata

-- loendame töötajate arvu osakonna kaupa
create view vwemployeescountbydepartment
as
select departmentname, count(departmentgroupkey) as totalemployees
from dimemployee
join dimdepartmentgroup
on dimemployee.departmentname = dimdepartmentgroup.departmentgroupkey
group by departmentname

select * from vwemployeescountbydepartment


sp_helptext vwname


alter view


drop view vwname

-- loome view ilma Salary veeruta
create view vwemployeesdataexsalary
as
select employeekey, firstname, gender, departmentname
from dimemployee

select * from vwemployeesdataexsalary


update vwemployeesdataexsalary
set firstname = 'mikey' 
where employeekey = 2

select * from dimemployee

delete from vwemployeesdataexsalary 
where employeekey = 2

insert into vwemployeesdataexsalary values (2, 'mikey', 'm', 2)

-- loome detailsema view töötajate kohta osakondade kaupa
create view vwemployeedetailsbydept
as
select employeekey, firstname, gender, departmentname
from dimemployee
join dimdepartmentgroup
on dimemployee.departmentname = dimdepartmentgroup.departmentgroupkey

select * from vwemployeedetailsbydept


update vwemployeedetailsbydept
set departmentname = 'Corporate' 
where firstname = 'john'

select * from dimemployee
