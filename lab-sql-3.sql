use sakila;
-- 1.How many distinct (different) actors' last names are there?
select COUNT(DISTINCT last_name) AS "Different Last Names" from actor;

-- 2.In how many different languages where the films originally produced? (Use the column language_id from the film table)
select COUNT(DISTINCT language_id) from film;

-- 3.How many movies were released with "PG-13" rating?
select COUNT(rating) from film
where rating = "PG-13";

-- 4.Get 10 the longest movies from 2006.
select title, length, release_year  from film
where release_year = "2006" 
order by length desc
limit 10;

-- 5.How many days has been the company operating (check DATEDIFF() function)?
select datediff(max(rental_date), min(rental_date)) as "Days in operation" from rental;
select datediff(max(payment_date), min(payment_date)) as "Days in operation" from payment;

-- 6.Show rental info with additional columns month and weekday. Get 20.
select rental_id, rental_date, date_format(convert(rental_date,date), '%m') as "month_rental", weekday(rental_date) as "day_rental",
inventory_id, customer_id, return_date, date_format(convert(return_date,date), '%m') as "month_return", weekday(return_date) as "day_return" from rental
limit 20;

-- 7.Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *, 
	case
		when weekday(rental_date) >= 0 and weekday(rental_date) <= 4 then "Workday"
        else "Weekend"
	end as "day_type"
from rental;
        
-- 8.How many rentals were in the last month of activity?
select max(rental_date) from rental;

select count(rental_date) from rental
where date_format(convert(rental_date, date), '%y-%m') = '06-02';
