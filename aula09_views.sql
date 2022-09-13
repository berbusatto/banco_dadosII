use sakila;

SELECT 'creating a view' AS 'log';

DROP view IF EXISTS select_all_actors;

CREATE
    VIEW select_all_actors
AS (
    SELECT 
        actor.first_name,
        actor.last_name,
        actor.last_update
    FROM 
        actor
    WHERE actor.first_name LIKE "C%"
    );

SELECT 
    'using created view' 
AS 
    'log';

SELECT 
    * 
FROM 
    select_all_actors;