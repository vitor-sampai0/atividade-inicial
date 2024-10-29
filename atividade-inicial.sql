-- Criação do Banco de Dados "restaurantes"
CREATE DATABASE restaurantes;

-- Criação da Tabela "sabores" com uma chave primária automática e uma coluna "tipo"
CREATE TABLE sabores (
    sabor_id SERIAL PRIMARY KEY,
    tipo VARCHAR(20)
);

-- Criação da Tabela "comidas" com uma chave primária automática e uma coluna de chave estrangeira "sabor_id"
CREATE TABLE comidas (
    comida_id SERIAL PRIMARY KEY,
    nome VARCHAR(20),
    sabor_id INT,
    FOREIGN KEY (sabor_id) REFERENCES sabores(sabor_id)
);

-- Inserindo tipos de sabor na Tabela "sabores"
INSERT INTO sabores (tipo) VALUES
    ('Doce'), 
    ('Picante'), 
    ('Salgado'), 
    ('Azedo'), 
    ('Amargo');
    ('Quente'); -- Inserindo um sabor adicional para mostrar o LEFT JOIN

-- Consulta para visualizar todos os sabores inseridos
SELECT * FROM sabores;

-- Inserindo valores na Tabela "comidas" e associando cada comida ao seu sabor correspondente
INSERT INTO comidas (nome, sabor_id) VALUES ('Limão', 4);
INSERT INTO comidas (nome, sabor_id) VALUES ('Chocolate 50%', 5);
INSERT INTO comidas (nome, sabor_id) VALUES ('Torta de Frango', 3);
INSERT INTO comidas (nome, sabor_id) VALUES ('Pimenta', 2);
INSERT INTO comidas (nome, sabor_id) VALUES ('Brigadeiro', 1);
INSERT INTO comidas (nome) VALUES ('Sorvete'); -- Inserindo uma comida sem sabor associado para  mostrar o RIHGT JOIN

-- Consulta para visualizar todas as comidas inseridas
SELECT * FROM comidas;

-- Realizando um INNER JOIN para obter apenas as comidas com sabores associados
SELECT s.tipo, c.nome
FROM sabores s
INNER JOIN comidas c 
ON s.sabor_id = c.sabor_id;

-- Realizando um LEFT JOIN para obter todas as comidas, incluindo as que não têm sabor associado
SELECT s.tipo, c.nome
FROM sabores s
LEFT JOIN comidas c ON s.sabor_id = c.sabor_id;

-- Realizando um RIGHT JOIN para obter todos os sabores, incluindo aqueles que não têm uma comida associada
SELECT s.tipo, c.nome
FROM sabores s
RIGHT JOIN comidas c ON s.sabor_id = c.sabor_id;

-- Realizando um FULL JOIN para obter todas as combinações de sabores e comidas, incluindo registros sem correspondência
SELECT s.tipo, c.nome
FROM sabores s
FULL JOIN comidas c ON s.sabor_id = c.sabor_id;
