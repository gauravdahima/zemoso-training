-- Find out the top 3 rented category of movies  by “PATRICIA JOHNSON”.

use sakila;
select  film_list.category as Category , count(film_list.category) as Count from 
	film_list join inventory
		on film_list.FID = inventory.film_id
	join rental
		on inventory.inventory_id = rental.inventory_id
	join customer_list
		on rental.customer_id = customer_list.ID
	where customer_list.name = "PATRICIA JOHNSON"
		group by film_list.category
	order by Count DESC
    limit 3;