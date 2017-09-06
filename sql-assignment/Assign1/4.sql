-- Find out the list of customers from Canada who have rented “NICK WAHLBERG” movies.

use sakila;
select distinct customer_list.name as Name , country , actor.first_name ,actor.last_name from 
	inventory join rental
		on inventory.inventory_id = rental.inventory_id
    join customer_list
		on rental.customer_id = customer_list.ID
    join film_actor
		on inventory.film_id = film_actor.film_id
    join actor
		on film_actor.actor_id = actor.actor_id
    where actor.first_name = "NICK" and actor.last_name = "WAHLBERG" and customer_list.country = "Canada"
    order by customer_list.name;