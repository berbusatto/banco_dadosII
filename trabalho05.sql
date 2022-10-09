DROP DATABASE IF EXISTS trabalho05;
CREATE DATABASE trabalho05;

USE trabalho05;

DROP TABLE IF EXISTS
    cidade;
DROP TABLE IF EXISTS
    pais;

CREATE TABLE pais (
    id_pais INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL    
);

CREATE TABLE cidade(
    id_cidade INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    id_pais INTEGER NOT NULL,
    FOREIGN KEY (id_pais) REFERENCES pais(id_pais)
);

INSERT INTO 
    pais(nome)
VALUES
    ('Esbornia'),
    ('Kalabok'),
    ('Evangelistao'),
    ('Genteburra');

INSERT INTO 
    cidade(nome, id_pais)
VALUES
    ('Pastor Malacheia', 3),
    ('Cap. Capiroto', 1),
    ('Matatudo', 2),
    ('Tauruslandia', 4),
    ('Deserto do Rio Negro', 1),
    ('Vogue`s Beach', 2),
    ('Rachadinhopolis', 3),
    ('N. Senhora da Hipocrisia', 4),
    ('Procurador Salvatodos', 1),
    ('Desalmados do Sul', 2),
    ('Ruinas da Asa Norte', 3),
    ('Colonia Gadoforte', 4),
    ('Matasmatico', 1),
    ('Inferninho do Norte', 2),
    ('Queimafloresta', 3),
    ('Ultimo Indio', 4);

-- SELECT * FROM cidade;

-- SELECT * FROM pais;
    
CREATE VIEW 
    view_pais_cidade
AS (
    SELECT pais.nome AS pais_nome, pais.id_pais AS pais_id, cidade.nome AS cidade_nome, cidade.id_cidade AS cidade_id, cidade.id_pais AS cidade_id_pais FROM pais
    INNER JOIN cidade
    ON pais.id_pais = cidade.id_pais 
    )
    ORDER BY cidade_id ASC;

SELECT * FROM view_pais_cidade;
    
    
    


