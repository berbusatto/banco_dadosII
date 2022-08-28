
select DISTINCT film.title 
from film
join inventory
    on inventory.film_id = film.film_id
join rental 
    on rental.inventory_id = inventory.inventory_id
where rental.customer_id in(
    select customer.customer_id 
    from customer 
    join address
        on address.address_id = customer.address_id
    join city
        on city.city_id = address.city_id
    where city.city = 'Caracas'
);