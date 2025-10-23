
SELECT * FROM dimemployee;

-- Loome indeksi ix_dimemployee_baserate veerule BaseRate tõusvas järjekorras
CREATE INDEX ix_dimemployee_baserate
ON dimemployee (baserate ASC);

-- Kuvame tabeli dimemployee struktuuri (veerud, andmetüübid jms)
EXEC sp_help dimemployee;

-- Kustutame indeksi ix_dimemployee_baserate tabelist dimemployee
DROP INDEX dimemployee.ix_dimemployee_baserate;


-- Loome klasterindeksi veerule FirstName tabelis tblemployee
-- (klasterindeks määrab reaalse andmete järjestuse tabelis)
CREATE CLUSTERED INDEX ix_tblemployee_name
ON tblemployee (firstname);

-- Kustutame olemasoleva klasterindeksi
DROP INDEX tblemployee.pk__tblemplo__3214ec070a9d95db;


-- Loome klasterindeksi mitmele veerule:
-- esmalt Gender kahanevas järjekorras, seejärel Salary tõusvas järjekorras
CREATE CLUSTERED INDEX ix_tblemployee_gender_salary
ON tblemployee (gender DESC, salary ASC);


-- Loome mitte-klasterindeksi veerule FirstName
CREATE NONCLUSTERED INDEX ix_tblemployee_name
ON tblemployee (firstname);


-- Kuvame kõik tabeli dimemployee indeksid
EXEC sp_helpindex dimemployee;


-- Loome unikaalse mitte-klasterindeksi kahe veeru (FirstName, LastName) kombinatsioonile
CREATE UNIQUE NONCLUSTERED INDEX uix_dimemployee_firstname_lastname
ON dimemployee (firstname, lastname);


-- Lisame tabelile unikaalse piirangu (constraint) veerule Title

ALTER TABLE dimemployee 
ADD CONSTRAINT uq_dimemployee_title
UNIQUE NONCLUSTERED (title);


-- Kuvame kõik tabeli dimemployee piirangud 
EXECUTE sp_helpconstraint dimemployee;


-- Loome unikaalse indeksi veerule Title,
-- mis ignoreerib dubleeritud väärtusi 
CREATE UNIQUE INDEX ix_dimemployee_title
ON dimemployee (title)
WITH IGNORE_DUP_KEY;


-- Valime kõik töötajad, kelle BaseRate on vahemikus 5 kuni 10
SELECT * FROM dimemployee
WHERE baserate > 5 AND baserate < 10;


-- Kustutame töötajad, kelle BaseRate = 9.50
DELETE FROM dimemployee
WHERE baserate = 9.50;

-- Uuendame töötajate BaseRate väärtuseks 50, kui praegune väärtus on 9.25
UPDATE dimemployee
SET baserate = 50
WHERE baserate = 9.25;


SELECT * FROM dimemployee;

-------------------------------------------------------
-- Järjestame töötajad BaseRate järgi kasvavas järjekorras
SELECT * FROM dimemployee
ORDER BY baserate;

-- Järjestame töötajad BaseRate järgi kahanevas järjekorras
SELECT * FROM dimemployee
ORDER BY baserate DESC;


-- Loendame töötajate arvu iga BaseRate väärtuse järgi
SELECT baserate, COUNT(baserate) AS total
FROM dimemployee
GROUP BY baserate;
