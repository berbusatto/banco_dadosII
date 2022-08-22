SELECT * 
FROM pet;

SELECT * 
FROM pet
ORDER BY createdAt DESC;

SELECT * 
FROM pet
ORDER BY createdAt DESC
LIMIT 3;

SELECT race, count(*) as num
FROM pet
GROUP BY race 
ORDER BY num DESC;

SELECT name, count(*) as num
FROM pet
GROUP BY name
ORDER BY num DESC
LIMIT 10;

