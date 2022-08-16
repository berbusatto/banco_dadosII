USE sakila;


SELECT film.description, film.title 
FROM film
WHERE film.film_id IN(

    SELECT inventory.film_id    
    FROM inventory
    WHERE inventory.inventory_id IN(

        SELECT rental.inventory_id
        FROM rental
        WHERE rental.customer_id = (
            
            SELECT customer.customer_id
            FROM customer
            WHERE customer.email = 'KIM.CRUZ@sakilacustomer.org'
            );
        )
)