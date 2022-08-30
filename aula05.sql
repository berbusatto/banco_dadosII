CREATE DATABASE IF NOT EXISTS 
    aprender_join 
CHARACTER SET 
    utf8mb4;

USE 
    aprender_join;



DROP TABLE IF EXISTS 
    garcom_restaurantes;

DROP TABLE IF EXISTS 
    garcom;

DROP TABLE IF EXISTS 
    restaurantes;

DROP TABLE IF EXISTS 
    cidade;

DROP TABLE IF EXISTS 
    estado;



CREATE TABLE estado (
    id_estado INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    regiao ENUM('sul', 'sudeste', 'nordeste', 'norte', 'centro-oeste')
);

CREATE TABLE cidade(
    id_cidade INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    id_estado INTEGER NOT NULL,
    FOREIGN KEY (id_estado) REFERENCES estado(id_estado)
);

INSERT INTO
    estado(nome, regiao)
VALUES 
    ('Parana', 'sul'),
    ('Rio Grande do Sul', 'sul'),
    ('Santa Catarina', 'sul'),
    ('Sao Paulo', 'sudeste'),
    ('Rio de Janeiro', 'sudeste'),
    ('Minas gerais', 'sudeste'),    
    ('Espirito Santo', 'sudeste'),
    ('Mato Grosso', 'centro-oeste'),
    ('Mato Grosso do Sul', 'centro-oeste'),
    ('Goias', 'centro-oeste'), 
    ('Distrito Federal', 'centro-oeste'),
    ('Roraima', 'norte'),
    ('Amapa', 'norte'),
    ('Maranhao', 'nordeste'),      
    ('Tocantins', 'norte'),
    ('Rondonia', 'norte'),
    ('Acre', 'norte'),
    ('Para', 'norte'),
    ('Amazonas', 'norte'),
    ('Bahia', 'nordeste'),
    ('Sergipe', 'nordeste'),
    ('Alagoas', 'nordeste'),
    ('Rio Grande do Norte', 'nordeste'),
    ('Paraiba', 'nordeste'),
    ('Pernambuco', 'nordeste'),
    ('Ceara', 'nordeste'),
    ('Piaui', 'nordeste')
    ;

SET @idParana:=(SELECT id_estado FROM estado WHERE estado.nome = "Parana");
SET @idRioGrandeDoSul:=(SELECT id_estado FROM estado WHERE estado.nome = "Rio Grande do Sul");
SET @idSantaCatarina:=(SELECT id_estado FROM estado WHERE estado.nome = "Santa Catarina");
SET @idSaoPaulo:=(SELECT id_estado FROM estado WHERE estado.nome = "Sao Paulo");
SET @idRioDeJaneiro:=(SELECT id_estado FROM estado WHERE estado.nome = "Rio de Janeiro");
SET @idEspiritoSanto:=(SELECT id_estado FROM estado WHERE estado.nome = "Espirito Santo");
SET @idMinasGerais:=(SELECT id_estado FROM estado WHERE estado.nome = "Minas Gerais");
SET @idEspiritoSanto:=(SELECT id_estado FROM estado WHERE estado.nome = "Espirito Santo");
SET @idMatoGrosso:=(SELECT id_estado FROM estado WHERE estado.nome = "Mato Grosso");
SET @idMatoGrossoDoSul:=(SELECT id_estado FROM estado WHERE estado.nome = "Mato Grosso do Sul");
SET @idMatoGrosso:=(SELECT id_estado FROM estado WHERE estado.nome = "Mato Grosso");
SET @idGoias:=(SELECT id_estado FROM estado WHERE estado.nome = "Goias");
SET @idDistritoFederal:=(SELECT id_estado FROM estado WHERE estado.nome = "Distrito Federal");
SET @idRoraima:=(SELECT id_estado FROM estado WHERE estado.nome = "Roraima");
SET @idAmapa:=(SELECT id_estado FROM estado WHERE estado.nome = "Amapa");
SET @idMaranhao:=(SELECT id_estado FROM estado WHERE estado.nome = "Maranhao");
SET @idTocantins:=(SELECT id_estado FROM estado WHERE estado.nome = "Tocantins");
SET @idRondonia:=(SELECT id_estado FROM estado WHERE estado.nome = "Rondonia");
SET @idAcre:=(SELECT id_estado FROM estado WHERE estado.nome = "Acre");
SET @idPara:=(SELECT id_estado FROM estado WHERE estado.nome = "Para");
SET @idAmazonas:=(SELECT id_estado FROM estado WHERE estado.nome = "Amazonas");
SET @idBahia:=(SELECT id_estado FROM estado WHERE estado.nome = "Bahia");
SET @idSergipe:=(SELECT id_estado FROM estado WHERE estado.nome = "Sergipe");
SET @idAlagoas:=(SELECT id_estado FROM estado WHERE estado.nome = "Alagoas");
SET @idRioGrandeDoNorte:=(SELECT id_estado FROM estado WHERE estado.nome = "Rio grande do Norte");
SET @idParaiba:=(SELECT id_estado FROM estado WHERE estado.nome = "Paraiba");
SET @idPernambuco:=(SELECT id_estado FROM estado WHERE estado.nome = "Pernambuco");
SET @idCeara:=(SELECT id_estado FROM estado WHERE estado.nome = "Ceara");
SET @idPiaui:=(SELECT id_estado FROM estado WHERE estado.nome = "Piaui");

