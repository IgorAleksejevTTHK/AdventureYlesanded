
select * from dimemployee

create index ix_dimemployee_baserate
on dimemployee (baserate asc)


exec sp_help dimemployee


drop index dimemployee.ix_dimemployee_baserate

-- loome clustered indeksi firstname veerule tabelis tblemployee
create clustered index ix_tblemployee_name
on tblemployee (firstname)

drop index tblemployee.pk__tblemplo__3214ec070a9d95db

-- loome clustered indeksi mitme veeruga
create clustered index ix_tblemployee_gender_salary
on tblemployee (gender desc, salary asc)

-- loome nonclustered indeksi firstname veerule
create nonclustered index ix_tblemployee_name
on tblemployee (firstname)


exec sp_helpindex dimemployee

-- loome unikaalse nonclustered indeksi kahe veeru kombinatsioonile
create unique nonclustered index uix_dimemployee_firstname_lastname
on dimemployee (firstname, lastname)

-- lisame tabelile unikaalse constrainti veerule title
alter table dimemployee 
add constraint uq_dimemployee_title
unique nonclustered (title)


execute sp_helpconstraint dimemployee

-- loome unikaalse indeksi, ignoreerib dubleeritud väärtusi
create unique index ix_dimemployee_title
on dimemployee (title)
with ignore_dup_key


select * from dimemployee
where baserate > 5 and baserate < 10


delete from dimemployee
where baserate = 9.50


update dimemployee
set baserate = 50
where baserate = 9.25


select * from dimemployee


select * from dimemployee
order by baserate

select * from dimemployee
order by baserate desc

-- loendame töötajaid iga baserate väärtuse järgi
select baserate, count(baserate) as total
from dimemployee
group by baserate
SELECT * FROM DimEmployee WHERE BaseRate > 5 AND BaseRate < 10

DELETE FROM DimEmployee WHERE BaseRate = 9.50
UPDATE DimEmployee SET BaseRate = 50 WHERE BaseRate = 9.25

SELECT * FROM DimEmployee

SELECT * FROM DimEmployee ORDER BY BaseRate

SELECT * FROM DimEmployee ORDER BY BaseRate DESC

SELECT BaseRate, COUNT(BaseRate) AS Total
FROM DimEmployee
GROUP BY BaseRate
