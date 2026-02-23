create database BD230226;
use BD230226;


/* atividade 1 a 5*/
/*criar tabelas solicitadas*/

CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL);


CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    email VARCHAR(45),
    cidade VARCHAR(45),
    data_cadastro DATE);

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    preco DECIMAL(10,2),
    estoque INT,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id));


CREATE TABLE vendedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    comissao DECIMAL(10,2),
    data_admissao DATE);


CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE,
    id_cliente INT,
    id_vendedor INT,
    total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id),
    FOREIGN KEY (id_vendedor) REFERENCES vendedores(id));

/*atividade6*/
ALTER TABLE clientes ADD telefone VARCHAR(45);

/*atividade7*/
ALTER TABLE vendedores CHANGE comissao percentual_ganho DECIMAL(10,2);

/* atividade 8 a 12*/
/*dar insert nas tabelas*/
INSERT INTO categorias (nome) VALUES
('Hardware'),
('Software'),
('Periféricos'),
('Redes'),
('Acessórios');

INSERT INTO clientes (nome, email, cidade, data_cadastro) VALUES
('Maria Silva','maria@gmail.com','Muriaé','2026-01-10'),
('João Souza','joao@gmail.com','Cataguases','2026-01-12'),
('Carlos Lima','carlos@outlook.com','Muriaé','2026-01-15'),
('Ana Costa','ana@gmail.com','Leopoldina','2026-01-20'),
('Marcos Paulo','marcos@outlook.com','Ubá','2026-01-25'),
('Fernanda Alves','fernanda@gmail.com','Muriaé','2026-02-01'),
('Pedro Henrique','pedro@gmail.com','Cataguases','2026-02-02'),
('Juliana Rocha','juliana@gmail.com','Ubá','2026-02-03'),
('Lucas Martins','lucas@gmail.com','Leopoldina','2026-02-05'),
('Empresa XP S/A','contato@xp.com','Muriaé','2026-02-06');


INSERT INTO produtos (nome, preco, estoque, id_categoria) VALUES
('Processador Intel',1500,10,1),
('Memória RAM 16GB',400,20,1),
('SSD 1TB',600,15,1),
('Windows 11',800,30,2),
('Mouse Gamer',150,25,3),
('Teclado Mecânico',350,8,3),
('Roteador TP-Link',500,12,4),
('Switch 8 Portas',300,7,4),
('Headset Gamer',250,9,5),
('Webcam HD',200,6,5);


INSERT INTO vendedores (nome, percentual_ganho, data_admissao) VALUES
('Ricardo Lima',0.10,'2018-05-10'),
('Paula Souza',0.12,'2019-07-15'),
('André Martins',0.08,'2020-03-20'),
('Camila Rocha',0.15,'2017-09-01'),
('Bruno Alves',0.11,'2021-01-10');


INSERT INTO pedidos (data, id_cliente, id_vendedor, total) VALUES
('2026-01-12',1,1,2000),
('2026-01-15',2,2,800),
('2026-01-20',3,3,1500),
('2026-02-01',4,4,5000),
('2026-02-05',5,5,1200),
('2026-02-10',6,1,2200),
('2026-02-12',7,2,900),
('2026-02-14',8,3,700),
('2026-02-15',9,4,1800),
('2026-02-16',10,5,3000);

show tables;
select *from categorias;
select *from clientes;
select *from pedidos;
select *from produtos;
select *from vendedores;

/*Questão 13*/
UPDATE produtos
SET preco = preco * 1.10
WHERE id_categoria = 1;

/*Questão 14*/
UPDATE clientes
SET email = 'maria.silva@outlook.com'
WHERE id = 1;

/*Questão 15*/
UPDATE produtos
SET estoque = 0
WHERE id = 1;

/* Questão 16*/
DELETE FROM pedidos WHERE id = 2;

/*Questão 17*/
DELETE FROM produtos WHERE preco < 1;

/* Questão 18*/
ALTER TABLE vendedores ADD cpf VARCHAR(14) UNIQUE;

/* Questão 19*/
UPDATE clientes
SET cidade = 'Muriaé-MG'
WHERE cidade = 'Muriaé';

/* Questão 20*/
INSERT INTO produtos (nome, preco, estoque, id_categoria)
VALUES ('Servidor Dell',5000,5,1);

/* Questão 21*/
DELETE FROM vendedores WHERE id = 5;

/*Questão 22*/
ALTER TABLE pedidos ADD observacao VARCHAR(45);

/* Questão 23*/
CREATE TEMPORARY TABLE fornecedores_teste (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45));

/*Questão 24*/
DROP TEMPORARY TABLE fornecedores_teste;

