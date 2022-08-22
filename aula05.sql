CREATE DATABASE IF NOT EXISTS aprender_join 
CHARACTER SET utf8mb4;

USE aprender_join;

DROP TABLE IF EXISTS cidade;

DROP TABLE IF EXISTS estado;

CREATE TABLE estado (
    id_estado INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    regiao ENUM('sul', 'sudeste', 'nordeste', 'norte', 'centro-oeste')
);

CREATE TABLE cidade(
    id_cidade INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    id_estado INTEGER NOT NULL,
    FOREIGN KEY (id_estado) REFERENCES estado (id_estado)
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

SELECT *
FROM estado
WHERE regiao = 'sul' OR regiao = 'sudeste';
