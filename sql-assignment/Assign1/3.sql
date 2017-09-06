-- Find out the list of customers from India who have rented sports movies.

use sakila;
select distinct customer_list.name as Name, category.name as Genre , country from 
	category join film_category 
		on category.category_id = film_category.category_id
    join film
		on film_category.film_id = film.film_id
    join inventory
		on film.film_id = inventory.film_id
    join rental
		on inventory.inventory_id = rental.inventory_id
    join customer_list
		on rental.customer_id = customer_list.ID
    where category.name = "Sports" and country = "India";