INSERT INTO 
    cidade(nome, id_estado) 
VALUES         
        ("Curitiba", @idParana),
        ("Londrina", @idParana),
        ("Paranagua", @idParana),
        ("Sao Paulo", @idSaoPaulo),
        ("Pindamonhangaba", @idSaoPaulo),
        ("Rio de janeiro", @idRioDeJaneiro),
        ("Niteroi", @idRioDeJaneiro),
        ("Salvador", @idBahia),
        ("Recife", @idPernambuco),
        ("Olinda", @idPernambuco),
        ("Belem", @idPara),
        ("Cuiaba", @idMatoGrosso),
        ("Natal", @idRioGrandeDoNorte),
        ("Brasilia", @idDistritoFederal),
        ("Goiania", @idGoias),
        ("Manaus", @idAmazonas);

SELECT *
FROM estado
WHERE regiao = 'sul' OR regiao = 'sudeste';

SELECT estado.nome
FROM estado 
WHERE estado.id_estado = (
    SELECT cidade.id_estado 
    FROM cidade 
    WHERE cidade.nome = "Pindamonhangaba");

SELECT 
    *
FROM 
    cidade
INNER JOIN 
    estado 
ON 
    cidade.id_estado = estado.id_estado --  FAZER COM FOREIGN KEY COM PRIMARY KEY
WHERE
    cidade.nome = "Manaus";



CREATE TABLE restaurantes(
    id_restaurante INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255), 
    descricao VARCHAR(255),
    id_cidade INTEGER,
    FOREIGN KEY (id_cidade) REFERENCES cidade(id_cidade)
);

SET @idCuritibaCidade = (SELECT id_cidade FROM cidade WHERE nome = 'Curitiba');
SET @idSaoPauloCidade = (SELECT id_cidade FROM cidade WHERE nome = 'Sao Paulo');
SET @idRioDeJaneiroCidade = (SELECT id_cidade FROM cidade WHERE nome = 'Rio de Janeiro');
SET @idBrasiliaCidade = (SELECT id_cidade FROM cidade WHERE nome = 'Brasilia');
SET @idNiteroiCidade = (SELECT id_cidade FROM cidade WHERE nome = 'Niteroi');


INSERT INTO 
    restaurantes(nome, descricao, id_cidade)
VALUES
    ("Mineirinha", "Comer uma mineirinha eh daora", @idCuritibaCidade),
    ("Fogo de Chao", "Churrasco com um pouco de terra", @idCuritibaCidade),
    ("Carlitos Pizzaria", "Pizzaria tradicional mais moderna da cidade", @idSaoPauloCidade),
    ("Cantina do Senac", "Pior cantina do mundo", @idBrasiliaCidade),
    ("El Patron", "Comida Mexicana do Paraguai", @idRioDeJaneiroCidade),
    ("Tchaca Tchaca na Butchaca", "Comida fresquinha tailandesa", @idBrasiliaCidade),
    ("Assuquinha", "Formigas e abelhas sao bem vindas", @idSaoPauloCidade);
    
SELECT 
    *
FROM
    restaurantes
WHERE id_cidade = 
    (SELECT 
        cidade.id_cidade 
    FROM 
        cidade 
    WHERE 
        cidade.id_cidade = @idBrasiliaCidade);


-- CRIAR JOIN ENTRE RESTAURANTE E CIDADE com WHERE pelo nome do restaurante
SELECT 'Restaurantes primeiro' AS INFO;

SELECT 
    *
FROM 
    restaurantes
INNER JOIN 
    cidade 
ON 
    cidade.id_cidade = restaurantes.id_cidade
