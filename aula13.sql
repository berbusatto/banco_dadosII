DROP DATABASE IF EXISTS transaction_rollback;

CREATE DATABASE transaction_rollback;

USE transaction_rollback;

CREATE TABLE musics(
    id_music INTEGER PRIMARY KEY AUTO_INCREMENT,
    name_of_music VARCHAR(255),
    band VARCHAR(255),
    created_at DATETIME DEFAULT NOW()
);

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

SELECT 
    "BEFORE DELETE ROW OF MUSICS TABLE" 
AS 
    "LOG";

SELECT 
    * 
FROM 
    musics;

-- SET 
--     autocommit=0;

-- START TRANSACTION;
--     DELETE FROM     
--         musics 
--     WHERE 
--         name_of_music = 'Never gonna give you up';

-- SELECT 
--     "AFTER DELETE ROW OF MUSICS TABLE" 
-- AS 
--     "LOG";
-- SELECT 
--     * 
-- FROM 
--     musics;

-- ROLLBACK;

-- SET autocommit=1;

-- SELECT
--     * 
-- FROM 
--     musics;

-- ------------------------------
-- -- COMMIT ANTES DO ROLLBACK --

-- SET autocommit=0;

-- START TRANSACTION;
--     DELETE FROM     
--         musics 
--     WHERE 
--         name_of_music = 'Never gonna give you up';

-- SELECT "AFTER DELETE ROW OF MUSICS TABLE" AS "LOG";

-- SELECT * FROM musics;

-- ROLLBACK;

-- SELECT "ROLLBACK EXECUTED" AS "LOG";

-- SELECT * FROM musics;

-- COMMIT;


-- -------------------------------
-- -- COMMIT DEPOIS DO ROLLBACK -- 

-- SET autocommit=0;

-- START TRANSACTION;
--     DELETE FROM     
--         musics 
--     WHERE 
--         name_of_music = 'Never gonna give you up';

-- SELECT "AFTER DELETE ROW OF MUSICS TABLE" AS "LOG";

-- COMMIT;

-- SELECT "COMMIT EXECUTED" AS "LOG";

-- SELECT * FROM musics;

-- ROLLBACK;

-- SELECT "ROLLBACK EXECUTED" AS "LOG";

-- SELECT * FROM musics;

-- SET autocommit=1;

SET autocommit=0;

START TRANSACTION;
DELETE FROM musics WHERE name_of_music = 'Never gonna give you up';

SELECT "AFTER DELETE" AS "LOG";

SELECT * FROM musics;

ROLLBACK;

SELECT * FROM musics;