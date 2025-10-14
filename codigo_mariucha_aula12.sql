USE DB_03361B_MARIUCHA_AULA06;

CREATE TABLE Sapatos (
	id INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(50) NOT NULL,
    numero INT  NOT NULL,
    preco DECIMAL(10,2) NOT NULL
); -- AUTO_INCREMENT=42; Para inserir um número inicial do (ID) de acordo com o que queremos. Lembrar de tirar o ponto e virgula depois do parenteses.

INSERT INTO Sapatos (modelo, numero, preco)
VALUES
	('Tenis de corrida', 40, 199.90),
    ('Sapato social', 37, 236.99);
    
    DROP TABLE Sapatos; -- Ele apaga literalmente a tabela
    
    SELECT * FROM Sapatos;
    
    UPDATE Sapatos
    SET preco = 399.90
    WHERE id = 1;
    
    DELETE FROM Sapatos
    WHERE id = 101;
    
    DELETE FROM Sapatos
    WHERE id%2 = 0; -- Operador Módulo (%): calcula a divisão e retorna o seu resto.
    
    CREATE TABLE Padaria (
	id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL,
    unidade INT  NOT NULL,
    preco DECIMAL(10,2) NOT NULL
); -- AUTO_INCREMENT=42; Para inserir um número inicial do (ID) de acordo com o que queremos. Lembrar de tirar o ponto e virgula depois do parenteses.

INSERT INTO Padaria (tipo, unidade, preco)
VALUES
	('Bolo de Fubá', 10, 13.90),
    ('Coxinha', 20, 7.90),
    ('Paõ de Manteiga', 30, 9.90),
    ('Biscoito de Polvilho', 20, 6.99);
    
    DROP TABLE Padaria; -- Ele apaga literalmente a tabela
    
    SELECT * FROM Padaria;
    
    UPDATE Padaria
    SET preco = 3.90
    WHERE id = 4;
    
    DELETE FROM Padaria
    WHERE id = 2; -- Aqui será para Apagar na tabela o id que escolher
    
    DELETE FROM Padaria
    WHERE id%2 = 0; -- Operador Módulo (%): calcula a divisão e retorna o seu resto.