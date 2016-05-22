--select *  from AdventureWorks.HumanResources.Employee where EmployeeID=109

use AdventureWorks
go


drop function dbo.getsubtree
create function dbo.getsubtree(@empid as int)
returns @tree table
(
empid int not null,
mgrid int null,
lvl int not null
)
as
begin
with employees_subtree(empid,mgrid,lvl)
as
(
select EmployeeID, ManagerID, 0
from HumanResources.Employee
where EmployeeID=@empid
union all
select e.EmployeeID, e.ManagerID, es.lvl+1
from HumanResources.Employee as e join
employees_subtree as es
on e.ManagerID=es.empid
)
insert into @tree
select * from employees_subtree;
return
end 

select * from dbo.getsubtree(109)

select * from AdventureWorks.HumanResources.Employee
where EmployeeID