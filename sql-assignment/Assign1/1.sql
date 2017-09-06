-- Find out the PG-13 rated comedy movies. DO NOT use the film_list table.

use sakila;
select title as Movie from 
	film join film_category
		on film.film_id = film_category.film_id
	join category 
		on film_category.category_id = category.category_id
	where category.name = 'Comedy' and rating = 'PG-13'; 