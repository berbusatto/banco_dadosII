SELECT "Selecao das cidades do país Afghanistan" 
AS "CIDADES";

SELECT * 
FROM city
WHERE city.CountryCode = (
    SELECT Code
    FROM country
    WHERE country.name = 'Afghanistan'
);