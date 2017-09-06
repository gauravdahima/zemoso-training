-- Find out the number of movies in which “SEAN WILLIAMS” acted.

use sakila;
select count(*) as Count from 
	film join film_actor
		on film.film_id = film_actor.film_id
	join actor
		on film_actor.actor_id = actor.actor_id
    where actor.first_name = "SEAN" and actor.last_name = "WILLIAMS";
    
    
select count(*) as Count from film_list where actors like '%SEAN WILLIAMS%';