/*******************************************************************************
  SCRIPT DE ESTUDO: OBJETOS AVANÇADOS, PROCEDURES E MANUTENÇÃO (DDL/DQL)
  Objetivo: Praticar Relacionamentos, Índices, Views, Procedures e Tabelas Temporárias.
*******************************************************************************/

-- =============================================================================
-- 1. ESTRUTURA DE TABELAS E RELACIONAMENTOS (FK)
-- Descrição: Criação de tabelas com integridade referencial.
-- =============================================================================

CREATE TABLE IF NOT EXISTS funcionario 
(
    matricula   INT NOT NULL AUTO_INCREMENT, 
    nome      VARCHAR(50) NOT NULL, 
    sobrenome VARCHAR(50) NOT NULL, 
    endereco  VARCHAR(50), 
    cidade    VARCHAR(50), 
    pais      VARCHAR(25), data_nasc DATETIME, 
PRIMARY KEY (matricula)
);

CREATE TABLE IF NOT EXISTS salario 
(
    matricula   INT NOT NULL, 
    salario   DECIMAL(10, 2) NOT NULL, 
    FOREIGN KEY (matricula) REFERENCES funcionario(matricula)
);

CREATE TABLE IF NOT EXISTS audit_salario 
(
    transacao   INT NOT NULL AUTO_INCREMENT, 
    matricula INT NOT NULL, 
    data_trans DATETIME NOT NULL, 
    sal_antigo DECIMAL(10, 2), 
    sal_novo   DECIMAL(10, 2), usuario    VARCHAR(20) NOT NULL, 
    PRIMARY KEY (transacao), 
    FOREIGN KEY (matricula) REFERENCES funcionario(matricula)
);


-- =============================================================================
-- 2. MANUTENÇÃO DE ESTRUTURA (ALTER & RENAME)
-- Descrição: Modificações em colunas, tipos de dados e nomes de objetos.
-- =============================================================================

-- Adição e alteração de colunas
ALTER TABLE funcionario ADD genero CHAR(1);
ALTER TABLE funcionario CHANGE genero sexo CHAR(1);  -- Renomeia a coluna
ALTER TABLE funcionario CHANGE sexo genero CHAR(1);  -- Retorna ao original
ALTER TABLE funcionario MODIFY COLUMN endereco VARCHAR(30); -- Altera o tipo/tamanho
ALTER TABLE funcionario DROP COLUMN genero;           -- Remove a coluna

-- Renomear tabelas
RENAME TABLE funcionario TO pessoa;
RENAME TABLE pessoa TO funcionario;

-- Alteração de Engine (Motor de Armazenamento)
-- MyISAM é otimizado para leitura, enquanto InnoDB (padrão) suporta transações.
ALTER TABLE senso ENGINE = MyISAM;


-- =============================================================================
-- 3. GERENCIAMENTO DE ÍNDICES (INDEX)
-- Descrição: Melhora a performance de busca em colunas muito consultadas.
-- =============================================================================

CREATE INDEX ix_func1 ON funcionario(data_nasc);
CREATE INDEX ix_func2 ON funcionario(cidade, pais); -- Índice composto

-- Remoção e recriação de índice
DROP INDEX ix_func1 ON funcionario;
CREATE INDEX ix_func1 ON funcionario(nome);


-- =============================================================================
-- 4. VISÕES (VIEWS)
-- Descrição: Tabelas virtuais baseadas em uma consulta SELECT para segurança/atalho.
-- =============================================================================

CREATE OR REPLACE VIEW v_funcionario AS 
    SELECT matricula, nome, sobrenome FROM funcionario;

-- Consulta na View como se fosse uma tabela real
SELECT * FROM v_funcionario;

-- Remoção da View
DROP VIEW IF EXISTS v_funcionario;


-- =============================================================================
-- 5. PROGRAMAÇÃO SQL: STORED PROCEDURES
-- Descrição: Blocos de código armazenados para execução de lógica no servidor.
-- =============================================================================

DELIMITER $$

CREATE PROCEDURE proc_quadrado (INOUT numero INT)
BEGIN
    -- Realiza o cálculo e armazena de volta na variável
    SET numero = numero * numero;
END $$

DELIMITER ;

-- Execução da Procedure
SET @valor = 5;
CALL proc_quadrado(@valor);
SELECT @valor AS resultado_quadrado;

DROP PROCEDURE IF EXISTS proc_quadrado;


-- =============================================================================
-- 6. TABELAS TEMPORÁRIAS
-- Descrição: Tabelas que existem apenas durante a sessão atual do usuário.
-- =============================================================================

CREATE TEMPORARY TABLE tmp_funcionarios (
    id      INT
    , nome    VARCHAR(50)
    , salario DECIMAL(10, 2)
    , setor   VARCHAR(30)
);

-- Inserção massiva baseada em uma consulta
INSERT INTO tmp_funcionarios (id, nome)
SELECT matricula, nome FROM funcionario;

SELECT * FROM tmp_funcionarios;


-- =============================================================================
-- 7. GERENCIAMENTO DE BANCO DE DADOS
-- =============================================================================

CREATE DATABASE IF NOT EXISTS teste;
DROP DATABASE IF EXISTS teste;
DROP TABLE IF EXISTS salario;