
SELECT "Specific select on customer table" 
AS "INFO";
SELECT 
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    customer.active
FROM customer
WHERE customer.first_name = 'MARY' OR customer.first_name = 'PATRICIA'
LIMIT 15
;

------------------------------------

SELECT "Specific select on customer table customer Wade" 
AS "INFO";
SELECT 
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    customer.active
FROM customer
WHERE customer.first_name = 'WADE' OR customer.email = 'WADE.DELVALLE@sakilacustomer.org'
LIMIT 15
;

--------------------------------------

SELECT "Specific select of films" 
AS "INFO";
SELECT 
    film.title,
    film.description,
    film.length,
    film.release_year,
    film.language_id,
    film.rating
FROM film 
WHERE 
(film.release_year > 1995 AND film.release_year < 2020)
AND
(film.length > 40 AND film.length < 80)
AND
(film.language_id = 1 OR film.language_id = 5)
AND 
(film.rating = 'G' OR film.rating = 'R' or film.rating = 'NC-17')
LIMIT 80
;

--------------------------------------

SELECT "Specific select using IN - verifies if filtered string exists - low performance" 
AS "INFO";
SELECT 
    film.title,
    film.description,
    film.length,
    film.release_year,
    film.language_id,
    film.rating
FROM film 
WHERE 
(film.release_year > 1995 AND film.release_year < 2020)
AND
(film.length > 40 AND film.length < 80)
AND
(film.language_id IN(1,5))
AND 
(film.rating IN ('G','R','NC-17'))
LIMIT 80
;

---------------------------------------

SELECT "Specific select using BETWEEN" 
AS "INFO";
SELECT 
    film.title,
    film.description,
    film.length,
    film.release_year,
    film.language_id,
    film.rating
FROM film 
WHERE 
(film.release_year BETWEEN 1995 AND 2020)
AND
(film.length BETWEEN 40 AND 80)
AND
(film.language_id IN(1,5))
AND 
(film.rating IN ('G','R','NC-17'))
LIMIT 80
;

-----------------------------------------

SELECT "Introduction of subquery" 
AS "INFO";
SELECT 
    film.title,
    film.description,
    film.length,
    film.release_year,
    film.language_id,
    film.rating
FROM film 
WHERE 
    (film.release_year BETWEEN 1995 AND 2020) AND
    (film.length BETWEEN 40 AND 80) AND
    (film.language_id IN( 
        (
        SELECT language_id 
        FROM language 
        WHERE language_id = "English" 
        ),
        (
        SELECT language_id 
        FROM language 
        WHERE language.name = "Italian"    
        )
        )
    ) AND 
        (film.rating IN ('G','R','NC-17'))
LIMIT 200
;


----------------------------------------------------

SELECT "Introduction to subquery with variable" 
AS "INFO";

SET @FRENCH_ID = (SELECT language_id
FROM 
    language 
WHERE 
    language_id = "French");

SET @ENGLISH_ID = (SELECT language_id
FROM 
    language 
WHERE 
    language_id = "English");

SET @ITALIAN_ID = (SELECT language_id
FROM 
    language 
WHERE 
    language_id = "Italian");

SELECT 
    film.title,
    film.description,
    film.length,
    film.release_year,
    film.language_id,
    film.rating
FROM 
    film 
WHERE 
    (film.language_id IN(@FRENCH_ID, @ENGLISH_ID, @ITALIAN_ID))
ORDER BY
    film.language_id
DESC
LIMIT 100
;