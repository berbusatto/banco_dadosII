DROP DATABASE IF EXISTS transaction_rollback;

CREATE DATABASE transaction_rollback;

USE transaction_rollback;

CREATE TABLE musics(
    id_music INTEGER PRIMARY KEY AUTO_INCREMENT,
    name_of_music VARCHAR(255),
    band VARCHAR(255),
    created_at DATETIME DEFAULT NOW()
);

    
SET autocommit=0;



INSERT INTO 
    musics(name_of_music, band)
VALUES 
    ('Nothing Else Matters', 'Metallica'),
    ('Enter Sandman', 'Metallica'),
    ('My Friend of Misery', 'Metallica'),
    ('Deutshchland', 'Rammstein'),
    ('Rosenrot', 'Rammstein'),
    ('Ohne Dich', 'Rammstein'),
    ('Never gonna give you up', 'Rick Astley');

SELECT "PRIMEIRO INSERT" AS "LOG";
SELECT * FROM musics;

START TRANSACTION;

ALTER TABLE musics ADD good TINYINT;

UPDATE musics SET good = 1 WHERE band IN ('Metallica', 'Rick Astley');

UPDATE musics SET good = 0 WHERE band IN ('Rammstein');

SELECT "UPDATE ANTES DO ROLLBACK" AS "LOG";
SELECT * FROM musics;

SELECT "DEPOIS DO ROLLBACK" AS "LOG";

ROLLBACK;

SELECT * FROM musics;

SET autocommit=1;