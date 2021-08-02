/* SQL "Sakila" database query exercises - phase 1 */

-- Database context
USE sakila;

-- Your solutions...
1a.
select first_name, last_name
from actor

1b.
select concat (first_name,' ',last_name) as ActorName
from actor

2a.
select actor_id, first_name, last_name
from actor
where first_name = 'joe'

2b.
select last_name
from actor
where last_name like '%gen%'

2c.
select last_name, first_name
from actor
where last_name like '%LI%'
ORDER BY last_name, first_name

2d.
select country_id, country
from country
where country IN ('Afghanistan', 'Bangladesh', 'China')

3a.
alter table actor
modify middle_name varchar(255) after first_name

3b.
alter table actor
change middle_name middle_name blob

3c.
alter table actor
drop COLUMN middle_name

4a.
select last_name, count(last_name)
from actor
group by last_name
having count(last_name)

4b.
select last_name, count(last_name)
from actor
group by last_name
having count(last_name) > 1

4c.
update actor
set first_name = 'HARPO'
where actor_id = 172;

4d.
update actor
set first_name = 'GROUCHO'
where actor_id = 172;

update actor
set first_name = 'MUCHOGROUCHO'
where actor_id = 172;

5a.
create table address
address_id varchar(50)
address varchar(50)
address2 varchar(50)
district varchar(50)
city_id smallint unsigned
postal_code varchar(50)
phone varchar(50)
location geometry
last_update timestamp = current_time;

6a.
select staff.first_name, staff.last_name, address.address, address.district
from staff
join address using(address_id)

6b.
select staff.first_name, staff.last_name, sum(payment.amount)
from staff
join payment using(staff_id)
where month(payment.payment_date) = 8 and year(payment.payment_date) = 2005
group by staff.first_name, staff.last_name

6c.
select film.title, count(film_actor.actor_id)
from film
inner join film_actor using(film_id)
group by film.title

6d.
select film.title, count(inventory.inventory_id) as copies_available
from film
join inventory using(film_id)
where title = 'HUNCHBACK IMPOSSIBLE'

6e.
select customer.first_name, customer.last_name, sum(payment.amount)
from customer
join payment using(customer_id)
group by customer.first_name, customer.last_name
order by customer.last_name asc

7a.
select a.title, a.name
from (select film.title, language.name
from film
join language using(language_id)
where title like 'K%' OR title like 'Q%') a
where a.name = 'English'

7b.
select a.first_name, a.last_name, a.title
from
     (select actor.first_name,actor.last_name, film.title
    from actor
    join film_actor on film_actor.actor_id = actor.actor_id
    join film on film_actor.film_id = film.film_id) a
where a.title = 'Alone Trip'

7c.
select customer.first_name, customer.last_name, customer.email, country.country
from customer
join address using(address_id)
join city using(city_id)
join country using(country_id)
where country.country = 'Canada'

7d.
select film.title, film.rating
from film
where film.rating = 'g' or film.rating = 'pg-13'

7e.
select film.title, count(rental.rental_date)
from film
join inventory using(film_id)
join rental using(inventory_id)
group by film.title
order by count(rental.rental_date) desc

7f.
select store.store_id, sum(payment.amount)
from store
join inventory using(store_id)
join rental using(inventory_id)
join payment using(rental_id)
group by store.store_id

7g.
select store.store_id, city.city, country.country
from store
join address using(address_id)
join city using(city_id)
join country using(country_id)

7h.
select category.name, sum(payment.amount)
from category
join film_category using(category_id)
join inventory using(film_id)
join rental using(inventory_id)
join payment using(rental_id)
group by category.name
order by sum(payment.amount) desc
limit 5

8a.
Create view top_genres as
select category.name, sum(payment.amount)
from category
join film_category using(category_id)
join inventory using(film_id)
join rental using(inventory_id)
join payment using(rental_id)
group by category.name
order by sum(payment.amount) desc
limit 5;

8b.
select * from top_genres;

8c.
drop view top_genres;