WHERE 
    restaurantes.nome = "Carlitos Pizzaria";


-- INVERTENDO O JOIN
SELECT 
    'Cidades primeiro' AS INFO;
SELECT 
    *
FROM 
    cidade
INNER JOIN 
    restaurantes 
ON 
    cidade.id_cidade = restaurantes.id_cidade
WHERE 
    restaurantes.nome = "Carlitos Pizzaria";

SELECT
    'Controlando as colunas' AS INFO;

SELECT
    t1.nome_da_cidade,
    t1.nome_do_restaurante
FROM -- SUBSELECT COM INNERJOIN GERA UMA NOVA TABELA
    (SELECT
        cidade.nome AS nome_da_cidade,
        restaurantes.nome AS nome_do_restaurante,
        restaurantes.descricao AS descricao_do_restaurante
    FROM 
        cidade
    INNER JOIN 
        restaurantes
            ON restaurantes.id_cidade = cidade.id_cidade
    WHERE
        restaurantes.nome LIKE '%CAR%'
    ) AS t1
        WHERE
        t1.nome_da_cidade = 'Sao Paulo';


-- O MESMO COMPORTAMENTO DE PULAR ENTRE AS TABELAS COM SUBSELECTS PODEMOS ALCANÇAR COM INNERJOINS
SELECT 'Inner Join dentro de Inner Join' AS "INFO";
SELECT
    cidade.nome AS nome_da_cidade,
    estado.nome AS nome_do_estado,
    restaurantes.nome AS nome_do_restaurante
FROM 
    restaurantes
INNER JOIN
    cidade
        ON restaurantes.id_cidade = cidade.id_cidade
    INNER JOIN 
        estado
            ON cidade.id_estado = estado.id_estado
WHERE
    restaurantes.nome LIKE "Tcha%";





INSERT INTO 
    restaurantes(nome, descricao)
VALUES
    ("Restaurante sem lugar", "Ue, kd");


SELECT
    "Fazendo busca sem relacao entre as tabelas (id_cidade eh FK)"
AS
    "LOG";    

SELECT 
    * 
FROM 
    cidade
INNER JOIN
    restaurantes
    ON 
        cidade.id_cidade = restaurantes.id_cidade 
WHERE 
    restaurantes.nome = 'Restaurante sem lugar';


SELECT
    "Fazendo busca sem relacao entre as tabelas (id_cidade eh FK)"
AS
    "LOG";    

SELECT 
    * 
FROM 
    restaurantes
INNER JOIN
    cidade
    ON 
        restaurantes.id_cidade = cidade.id_cidade 
WHERE 
    restaurantes.nome = 'Restaurante sem lugar';

-- O INNER JOIN SÓ TRAZ QUANDO OS 2 REGISTROS BATEM
-- CASO UM DELES SEJA NULL A TABELA NÃO CARREGA OS DADOS
-- TOMAR CUIDADO COM O INNER POIS É O MAIS RESTRITIVO!!!
-- PORÉM O MAIS PERFORMÁTICO


SELECT
    "Traga tudo"
AS
    "LOG";    

SELECT 
    cidade.nome,
    restaurantes.nome
FROM 
    restaurantes
INNER JOIN
    cidade
    ON 
        cidade.id_cidade = restaurantes.id_cidade;


INSERT INTO 
    restaurantes(nome, descricao, id_cidade)
VALUES
    ("MC donalds", "3 bigmacs e 1 quarteirao", @idCuritibaCidade),
    ("Burguer King", "Gosto", @idCuritibaCidade),
    ("Subway", "Saladinha", @idCuritibaCidade),
    ("Giraffas", "Nunca comi", @idCuritibaCidade),
    ("Bobs", "So ovomaltine", @idCuritibaCidade);

SELECT 
    *
FROM 
    restaurantes;

SELECT
    "Traga tudo"
AS
    "LOG";    

SELECT 
    cidade.nome,
    restaurantes.nome
FROM 
    restaurantes
INNER JOIN
    cidade
    ON 
        cidade.id_cidade = restaurantes.id_cidade
WHERE 
    cidade.nome = 'Curitiba';

INSERT INTO restaurantes (nome, descricao, id_cidade)
VALUES("Comida mineira", "melhor comidinha de sampa", @idSaoPauloCidade);

SELECT 
    *
FROM 
    restaurantes
INNER JOIN 
    cidade
    ON
        cidade.id_cidade = restaurantes.id_cidade
        WHERE
        cidade.nome IN ('Curitiba', 'Sao Paulo');  



