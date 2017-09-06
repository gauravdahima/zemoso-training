-- Find out the number of sci-fi movies rented by the store managed by Jon Stephens.

use sakila;
select count(rental_id) from 
	category join film_category 
		on category.category_id = film_category.category_id
    join inventory
		on film_category.film_id = inventory.film_id
    join rental
		on inventory.inventory_id = rental.inventory_id
    join staff
		on rental.staff_id = staff.staff_id
    where staff.first_name = "Jon" and staff.last_name = "Stephens" and category.name = "Sci-Fi";