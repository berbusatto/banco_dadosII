DROP DATABASE IF EXISTS estoque;
CREATE DATABASE estoque;

use estoque;

DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS cargos;
DROP TABLE IF EXISTS empresas;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS clientes_produtos;
DROP TABLE IF EXISTS usuarios_produtos;

CREATE TABLE cargos (
    id_cargo INTEGER NOT NULL PRIMARY KEY auto_increment,
    cargo VARCHAR(255)
);


CREATE TABLE usuarios (
    id_usuario INTEGER NOT NULL PRIMARY KEY auto_increment,
    nome_usuario VARCHAR(255),
    endereco_usuario VARCHAR(255),
    telefone VARCHAR(255),
    id_cargo INTEGER,
    FOREIGN KEY (id_cargo) REFERENCES cargos (id_cargo)
);


CREATE TABLE empresas (
    id_empresa INTEGER NOT NULL PRIMARY KEY auto_increment,
    nome_empresa VARCHAR(255)
);


CREATE TABLE produtos (
    id_produto INTEGER NOT NULL PRIMARY KEY auto_increment,
    nome_produto VARCHAR(255),
    preco_compra FLOAT,
    preco_venda FLOAT,
    quantidade INTEGER,
    id_empresa INTEGER,
    FOREIGN KEY (id_empresa) REFERENCES empresas (id_empresa)
);


CREATE TABLE clientes (
    id_cliente INTEGER NOT NULL PRIMARY KEY auto_increment,
    nome_cliente VARCHAR(255),
    cpf_cnpj_cliente VARCHAR(255),
    endereco_cliente VARCHAR(255)
);


CREATE TABLE clientes_produtos (
    id_cliente INTEGER,
    id_produto INTEGER,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
    FOREIGN KEY (id_produto) REFERENCES produtos (id_produto)
);


CREATE TABLE usuarios_produtos (
    id_usuario INTEGER,
    id_produto INTEGER,
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario),
    FOREIGN KEY (id_produto) REFERENCES produtos (id_produto)
);



INSERT INTO cargos (cargo) VALUES
('Vendedor'),
('Secretario'),
('Gerente'),
('Diretor');

SELECT * FROM cargos;

INSERT INTO usuarios (nome_usuario, endereco_usuario, id_cargo) VALUES
('Bernardo', 'BR116', 3),
('Maria', 'Emma Joana Kelnner', 2),
('Rita', 'Americo Vespucio', 1),
('Cadi', 'Augusto de Mari', 2),
('Pedro', 'Delegado Eduardo', 4)
;

SELECT * FROM usuarios;

INSERT INTO empresas (nome_empresa) VALUES
('CB'),
('BRT'),
('AcForte'),
('BBProj')
;

SELECT * FROM empresas;

INSERT INTO produtos (nome_produto, preco_compra, preco_venda, quantidade, id_empresa) VALUES
('Chapa de aco', 130.99 , 189.99 , 350 , 1),
('Parafuso', 0.99 , 1.99 , 50000 , 1),
('Bracadeira', 12.99 , 18.99 , 100 , 2),
('Malha de aco', 55.99 , 79.99 , 200 , 3),
('Calha de zinco', 29.99 , 39.99 , 1000 , 2)

;

SELECT * FROM produtos;

INSERT INTO clientes (nome_cliente, cpf_cnpj_cliente, endereco_cliente) VALUES
('Luffy', 72398429, 'East Blue'),
('Zoro', 89673494, 'Wano'),
('Sanji', 18923731289, 'North Blue'),
('Nami', 13257821, 'Arlong Park');

SELECT * FROM clientes;

INSERT INTO clientes_produtos (id_cliente, id_produto) VALUES
    (
        (SELECT clientes.id_cliente FROM clientes WHERE clientes.nome_cliente = 'Luffy'),
        (SELECT produtos.id_produto FROM produtos WHERE produtos.nome_produto = 'Bracadeira')         
    ),
    (
        (SELECT clientes.id_cliente FROM clientes WHERE clientes.nome_cliente = 'Zoro'),
        (SELECT produtos.id_produto FROM produtos WHERE produtos.nome_produto = 'Parafuso')         
    ),
    (
        (SELECT clientes.id_cliente FROM clientes WHERE clientes.nome_cliente = 'Sanji'),
        (SELECT produtos.id_produto FROM produtos WHERE produtos.nome_produto = 'Chapa de aco')         
    ),
    (
        (SELECT clientes.id_cliente FROM clientes WHERE clientes.nome_cliente = 'Nami'),
        (SELECT produtos.id_produto FROM produtos WHERE produtos.nome_produto = 'Parafuso')         
    );

SELECT * FROM clientes_produtos;

