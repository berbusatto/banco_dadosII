-- Responda (mostrando a evidência em um .sql) a seguinte pergunta: Quais foram os filmes assistidos pelos moradores de Caracas?

-- BERNARDO BUSATTO
-- RAPHAEL STANULA

USE sakila;
        
SELECT film.film_id, film.title 
FROM film
WHERE film.film_id IN(

    SELECT inventory.film_id    
    FROM inventory
    WHERE inventory.inventory_id IN(

        SELECT rental.inventory_id
        FROM rental
        WHERE rental.customer_id IN(
            
            SELECT customer.customer_id
            FROM customer
            WHERE customer.address_id IN(

                    SELECT address.address_id
                    FROM address
                    WHERE address.city_id IN(

                        SELECT city.city_id
                        FROM city
                        WHERE city.city = 'Caracas'
                    )
                )
            ) 
        )
    )  
