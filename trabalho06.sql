DROP DATABASE IF EXISTS trabalho06;
CREATE DATABASE trabalho06;

USE trabalho06;

DROP TABLE IF EXISTS
    busatto;

DROP TABLE IF EXISTS
    bernardo;


CREATE TABLE bernardo (
    id_bernardo INTEGER PRIMARY KEY AUTO_INCREMENT,
    rg VARCHAR(255) NOT NULL
);

CREATE TABLE busatto(
    id_busatto INTEGER PRIMARY KEY AUTO_INCREMENT,
    cpf VARCHAR(255) NOT NULL,
    id_bernardo INTEGER NOT NULL,
    FOREIGN KEY (id_bernardo) REFERENCES bernardo(id_bernardo)
);

INSERT INTO 
    bernardo(rg)
VALUES
    ('1087654399'),
    ('1055544293'),
    ('7392703884'),
    ('1890367432')
    ;

INSERT INTO 
    busatto(cpf, id_bernardo)
VALUES
    ('4898464589', 3),
    ('9846546249', 1),
    ('7894561234', 2),
    ('4983249825', 4);

SELECT * FROM bernardo;

SELECT * FROM busatto;
    
SET autocommit=0;

START TRANSACTION;

DELETE FROM busatto WHERE id_busatto = 3;

SELECT "ANTES DO ROLLBACK" AS "LOG";
SELECT * FROM busatto;

ROLLBACK;
SELECT "DEPOIS DO ROLLBACK" AS "LOG";
SELECT * FROM busatto;

SET autocommit=1;


DELIMITER $$
    CREATE TRIGGER trigg01 AFTER INSERT ON bernardo
        FOR EACH ROW
            BEGIN
                UPDATE
                    busatto
                SET
                    cpf = ('08800099999')
                WHERE
                    busatto.id_busatto = 1;
                END $$
 DELIMITER ;


INSERT INTO 
    bernardo(rg)
VALUES
    ('123345234')
    ;

SELECT * FROM busatto;


    
    


