USE DB_03361B_MARIUCHA_AULA06;

SHOW TABLES; -- Para saber quais são as suas tabelas

CREATE TABLE ALUNO (
    matricula INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20)
);

INSERT INTO ALUNO (nome, email, telefone) VALUES
('João Silva', 'joao@email.com', '11912345678'),
('Maria Oliveira', 'maria@email.com', '11987654321');

CREATE TABLE PROFESSOR (
    matricula INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    titulacao VARCHAR(50)
);

INSERT INTO PROFESSOR (nome, email, titulacao) VALUES
('Carlos Souza', 'carlos@email.com', 'Doutor'),
('Ana Pereira', 'ana@email.com', 'Mestre');

CREATE TABLE DISCIPLINA (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_professor INT,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT,
    FOREIGN KEY (id_professor) REFERENCES PROFESSOR(matricula)
);

INSERT INTO DISCIPLINA (id_professor, nome, carga_horaria) VALUES
(1, 'Computação', 60),  -- o profº com matricula 1 é do Carlos Souza
(2, 'Matemática', 45);  -- o profº com matricula 2 é de Ana Pereira

CREATE TABLE ALUNO_DISCIPLINA (
    id_aluno INT,
    id_disciplina INT,
    PRIMARY KEY (id_aluno, id_disciplina),
    FOREIGN KEY (id_aluno) REFERENCES ALUNO(matricula),
    FOREIGN KEY (id_disciplina) REFERENCES DISCIPLINA(id)
);

INSERT INTO ALUNO_DISCIPLINA (id_aluno, id_disciplina) VALUES
(1, 1),  -- João Silva é da Computação
(2, 1),  -- Maria Oliveira é da Computação
(1, 2);  -- João Silva é na de Matemática

SELECT d.nome AS disciplina, p.nome AS professor
FROM DISCIPLINA d
JOIN PROFESSOR p ON d.id_professor = p.matricula;

SELECT a.nome AS aluno
FROM ALUNO a
JOIN ALUNO_DISCIPLINA ad ON a.matricula = ad.id_aluno
JOIN DISCIPLINA d ON ad.id_disciplina = d.id
WHERE d.nome = 'Computação';

SELECT a.nome AS aluno
FROM ALUNO a
LEFT JOIN ALUNO_DISCIPLINA ad ON a.matricula = ad.id_aluno
WHERE ad.id_aluno IS NULL;


-- Bora fazer o desafio?
SELECT d.nome AS disciplina, p.nome AS professor, COUNT(ad.id_aluno) AS total_alunos
FROM DISCIPLINA d
JOIN PROFESSOR p ON d.id_professor = p.matricula
LEFT JOIN ALUNO_DISCIPLINA ad ON d.id = ad.id_disciplina
GROUP BY d.id, d.nome, p.nome;

SELECT * FROM ALUNO;

SELECT * FROM ALUNO_DISCIPLINA;

SELECT * FROM DISCIPLINA;

SELECT * FROM PROFESSOR;