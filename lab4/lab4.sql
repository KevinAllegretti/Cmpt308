--1. Get all the People data for people who are customers.
select *
from people 
where pid in (select pid
				from customers);

--2. Get all the People data for people who are agents
select *
from people 
where pid in (select pid
			 	from agents);

--3. Get all the people data for people who are both customers and agents.
select *
from people 
where pid in (select pid 
			 	from customers)
and pid in (select pid 
				from agents);

--4. Get all the People data for people who are neither customers nor agents.
select *
from people
where pid not in (select pid 
				  from customers)
and pid not in (select pid 
				from agents);

--5. Get the ID of customers who ordered either product 'p01' or 'p03' (or both)
select pid 
from customers
where pid in (select custid 
			  from orders 
			  where prodid = 'p01' 
			  or prodid = 'p03');
			 		
--6. Get the ID of customers who ordered both products 'p01' and 'p03'.
--   List the IDs in order from highest to lowest. Include each ID only once
select pid 
from customers
where pid in (select custid 
			  from orders 
			  where prodid = 'p01')
and pid in (select custid 
			from orders 
			where prodid = 'p03')
order by pid DESC;

--7. Get the first and last names of agents who sold prodducts 'p05' or 'p07'
--   in order by last name from Z to A
select firstname, lastname
from people
where pid in (select pid 
			  from agents
			  where pid in (select agentid
			 				from orders
			 				where prodid = 'p05'
			 				or prodid = 'p07'))
order by lastname DESC;

--8. Get the home city and birthday of agents booking an order for the customer
--   whose pid is 008, sorted by home city from A to Z
select homecity, dob
from people
where pid in (select pid
			  from agents
			  where pid in(select agentid 
						   from orders
						   where custid = '008'))
order by homecity ASC;

--9. Get the unique ids of products ordered through any agent who takes at least one
--   order from a customer in Montreal, sorted by id from highest to lowest.
select distinct prodid
from orders
where agentid in (select agentid
				from orders
				where custid in (select pid
								 from people
								 where homecity = 'Montreal'))
order by prodid DESC;

--10. Get the last name and home city for all customers who place orders 
--    through agents in Chilliwack or New Orleans

select lastName, homecity
from people
where pid in ((select custid 
				from orders
				where agentid in (select pid
								  from people
								  where homecity = 'Chilliwack'
								  or homecity = 'New Orleans')))
    



