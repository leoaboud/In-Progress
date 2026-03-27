-- Define o banco de dados de trabalho
USE curso;

-- Criação da estrutura básica com chave primária auto-incremental
CREATE TABLE IF NOT EXISTS funcionarios (
    id      INT NOT NULL AUTO_INCREMENT,
    nome    VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2),
    setor   VARCHAR(30),
    PRIMARY KEY (id)
);

-- Retorna todos os registros da tabela
SELECT * FROM funcionarios;

-- Retorna colunas específicas utilizando apelido (alias) para o setor
SELECT 
    id, 
    nome, 
    salario, 
    setor AS depto
FROM funcionarios;

-- Inserção de registros completos (nome, salário e setor)
INSERT INTO funcionarios (nome, salario, setor) VALUES
('Joao',      1000.00, 'RH'), 
('Jose',      2000.00, 'Financeiro'), 
('Alexandre', 3000.00, 'TI');

-- Inserção de registros parciais (setor ficará como NULL)
INSERT INTO funcionarios (nome, salario) VALUES 
('Pedro',   1000.00), 
('Cleiton', 5000.00);

-- Modificação de um valor específico baseado no ID
UPDATE funcionarios 
SET    salario = salario * 1.5
WHERE  id = 2;

-- Atualização em massa para registros que não possuem ID igual a 1
UPDATE funcionarios 
SET    salario = salario * 1.5, 
       setor   = 'TI'
WHERE  id <> 1;

-- Exclusão física de um registro específico
DELETE FROM funcionarios
WHERE  id = 1;