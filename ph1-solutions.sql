/* SQL "Sakila" database query exercises - phase 1 */

-- Database context
USE sakila;

-- Your solutions...

i. 
Select *
from actor
where first_name = 'Scarlett'

ii. 
select *
from actor
where last_name = 'Johansson'

iii. 
select count(distinct last_name)
from actor;

iv. 
select last_name
from actor
group by last_name
having count(*) = 1;

v. 
select last_name
from actor
group by last_name
having COUNT(*)>1;

vi. 
select actor.actor_id, actor.first_name, actor.last_name, count(film_actor.film_id) as filmcount
from actor
join film_actor using (actor_id)
group by actor.actor_id, actor.first_name, actor.last_name
order by filmcount desc
limit 1;

vii. 
select film.title,  inventory.store_id, inventory.inventory_id
from film
join inventory using (film_id)
where film.title = 'Academy Dinosaur' and store_id = 1
and not exists(select *
from rental
where inventory_id in (1,2,3,4) and rental.return_date is null);

viii.
insert into rental (rental_date, inventory_id, customer_id, staff_id)
values (NOW(), 1, 1, 1);

ix.
select rental_date,
       rental_date + interval
        (select rental_duration from film where film_id = 1) day
        as due_date
from rental
where rental_id = (select rental_id from rental order by rental_id desc limit 1);

 
x.
select avg(length)
from film;

xi.
select category.name, avg(length)
from category
join film_category on category.category_id = film_category.category_id
join film on film_category.film_id = film.film_id
group by category.name

xii. 
Because the last update columns are not 
the same the join cannot yield a result