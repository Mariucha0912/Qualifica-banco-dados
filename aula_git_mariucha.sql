CREATE DATABASE	DB_03361B_MARIUCHA_AULA06;
USE DB_03361B_MARIUCHA_AULA06;

-- "CRIE" "TABELA" [com o nome] CLIENTE [e atributos] (...);
CREATE TABLE Mercado (
	-- ... [atributo de nome] id_cliente [do tipo] INTEIRO [que é] IDENTIFICADOR ÚNICO AUTOINCREMENTÁVEL
	id_mercado INT PRIMARY KEY AUTO_INCREMENT,
    -- ... [atributo de nome] nome [do tipo] TEXTO DE 250 CARAC. [que é] NÃO NULO
    frutas VARCHAR(250) NOT NULL,
    -- ... [atributo de nome] cpf [do tipo] TEXTO DE 11 CARAC.
    leite VARCHAR(250)
);

-- "INSIRA" "NA" [tabela] Cliente [nos atributos] (...) [os] "VALORES" (...);
INSERT INTO Papelaria (caderno, caneta) VALUES
	("Universitário", "azul");
    
INSERT INTO Mercado (frutas, leite) VALUES
	("Maça", "Longa Vida"),
    ("Banana", "Parmalat"),
    ("Melão", "Pura Mais"),
    ("Goiaba", "Mais Sabor");
    
INSERT INTO Cliente (nome, cpf) VALUES
	("Roberto", "12345678912"),
    ("Roberto", "12345678912"),
    ("Roberto", "12345678912");
    
INSERT INTO Cliente (nome, cpf) VALUES
	("Aurora Santos", "12345678913");

-- "SELECIONE" *TODOS OS ATRIBUTOS* "DA" [tabela] Cliente;
SELECT * FROM Papelaria;

-- "SELECIONE" [somente os atributos] nome, cpf "DA" [tabela] Cliente;
SELECT nome, cpf FROM Cliente;	

-- "SELECIONE" [somente os atributos] nome, cpf "DA" [tabela] Cliente "LIMITADOS A" 3 [registros];
SELECT nome, cpf FROM Cliente LIMIT 3;

-- "SELECIONE" *TODOS OS ATRIBUTOS* "DA" [tabela] Cliente "EM ORDEM DE" id_cliente "DESCENDENTE";
SELECT * FROM Cliente ORDER BY id_cliente DESC;

-- "SELECIONE" *TODOS OS ATRIBUTOS* "DA" [tabela] Cliente "EM ORDEM DE" nome "ASCENDENTE";
SELECT * FROM Cliente ORDER BY nome ASC;

-- "SELECIONE" *TODOS OS ATRIBUTOS* "DA" [tabela] Cliente "EM ORDEM DE" nome "DESCENDENTE";
SELECT * FROM Cliente ORDER BY nome DESC;

-- "SELECIONE" *TODOS OS ATRIBUTOS* "DA" [tabela] Cliente "EM ORDEM DE" nome "DESCENDENTE";
SELECT * FROM Cliente ORDER BY nome DESC LIMIT 3;