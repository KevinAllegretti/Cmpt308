--1. List	the	order	number	and	total	dollars	of	all	orders.
select ordernum, totalusd
from orders;

--2. List the last name	and	home city of people	whose prefix is	"Ms.".
select lastname, homecity
from people
where prefix in ('Ms.');

--3. List id, name,	and	quantity on	hand of	products with quantity	more than 1007.
select prodid, name, qtyonhand
from products
where qtyonhand > 1007;

--4. List the first	name and home city of people born in the 1920s.
select firstname, homecity
from people
where dob between ('1920-01-01') and ('1929-12-31');

--5. List the prefix and last name of people who are not "Mr.".
select prefix, lastname
from people
where prefix not in ('Mr.');

--6. List all fields for products in neither Dallas	nor	Duluth that	cost US$3 or less.
select *
from products
where city not in ('Dallas')
and city not in ('Duluth')
and priceusd <= 3.00;

--7. List all fields for orders	in January
select *
from orders
where dateordered between ('2021-01-01') and ('2021-01-31');

--8. List	all	fields	for	orders	in	February	of	US$23,000	or	more.
select *
from orders
where dateordered between ('2021-02-01') and ('2021-02-28')
and totalusd >= 23000;

--9.List all orders	from the customer whose	id	is	007.
select *
from orders
where custid = 007;

--10 List all orders from the customer whose id	is 005.
select *
from orders
where custid = 005;