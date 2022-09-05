
-- select actor.first_name, actor.last_name
--     from actor

--     inner join film_actor
--     on actor.actor_id = film_actor.actor_id
--     inner join film
--     on film_actor.film_id = film.film_id
--     inner join inventory
--     on inventory.film_id = film.film_id
--     inner join  rental
--     on inventory.inventory_id = rental.inventory_id
--     inner join customer
--     on rental.customer_id = (select customer.customer_id from customer where customer.email = "%a%";




SELECT 
    concat(actor.first_name, ' ', actor.last_name) AS nome,
    customer.customer_id, 
    rental.rental_id, 
    inventory.inventory_id, 
    film.film_id

FROM customer
INNER JOIN rental ON customer.customer_id = rental.customer_id
INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
INNER JOIN film ON inventory.film_id = film.film_id
INNER JOIN film_actor ON film.film_id = film_actor.film_id
INNER JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE customer.email = "DOROTHY.TAYLOR@sakilacustomer.org"
GROUP BY nome ASC;


    