CREATE TABLE    garcom(
    id_garcom INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    experiencia ENUM('Junior', 'Pleno', 'Senior'),
    tipo_documento ENUM('cpf', 'rg'),
    documento VARCHAR(255)
    );

INSERT INTO 
    garcom(nome, experiencia, tipo_documento, documento)
VALUES
    ('Jorge', 'Junior', 'cpf', '08130122283'),
    ('Joao', 'Pleno', 'cpf', '17236498132'),
    ('Joaquim', 'Senior', 'rg', '82639126394'),
    ('Jose', 'Pleno', 'cpf', '17936842891'),
    ('Julio', 'Junior', 'rg', '71839536721'),
    ('Jamil', 'Senior', 'rg', '21674932783'),
    ('Juca', 'Junior', 'cpf', '07357129842')
    ;

SELECT 
    *
FROM
    garcom;


CREATE TABLE garcom_restaurantes(
    id_restaurante INTEGER NOT NULL,
    id_garcom INTEGER NOT NULL,
    dia_semana  ENUM('Domingo', 'Segunda', 'Terca', 'Quarta', 'Quinta', 'Sexta', 'Sabado'),
    FOREIGN KEY (id_restaurante) REFERENCES restaurantes(id_restaurante),
    FOREIGN KEY (id_garcom) REFERENCES garcom(id_garcom)
);
    
INSERT INTO garcom_restaurantes
    (id_restaurante, id_garcom, dia_semana)
VALUES
    (
        (SELECT id_restaurante FROM restaurantes WHERE restaurantes.nome = 'Mineirinha'),
        (SELECT id_garcom FROM garcom WHERE garcom.nome = 'Jorge'),
        'segunda'
    ),
    (
        (SELECT id_restaurante FROM restaurantes WHERE restaurantes.nome = 'Fogo de Chao'),
        (SELECT id_garcom FROM garcom WHERE garcom.nome = 'Jorge'),
        'terca'
    ),
    (
        (SELECT id_restaurante FROM restaurantes WHERE restaurantes.nome = 'Assuquinha'),
        (SELECT id_garcom FROM garcom WHERE garcom.nome = 'Jorge'),
        'quarta'
    ),
    (
        (SELECT id_restaurante FROM restaurantes WHERE restaurantes.nome = 'Restaurante sem lugar'),
        (SELECT id_garcom FROM garcom WHERE garcom.nome = 'Juca'),
        'quarta'
    ),
    (
        (SELECT id_restaurante FROM restaurantes WHERE restaurantes.nome = 'Bobs'),
        (SELECT id_garcom FROM garcom WHERE garcom.nome = 'Joaquim'),
        'sexta'
    ),
    (
        (SELECT id_restaurante FROM restaurantes WHERE restaurantes.nome = 'El Patron'),
        (SELECT id_garcom FROM garcom WHERE garcom.nome = 'Joaquim'),
        'quarta'
    ),
    (
        (SELECT id_restaurante FROM restaurantes WHERE restaurantes.nome = 'El Patron'),
        (SELECT id_garcom FROM garcom WHERE garcom.nome = 'Jose'),
        'quinta'
    ),
    (
        (SELECT id_restaurante FROM restaurantes WHERE restaurantes.nome = 'Cantina do Senac'),
        (SELECT id_garcom FROM garcom WHERE garcom.nome = 'Joao'),
        'quarta'
    ),
    (
        (SELECT id_restaurante FROM restaurantes WHERE restaurantes.nome = 'Burguer King'),
        (SELECT id_garcom FROM garcom WHERE garcom.nome = 'Julio'),
        'segunda'
    ),
    (
        (SELECT id_restaurante FROM restaurantes WHERE restaurantes.nome = 'Assuquinha'),
        (SELECT id_garcom FROM garcom WHERE garcom.nome = 'Julio'),
        'sexta'
    );



SELECT * FROM garcom_restaurantes;
    
SELECT 
    garcom.nome AS 'nome do garcom',
    restaurantes.nome AS 'nome do restaurante',
    garcom_restaurantes.dia_semana AS 'dia da semana'
FROM
    garcom
INNER JOIN
    garcom_restaurantes
        ON
        garcom.id_garcom = garcom_restaurantes.id_garcom
INNER JOIN 
    restaurantes 
        ON garcom_restaurantes.id_restaurante = restaurantes.id_restaurante
WHERE 
    garcom.nome IN('Jorge', 'Juca', 'Joaquim');

