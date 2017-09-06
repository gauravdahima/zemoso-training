-- Find out the total sales from Animation movies.

use sakila;
select * from sales_by_film_category
	where category = "Animation";