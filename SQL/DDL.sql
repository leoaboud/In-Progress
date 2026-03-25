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
    FOREIGN KEY (matricula) REFERENCES funcionarios(id)
);

CREATE TABLE audit_salario (
    transacao INT NOT NULL AUTO_INCREMENT,
    matricula INT NOT NULL,
    data_trans DATETIME NOT NULL,
    sal_antigo DECIMAL(10,2),
    sal_novo DECIMAL(10,2),
    usuario VARCHAR(20) NOT NULL,
    PRIMARY KEY (transacao),
    FOREIGN KEY (matricula) REFERENCES funcionario(matricula)
);

-- CREATE IDEX
/*
CREATE INDEX ix_func1 ON funcionario(data_nasc);

CREATE INDEX ix_func2 ON funcionario(cidade, pais);
*/

ALTER TABLE funcionario ADD genero char(1);

ALTER TABLE funcionario CHANGE genero sexo char(1);