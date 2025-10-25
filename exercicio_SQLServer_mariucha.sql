
CREATE DATABASE AulaSQLServer_Mariucha;

USE AulaSQLServer_Mariucha;

-- 1. Crie as Seguintes Tabelas

-- Tabela Curso
CREATE TABLE Curso (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    total_creditos INT,
    carga_horaria INT
);

-- Tabela Professor
CREATE TABLE Professor (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);


-- Tabela Disciplina
CREATE TABLE Disciplina (
    id INT PRIMARY KEY IDENTITY(1,1),
    id_professor INT,
    id_curso INT,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT,
    creditos INT,
    FOREIGN KEY (id_professor) REFERENCES Curso(id),
    FOREIGN KEY (id_curso) REFERENCES Curso(id)
);

-- Tabela Aluno
CREATE TABLE Aluno (
    matricula INT PRIMARY KEY IDENTITY(100000,1),
    id_curso INT,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

-- Tabela intermediária para a relação N:N entre Aluno e Disciplina
CREATE TABLE Aluno_Disciplina (
    matricula_aluno INT,
    id_disciplina INT,
    PRIMARY KEY (matricula_aluno, id_disciplina),
    FOREIGN KEY (matricula_aluno) REFERENCES Aluno(matricula),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id)
);


SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'; 



SELECT name FROM sys.databases;


USE AulaSQLServer_Mariucha;

SELECT name AS table_name
FROM sys.tables;


-- Inserir na tabela Curso
INSERT INTO Curso (nome, total_creditos, carga_horaria) VALUES
('Computação', 120, 2000),
('Engenharia', 150, 2500),
('Matemática', 100, 1800),
('Física', 110, 1900),
('Química', 130, 2200);


--Inserir na tabela Professor
INSERT INTO Professor (nome, sobrenome, email) VALUES
('Carlos', 'Silva', 'carlos.silva@email.com'),
('Ana', 'Oliveira', 'ana.oliveira@email.com'),
('Pedro', 'Santos', 'pedro.santos@email.com'),
('Mariana', 'Costa', 'mariana.costa@email.com'),
('Lucas', 'Ferreira', 'lucas.ferreira@email.com');


--Inserir na tabela Disciplina
INSERT INTO Disciplina (id_professor, id_curso, nome, carga_horaria, creditos) VALUES
(1, 1, 'Aplicação de Banco de Dados', 100, 5),  -- Professor: Carlos Silva, Curso: Computação
(1, 1, 'Análise de Dados', 100, 5),           -- Professor: Carlos Silva, Curso: Computação
(2, 2, 'Engenharia de Software', 120, 6),     -- Professor: Ana Oliveira, Curso: Engenharia
(3, 3, 'Cálculo Avançado', 90, 4),            -- Professor: Pedro Santos, Curso: Matemática
(4, 4, 'Física Teórica', 110, 5);             -- Professor: Mariana Costa, Curso: Física


--Inserir na tabela Aluno
INSERT INTO Aluno (id_curso, nome, sobrenome, email) VALUES
(1, 'João', 'Silva', 'joao.silva@email.com'),       -- Matriculado em Computação
(1, 'Maria', 'Oliveira', 'maria.oliveira@email.com'), -- Matriculado em Computação
(2, 'Pedro', 'Santos', 'pedro.santos@email.com'),    -- Matriculado em Engenharia
(3, 'Ana', 'Costa', 'ana.costa@email.com'),          -- Matriculada em Matemática
(4, 'Lucas', 'Ferreira', 'lucas.ferreira@email.com'); -- Matriculado em Física



INSERT INTO Aluno_Disciplina (matricula_aluno, id_disciplina) VALUES
(100000, 1), -- João Silva em Aplicação de Banco de Dados
(100000, 2), -- João Silva em Análise de Dados
(100001, 1), -- Maria Oliveira em Aplicação de Banco de Dados
(100002, 3), -- Pedro Santos em Engenharia de Software
(100003, 4); -- Ana Costa em Cálculo Avançado


-- 3. Faça as seguintes queries
-- a. Faça uma query básica para cada tabela, mostrando todas as colunas; SEM JOIN

USE AulaSQLServer_Mariucha;

-- Query para Curso
SELECT * FROM Curso;

-- Query para Professor
SELECT * FROM Professor;

-- Query para Disciplina
SELECT * FROM Disciplina;

-- Query para Aluno
SELECT * FROM Aluno;

-- Query para Aluno_Disciplina
SELECT * FROM Aluno_Disciplina;


-- b. Liste todas as disciplinas de "Computação" usando apenas o ID do curso (SEM JOIN)
USE AulaSQLServer_Mariucha;

SELECT *
FROM Disciplina
WHERE id_curso = (SELECT id FROM Curso WHERE nome = 'Computação');

-- c. Liste as disciplinas em que cada aluno está matriculado, com matrícula e nome do aluno, nome do curso, e nome, créditos e carga horária da disciplina
USE AulaSQLServer_Mariucha;

SELECT 
    a.matricula,
    a.nome + ' ' + a.sobrenome AS nome_aluno,
    c.nome AS nome_curso,
    d.nome AS nome_disciplina,
    d.creditos,
    d.carga_horaria
FROM Aluno a
JOIN Aluno_Disciplina ad ON a.matricula = ad.matricula_aluno
JOIN Disciplina d ON ad.id_disciplina = d.id
JOIN Curso c ON d.id_curso = c.id;