/* Questão 25*/
UPDATE categorias
SET nome = 'Componentes Internos'
WHERE nome = 'Hardware';

/*Questão 26*/
INSERT INTO clientes (nome, email, cidade, data_cadastro)
VALUES ('Ana Tech','ana@tech.com','Muriaé-MG',CURDATE());

/* Questão 27*/
UPDATE vendedores
SET percentual_ganho = 0.15;

/* Questão 28*/
DELETE FROM clientes WHERE email IS NULL;

/* Questão 29*/
ALTER TABLE pedidos MODIFY total DECIMAL(10,2);

/* Questão 30*/
INSERT INTO pedidos (data,id_cliente,id_vendedor,total)
VALUES ('2026-02-20',1,(SELECT MAX(id) FROM vendedores),2500);

/* Questão 31*/
SELECT nome, preco FROM produtos;

/*Questão 32*/
SELECT * FROM produtos WHERE preco > 2000;

/*Questão 33*/
SELECT * FROM clientes WHERE nome LIKE 'M%';

/* Questão 34*/
SELECT * FROM pedidos
WHERE data BETWEEN '2026-01-01' AND '2026-02-15';

-- Questão 35
SELECT * FROM produtos ORDER BY preco ASC;

/*Questão 36*/
SELECT * FROM produtos
WHERE estoque < 5 AND preco > 500;

/* Questão 37*/
SELECT * FROM clientes
WHERE cidade = 'Muriaé-MG' OR cidade = 'Cataguases';

/*Questão 38*/
SELECT COUNT(*) AS total_clientes FROM clientes;

/* Questão 39*/
SELECT SUM(total) AS total_vendas FROM pedidos;

/*Questão 40*/
SELECT AVG(preco) AS media_preco FROM produtos;

/*Questão 41*/
SELECT nome AS Nome_Item, preco AS Preco_Venda FROM produtos;

/* Questão 42*/
SELECT cidade, COUNT(*) AS total
FROM clientes
GROUP BY cidade;

/* Questão 43*/
SELECT p.nome AS produto, c.nome AS categoria
FROM produtos p
INNER JOIN categorias c ON p.id_categoria = c.id;

/*Questão 44*/
SELECT pe.id, c.nome
FROM pedidos pe
INNER JOIN clientes c ON pe.id_cliente = c.id;

/*Questão 45*/
SELECT v.nome, pe.total
FROM pedidos pe
INNER JOIN vendedores v ON pe.id_vendedor = v.id;

/* Questão 46*/
SELECT * FROM clientes
WHERE email LIKE '%@outlook.com';

/*Questão 47*/
SELECT id_categoria, COUNT(*) AS total_produtos
FROM produtos
GROUP BY id_categoria;

/* Questão 48*/
SELECT v.nome, SUM(pe.total) AS faturamento
FROM pedidos pe
INNER JOIN vendedores v ON pe.id_vendedor = v.id
GROUP BY v.nome;

/*Questão 49*/
SELECT c.nome AS cliente, pe.data, v.nome AS vendedor
FROM pedidos pe
INNER JOIN clientes c ON pe.id_cliente = c.id
INNER JOIN vendedores v ON pe.id_vendedor = v.id;

/* Questão 50*/
SELECT * FROM vendedores ORDER BY data_admissao ASC;

/* Questão 51*/
SELECT * FROM produtos WHERE id_categoria <> 1;

/* Questão 52*/
SELECT * FROM vendedores
WHERE percentual_ganho BETWEEN 0.10 AND 0.20;

/* Questão 53*/
SELECT AVG(total) AS Media_Faturamento FROM pedidos;

/* Questão 54*/
SELECT DISTINCT cidade FROM clientes;

/* Questão 55*/
SELECT * FROM pedidos
WHERE id_vendedor = 1;

/*Questão 56*/
SELECT SUM(preco * estoque) AS valor_total_estoque FROM produtos;

/* Questão 57*/
SELECT cidade, COUNT(*) AS total
FROM clientes
GROUP BY cidade
ORDER BY total DESC;

/* Questão 58*/
SELECT * FROM pedidos
WHERE data BETWEEN '2026-02-01' AND '2026-02-29'
AND total > 1000;

/* Questão 59*/
SELECT pe.*
FROM pedidos pe
INNER JOIN clientes c ON pe.id_cliente = c.id
WHERE c.nome LIKE '%S/A%';

/* Questão 60*/
SELECT c.nome AS cliente,
       p.nome AS produto,
       p.preco,
       v.nome AS vendedor
FROM pedidos pe
INNER JOIN clientes c ON pe.id_cliente = c.id
INNER JOIN vendedores v ON pe.id_vendedor = v.id
INNER JOIN produtos p;