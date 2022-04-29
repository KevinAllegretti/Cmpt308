
create or replace function preReqForNum(CourseNum) returns refcursor as $$
declare 
	CourseNum int := $1;
	resultset REFCURSOR := $2;
begin 
	open resultset for
		select preReqNum
		from prerequisites
	return resultset;
end;
$$
language plpgsql;

select preReqForNum(499)
Fetch all from results

create or replace function isPreReqFor(CourseNum) returns refcursor as $$
declare 
	CourseNum int := $1;
	resultset REFCURSOR := $2;
begin 
	open resultset for
		select coursenum
		from prerequisites
	return resultset;
end;
$$
language plpgsql;
