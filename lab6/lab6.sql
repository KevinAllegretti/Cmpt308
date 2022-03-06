--1. Display the cities	that makes the most	different kinds	of products. Experiment with	
--   the rank() function
select rank() over(order by count(Products.City) DESC), city, count(city)
FROM Products
group by city


SELECT City
FROM CityRankings
WHERE ranking = 1;

--2. Display the names of products whose priceUSD is less than the average priceUSD, in	
--   alphabetical order.
select name
from products
where priceusd < (select avg(priceusd)
				 	from products)
order by name DESC;

--3. Display the customer last name, product id	ordered, and the totalUSD for all orders	
--   made in March of any year,	sorted by totalUSD from	high to low
select lastname, prodid, totalusd
from people inner join orders on people.pid = orders.custid
where extract(month from dateOrdered) = 03
order by totalusd DESC;

--4. Display the last name of all customers (in reverse alphabetical order)	and	their total	
-- ordered, and	nothing	more. Use coalesce to avoid	showing	NULLs
select lastname, coalesce(sum(orders.quantityordered), 0) as amountOrdered
from people inner join customers on people.pid = customers.pid
left outer join orders on customers.pid = orders.custid
group by lastname
order by lastname DESC;

--5. Display the names	of	all	customers who bought products from agents based	in	
-- Chilliwack along	with the names of the products they ordered, and the names of the	
--  agents who sold	it to them.

select firstname, orders.name
from people inner join customers on people.pid = customers.pid
left outer join orders on orders.custid = customers.pid
left outer join agents on orders.agentid = agents.pid;

--DNF
--6. Write	a	query	to	check	the	accuracy	of	the	totalUSD	column	in	the	Orders	table.	This	
-- means	calculating		Orders.totalUSD	from	data	in	other	tables	and	comparing	those	
-- values	to	the	values	in	Orders.totalUSD.	Display	all	rows	in	Orders	where	
-- Orders.totalUSD	is	incorrect,	if	any.	If	there	are	any	incorrect		values,	explain	why	they	
-- are	wrong.	Round	to	two	decimal	places.
--DNF

--7. Display the first and last	name of	all	customers who are also agent
select firstname, lastname
from people
where pid in (select pid 
			 from customers
			 where pid in (select pid
						  from agents));

--8. Create	a VIEW of	all	Customer and People	data called	PeopleCustomers.	Then	another	
-- VIEW	of	all	Agent and	People	data	called	PeopleAgents.	Then	"select	*"	from	each	of	
-- them	to test	them view PeopleCustomers

create view PeopleCustomers
as
select p.firstname, p.lastname, p.suffix,p.homecity, p.dob, c.pid, c.paymentterms,c.discountpct
from people p left outer join customers c on c.pid = p.pid;

create view PeopleAgents
as
select p.firstname, p.lastname, p.suffix,p.homecity, p.dob,a.pid, a.paymentterms, a.commissionpct
from people p left outer join agents a 
on p.pid = a.pid;

select *
from PeopleCustomers;

select *
from PeopleAgents;

--9. Display the first and last	name of	all	customers who are also agents, this	time using	
-- the views you created.

select PeopleCustomers.firstname, PeopleCustomers.lastname
from PeopleCustomers inner join PeopleAgents on PeopleCustomers.pid = PeopleAgents.pid
where PeopleCustomers.pid in (select PeopleAgents.pid
							  		from PeopleAgents);
							  
--10.Compare your SQL in #7	(no	views) and #9 (using views). The output	is the same.	
-- How does	that work? What	is the database	server doing internally	when it	processes	
-- the	#9	query?

--The view has saved the data from the pervious datables for both of them
--The view essentially creates a new table for us that we can access and query.


--11. [Bonus]	What’s the difference between a	LEFT OUTER JOIN	and	a RIGHT	OUTER	
-- JOIN? Give example queries in SQL to	demonstrate. (Feel	free to	use	the	CAP	database	
-- to make your	points here.)

--Left Outer Join is having all the values in the left table but only the values in right table that correspond
--If we do get the pid's from the left table (people) and outer join it to the right table...
-- all the values of the people table will be returned because all of the pids in the right table,
-- the agent table, are inside of the people table already.
select p.pid
from people p left outer join agents a on p.pid = a.pid;

-- Right Outer Join is having all the values in the right table but only the values in left table that correspond
-- if we get the pid's from the right table (agents) and outer join it to the left table...
-- all the values of the agent table will be returned because all of the pids in the left table,
-- the people table, are inside of the agent table already.
select p.pid
from people p right outer join agents a on p.pid = a.pid;
