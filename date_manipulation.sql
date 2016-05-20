--First day of current month
select dateadd(day,-day(getdate())+1, convert(date,getdate()))
select dateadd(day,1,EOMONTH(convert(date,getdate()), -1))

--First day of previous month
select dateadd(day,1,EOMONTH(convert(date,getdate()), -2))

--Last day of previous month
select EOMONTH(convert(date, getdate()),-1)

--Last day of current month
select EOMONTH(convert(date, getdate()),0)


--today
select convert(date, getdate())
--yesterday
select dateadd(day,-1,convert(date,getdate()))
--tommorow
select dateadd(day,1,convert(date,getdate()))
