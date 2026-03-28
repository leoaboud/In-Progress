<<<<<<< Updated upstream
<<<<<<< HEAD
CREATE TABLE funcionario 
(
    matricula INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome 		VARCHAR(50) NOT NULL,
    sobrenome 	VARCHAR(50) NOT NULL,
    endereco 	VARCHAR(50),
    cidade 		VARCHAR(50),
    pais 		VARCHAR(25),
    data_nasc 	DATETIME
);
    
CREATE TABLE salario 
(
    matricula INT NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
=======
-- 1. Criação de Tabelas
CREATE TABLE funcionario (
    matricula   INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome        VARCHAR(50) NOT NULL,
    sobrenome   VARCHAR(50) NOT NULL,
    endereco    VARCHAR(50),
    cidade      VARCHAR(50),
    pais        VARCHAR(25),
    data_nasc   DATETIME
);
=======
-- 1. Criação de Tabelas
CREATE TABLE funcionario (
    matricula   INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome        VARCHAR(50) NOT NULL,
    sobrenome   VARCHAR(50) NOT NULL,
    endereco    VARCHAR(50),
    cidade      VARCHAR(50),
    pais        VARCHAR(25),
    data_nasc   DATETIME
);
>>>>>>> Stashed changes

CREATE TABLE salario (
    matricula   INT NOT NULL,
    salario     DECIMAL(10,2) NOT NULL,
<<<<<<< Updated upstream
>>>>>>> ca56ccc8eb09c3e9c9247331a67d597e260e971f
=======
>>>>>>> Stashed changes
    FOREIGN KEY (matricula) REFERENCES funcionarios(id)
);

CREATE TABLE audit_salario (
<<<<<<< Updated upstream
<<<<<<< HEAD
    transacao INT NOT NULL AUTO_INCREMENT,
    matricula INT NOT NULL,
    data_trans DATETIME NOT NULL,
    sal_antigo DECIMAL(10,2),
    sal_novo DECIMAL(10,2),
    usuario VARCHAR(20) NOT NULL,
=======
=======
>>>>>>> Stashed changes
    transacao   INT NOT NULL AUTO_INCREMENT,
    matricula   INT NOT NULL,
    data_trans  DATETIME NOT NULL,
    sal_antigo  DECIMAL(10,2),
    sal_novo    DECIMAL(10,2),
    usuario     VARCHAR(20) NOT NULL,
<<<<<<< Updated upstream
>>>>>>> ca56ccc8eb09c3e9c9247331a67d597e260e971f
=======
>>>>>>> Stashed changes
    PRIMARY KEY (transacao),
    FOREIGN KEY (matricula) REFERENCES funcionario(matricula)
);

<<<<<<< Updated upstream
<<<<<<< HEAD
-- CREATE IDEX
/*
=======
-- 2. Índices e Alterações de Estrutura
>>>>>>> Stashed changes
CREATE INDEX ix_func1 ON funcionario(data_nasc);
CREATE INDEX ix_func2 ON funcionario(cidade, pais);

ALTER TABLE funcionario ADD genero CHAR(1);
ALTER TABLE funcionario CHANGE genero sexo CHAR(1);
ALTER TABLE funcionario CHANGE sexo genero CHAR(1);

<<<<<<< Updated upstream
ALTER TABLE funcionario CHANGE genero sexo char(1);
=======
-- 2. Índices e Alterações de Estrutura
CREATE INDEX ix_func1 ON funcionario(data_nasc);
CREATE INDEX ix_func2 ON funcionario(cidade, pais);

ALTER TABLE funcionario ADD genero CHAR(1);
ALTER TABLE funcionario CHANGE genero sexo CHAR(1);
ALTER TABLE funcionario CHANGE sexo genero CHAR(1);

=======
>>>>>>> Stashed changes
RENAME TABLE funcionario TO pessoa;
RENAME TABLE pessoa TO funcionario;

ALTER TABLE senso ADD id INT;
ALTER TABLE senso MODIFY COLUMN id INT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE funcionario MODIFY COLUMN endereco VARCHAR(30);
ALTER TABLE funcionario DROP COLUMN genero;
ALTER TABLE senso ENGINE = MyISAM;

-- 3. Gerenciamento de Banco e Objetos
CREATE DATABASE teste;
DROP DATABASE teste;
DROP TABLE salario;

-- 4. Views (Visões)
CREATE VIEW v_funcionario AS 
    SELECT * FROM funcionarios;

ALTER VIEW v_funcionario AS 
    SELECT id, nome FROM funcionarios;

SELECT * FROM v_funcionario;
DROP VIEW v_funcionario;

-- 5. Manipulação de Índices
DROP INDEX ix_func1 ON funcionario;
CREATE INDEX ix_func1 ON funcionario (NOME);

-- 6. Stored Procedures
DELIMITER $$
CREATE PROCEDURE proc_quadrado (INOUT numero INT)
BEGIN
    SET numero = numero * numero;
END $$
DELIMITER ;

SET @valor = 5;
CALL proc_quadrado (@valor);
SELECT @valor;

DROP PROCEDURE proc_quadrado;

-- 7. Tabelas Temporárias
CREATE TEMPORARY TABLE tmp_funcionarios (
    id      INT,
    nome    VARCHAR(50),
    salario DECIMAL(50),
    setor   VARCHAR(30)
);

INSERT INTO tmp_funcionarios 
SELECT * FROM funcionario;

<<<<<<< Updated upstream
SELECT * FROM tmp_funcionarios;
>>>>>>> ca56ccc8eb09c3e9c9247331a67d597e260e971f
=======
SELECT * FROM tmp_funcionarios;
>>>>>>> Stashed changes
