use adventureworksdw2019

select * from dimemployee
select * from dimcustomer


select employeekey, firstname, gender
from dimemployee


-- leiame töötajad, kelle employee key puudub klientide tabelis
select employeekey, firstname, gender
from dimemployee
where employeekey not in (select customerkey from dimcustomer)


insert into dimemployee values (1, 'mark', 'male')


select employeekey, firstname, gender
from dimemployee
except
select customerkey, firstname, gender
from dimcustomer


-- sama tulemuse saab WHERE NOT IN abil
select employeekey, firstname, gender
from dimemployee
where employeekey not in (select customerkey from dimcustomer)


-- näide, kus üks veerg puudu
select employeekey, firstname, gender
from dimemployee
except
select customerkey, firstname
from dimcustomer


-- lihtsalt näide, mida ei kasutata nii
select employeekey, firstname, gender
from dimemployee
where employeekey not in (select customerkey, firstname from dimcustomer)
