-- Find out the top 3 rented horror movies.

use sakila;
select title as MovieTitle, count(name) as Count from 
	category join film_category
		on  film_category.category_id = category.category_id
	join film
		on film_category.film_id = film.film_id
	join inventory
		on film.film_id = inventory.film_id
	join rental
		on inventory.inventory_id = rental.inventory_id
	where name = 'Horror'
	group by title 
    order by count(name) DESC 
    limit 3;
