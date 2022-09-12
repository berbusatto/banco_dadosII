-- EXERCÍCIO:

-- CRIE UMA TABELA CHAMADA a
-- CRIE UMA TABELA CHAMADA b criar antes 

-- A tabela a tem as seguintes colunas
-- id_a
-- name_a
-- id_b fk

-- A tabela b tem as seguintes colunas
-- id_b
-- name_b

-- Segue os registros de b 
-- q w e r t y u 

-- segue registros de a 
-- a s d f g h j k l tal que 

-- q > a , s > r, f> t, k > u 
-- id de q é fk de a

-- SELECIONE TODOS OS ELEMENTOS QUE PERTENCEM A b, NÃO PERTENCEM A a e não estão relacionadas com a .

-- Monte o select 
DROP DATABASE IF EXISTS exercicio_join;
CREATE DATABASE exercicio_join;

USE exercicio_join;

DROP TABLE IF EXISTS b;
DROP TABLE IF EXISTS a;

CREATE TABLE b (
    id_b INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name_b VARCHAR(255)    
);

CREATE TABLE a (
    id_a INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name_a VARCHAR(255),
    id_b INTEGER,
    FOREIGN KEY (id_b) REFERENCES b(id_b)
);

INSERT INTO 
    b (name_b) 
VALUES
    ('q'), ('w'), ('e'), ('r'), ('t'), ('y'), ('u');

INSERT INTO 
    a (name_a, id_b) 
VALUES
    ('a', (SELECT id_b FROM b WHERE name_b = 'q')),
    ('s', (SELECT id_b FROM b WHERE name_b = 'r')),
    ('d', NULL),
    ('f', (SELECT id_b FROM b WHERE name_b = 't')),
    ('g', NULL),
    ('h', NULL),
    ('j', NULL),
    ('k', (SELECT id_b FROM b WHERE name_b = 'u')),
    ('l', NULL);


SELECT * FROM b;

SELECT * FROM a;



