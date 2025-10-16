
select * from dimemployee


-- lihtne inline table-valued function (ILTVF)

create function fn_iltvf_getemployees()
returns table
as
return
(
    select employeekey, firstname, 
           cast(birthdate as date) as dob
    from dbo.dimemployee
)


select * from fn_iltvf_getemployees()


-- mitmeastmeline table-valued function (MSTVF)

create function fn_mstvf_getemployees()
returns @table table 
(
    employeekey int, 
    firstname nvarchar(20), 
    dob date
)
as
begin
    insert into @table
    select 
        employeekey, 
        firstname, 
        cast(birthdate as date)
    from dimemployee

    return
end

select * from fn_mstvf_getemployees()



-- siin tagastatakse töötaja eesnimi id järgi
create function fn_getemployeenamebyid(@employeekey int)
returns nvarchar(20)
as
begin
    return (select firstname from dimemployee where employeekey = @employeekey)
end


sp_helptext fn_getemployeenamebyid


-- muudame funktsiooni ja lisame encryption 
alter function fn_getemployeenamebyid(@employeekey int)
returns nvarchar(20)
with encryption 
as
begin
    return (select firstname from dimemployee where employeekey = @employeekey)
end


sp_helptext fn_getemployeenamebyid


-- uuesti muudame funktsiooni, seekord schema bindinguga
alter function fn_getemployeenamebyid(@employeekey int)
returns varchar(20)
with schemabinding
as
begin
    return (select firstname from dbo.dimemployee where employeekey = @employeekey)
end



drop table tblemployees
