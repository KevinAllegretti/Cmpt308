--1. Show all the People data (and only people data) for people who are customers.
select p.*
from people p join customers c on p.pid = c.pid

--2. Show all the People data (and only the people data) for people who are agents.
select p.*
from people p join agents a on p.pid = a.pid

--3. Show all People and Agent data for people who are both customers and agents.
select p.*, a.*
from people p inner join agents a on p.pid = a.pid
inner join customers c on p.pid = c.pid

--4. Show the first name of customers who have never placed an order. Use subqueries.
select firstname
from people
where pid in (select pid
			 from customers
			 where pid not in (select custid
							  from orders))
--5. Show the first name of customers who have never placed an order. Use one inner and one outer join.
select distinct firstname
from people p inner join customers c on p.pid = c.pid
right outer join orders o on not c.pid = o.custid

--I could not figure out how to seperate cynthia from the rest of the customers


--6. Show the id and commission percent of Agents who booked an order for the Customer whose id is 008, 
--   sorted by commission percent from high to low. Use joins; no subqueries.
select pid, commissionpct
from agents a inner join orders o on a.pid = o.agentid
where custid = 008
order by commissionpct DESC

--7. Show the last name, home city, and commission percent of Agents who booked an order for the customer whose id is 001,
--   sorted by commission percent from high to low. Use joins.
select lastname, homecity, commissionpct
from people p inner join agents a on p.pid = a.pid
inner join orders o on a.pid = o.agentid
where custid = 001
order by commissionpct DESC

--8.  Show the last name and home city of customers who live in the city that makes the fewest different kinds of products. 
--    (Hint: Use count and group by on the Products table. You may need limit as well.)
select lastname, homecity
from people p inner join customers c on p.pid = c.pid
inner join products on products.city = p.homecity 

--even though montreal is the answer, I couldn't figure out where to use the count() or group by
--to find which city shows up the least amount of times in products


--9. Show the name and id of all Products ordered through any Agent who booked at least one order for a Customer in Arlington, sorted by product name from A to Z. 
--   You can use joins or subqueries. Better yet, do it both ways and impress me.
select name, prodid
from products 
where prodid in (select prodid
				from orders
				where agentid in (select agentid
								from orders
								 where custid in (select pid 
								 				from people
											  	where homecity = 'Arlington')))
												
--10.  Show the first and last name of customers and agents living in the same city, along with the name of their shared city. 
--     (Living in a city with yourself does not count, so exclude those from your results.)
select firstname, lastname, homecity
from people p right outer join agents a on p.pid = a.pid
left outer join customers c on p.pid = c.pid
where p.homecity = p.homecity
