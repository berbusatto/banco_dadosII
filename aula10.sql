-- TASK 1. crie uma tabela de carros com as seguintes colunas

-- id_carro, nome, modelo, ano

-- Insira
-- Chevette, Chevrolet, 1995
-- Gol, Volkswagen, 2010
-- Onix, Chevrolet, 2020

-- TASK 2. Crie uma tabela de vendedores com as seguintes colunas

-- id_vendedor, nome, sobrenome, cpf

-- Insira

-- Jose, Silva, 37312730139
-- Fabio, Lima, 98213982833

-- TASK 3. crie uma tabela de compradores
-- id_comprador, nome, sobrenome, cpf

-- insira 
-- Odair, Silveira, 1369128982

-- TASK 4. Crie uma tabela que relaciona compradores, vendedores e carros

-- comp_vend_carro, id_comp_vend_carro, id_comprador, id_vendedor, id_carro

-- TASK 5. crie uma view que retorna todas as transações. por linha deve haver

-- nome do carro, modelo do carro, ano do carro, nome do vendedor, nome do comprador

-- id do jose, id do odair, id do gol

DROP DATABASE IF EXISTS aula10;
CREATE DATABASE aula10;

use aula10;

CREATE TABLE carros (
    id_carro INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(255), 
    modelo VARCHAR(255), 
    ano VARCHAR(255)
);

INSERT INTO 
    carros (nome, modelo, ano) 
VALUES 
    ("Chevette", "Chevrolet", "1989"),
    ("Gol", "Volkswagen", "1999"),
    ("Onix", "Chevrolet", "2020");


SELECT * FROM carros;
    ----------------------


CREATE TABLE vendedores (
    id_vendedor INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(255), 
    sobrenome VARCHAR(255), 
    cpf VARCHAR(255)
);

INSERT INTO 
    vendedores (nome, sobrenome, cpf) 
VALUES 
    ("Jose", "Silva", "37312730139"),
    ("Fabio", "Lima", "98213982833");

SELECT * FROM vendedores;

    -----------------------


CREATE TABLE compradores (
    id_comprador INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(255), 
    sobrenome VARCHAR(255), 
    cpf VARCHAR(255)
);

INSERT INTO 
    compradores (nome, sobrenome, cpf) 
VALUES 
    ("Odair", "Silveira", "1369128982");

SELECT * FROM compradores;

    ----------------------

CREATE TABLE comp_vend_carro (
    
    id_comp_vend_carro INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    id_comprador INTEGER, 
    FOREIGN key (id_comprador) REFERENCES compradores(id_comprador),
    id_vendedor INTEGER, 
    FOREIGN key (id_vendedor) REFERENCES vendedores(id_vendedor),
    id_carro INTEGER,
    FOREIGN key (id_carro) REFERENCES carros(id_carro)
    
);

INSERT INTO 
    comp_vend_carro (id_comprador, id_vendedor, id_carro) 
VALUES (
    (SELECT id_comprador FROM compradores WHERE nome = 'Odair'),
    (SELECT id_vendedor FROM vendedores WHERE nome = 'Jose'),
    (SELECT id_carro FROM carros WHERE nome = 'Gol')
);

SELECT * FROM comp_vend_carro;


-- SELECT QUE RELACIONA O CARRO, O ANO E O VENDEDOR, NOME VENDEDOR, NOME COMPRADOR
SELECT 'creating a view' AS 'log';

DROP view IF EXISTS carros_aula10;

CREATE VIEW view_carros AS (
    SELECT
        compradores.nome as  nome_comprador,
        compradores.sobrenome as sobrenome_comprador,
        compradores.cpf as cpf_comprador,
        compradores.id_comprador as id_comprador,
        carros.id_carro as id_carro,
        carros.nome as carro_nome,
        carros.modelo as carro_modelo,
        carros.ano as carro_ano,
        vendedores.nome as vendedor_nome,
        vendedores.sobrenome as vendedor_sobrenome,
        vendedores.cpf as vendedor_cpf,
        vendedores.id_vendedor as id_vendedor        
    FROM
        comp_vend_carro
        INNER JOIN
            compradores
        ON comp_vend_carro.id_comprador = compradores.id_comprador
        INNER JOIN
            vendedores
        ON comp_vend_carro.id_vendedor = vendedores.id_vendedor   
        INNER JOIN
            carros
        ON comp_vend_carro.id_carro = carros.id_carro
);

SELECT * FROM view_carros;