INSERT INTO usuarios_produtos (id_usuario, id_produto) VALUES
    (
        (SELECT usuarios.id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Bernardo'),
        (SELECT produtos.id_produto FROM produtos WHERE produtos.nome_produto = 'Bracadeira')         
    ),
    (
        (SELECT usuarios.id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Rita'),
        (SELECT produtos.id_produto FROM produtos WHERE produtos.nome_produto = 'Parafuso')         
    ),
    (
        (SELECT usuarios.id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Cadi'),
        (SELECT produtos.id_produto FROM produtos WHERE produtos.nome_produto = 'Chapa de aco')         
    ),
    (
        (SELECT usuarios.id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Maria'),
        (SELECT produtos.id_produto FROM produtos WHERE produtos.nome_produto = 'Parafuso')         
    ),
    (
        (SELECT usuarios.id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Pedro'),
        (SELECT produtos.id_produto FROM produtos WHERE produtos.nome_produto = 'Parafuso')         
    ),
    (
        (SELECT usuarios.id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Bernardo'),
        (SELECT produtos.id_produto FROM produtos WHERE produtos.nome_produto = 'Bracadeira')         
    );

SELECT * FROM usuarios_produtos;

SELECT
    "EXERCICIO 1";

-- Com subselect, monte query traz o nome do cliente, 
-- a empresa do cliente, o nome do produto que o cliente consume, 
-- o telefone do cliente e a quantidade do produto em estoque 
-- trazer para um conjunto de clientes (veja in) pelo nome. Deve haver um limit de 3 registros.


SELECT 
    (SELECT nome_cliente FROM clientes WHERE clientes.id_cliente = clientes_produtos.id_cliente) AS nome_cliente,
    (SELECT nome_produto FROM produtos WHERE produtos.id_produto = clientes_produtos.id_produto) AS nome_produto,
    (SELECT quantidade FROM produtos WHERE produtos.id_produto = clientes_produtos.id_produto) AS qtde_estoque

FROM clientes_produtos
LIMIT 3;


SELECT
    "EXERCICIO 2";

-- Com subselect, monte query traz o nome do cliente, a empresa do cliente, 
-- o nome do produto que o cliente consume, o telefone do cliente e a quantidade do produto em estoque 
-- trazer para um conjunto de clientes (veja in) pelo nome. 
-- Deve haver uma ordenação orientada pela quantidade de produtos sendo essa descendente.

SELECT 
    (SELECT nome_cliente FROM clientes WHERE clientes.id_cliente = clientes_produtos.id_cliente) AS nome_cliente,
    (SELECT nome_produto FROM produtos WHERE produtos.id_produto = clientes_produtos.id_produto) AS nome_produto,
    (SELECT quantidade FROM produtos WHERE produtos.id_produto = clientes_produtos.id_produto) AS qtde_estoque

FROM clientes_produtos
ORDER BY qtde_estoque DESC;


SELECT
    "EXERCICIO 3"
AS 'INNER JOIN';

-- Com inner join, monte query traz o nome do cliente, a empresa do cliente, 
-- o nome do produto que o cliente consume, 
-- o telefone do cliente e a quantidade do produto em estoque - 
-- trazer para um conjunto de clientes (veja in) pelo nome. 
-- Deve haver uma ordenação orientada pelo preço de compra (do maior para o menor).

SELECT 
    clientes.nome_cliente,
    clientes.cpf_cnpj_cliente,
    empresas.nome_empresa,
    produtos.nome_produto,
    produtos.preco_compra,
    produtos.quantidade
FROM
    clientes 
INNER JOIN clientes_produtos
    ON clientes.id_cliente = clientes_produtos.id_cliente
INNER JOIN produtos
    ON clientes_produtos.id_produto = produtos.id_produto
INNER JOIN empresas
    ON produtos.id_empresa = empresas.id_empresa
ORDER BY produtos.preco_compra DESC;

SELECT
    "EXERCICIO 4"
AS 'LEFT JOIN';

-- Com left join, monte query traz o nome do cliente, a empresa do cliente, 
-- o nome do produto que o cliente consume, o telefone do cliente e a quantidade do produto em estoque - 
-- trazer para um conjunto de clientes (veja in) pelo nome. 
-- Deve haver uma ordenação orientada pelo preço de compra (do maior para o menor).

SELECT 
    clientes.nome_cliente,
    clientes.cpf_cnpj_cliente,
    empresas.nome_empresa,
    produtos.nome_produto,
    produtos.preco_compra,
    produtos.quantidade
FROM
    clientes 
LEFT JOIN clientes_produtos
    ON clientes.id_cliente = clientes_produtos.id_cliente
LEFT JOIN produtos
    ON clientes_produtos.id_produto = produtos.id_produto
LEFT JOIN empresas
    ON produtos.id_empresa = empresas.id_empresa
ORDER BY produtos.preco_compra DESC;
