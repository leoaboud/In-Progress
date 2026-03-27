-- Configuração do Banco
USE curso;

-- Concessão de Privilégios em Nível de Tabela
GRANT UPDATE ON funcionarios TO 'ALUNO'@'localhost';
GRANT UPDATE ON *.* TO 'ALUNO'@'localhost';

GRANT DELETE ON funcionarios TO 'ALUNO'@'localhost';
GRANT DELETE ON *.* TO 'ALUNO'@'localhost';

GRANT INSERT ON funcionarios TO 'ALUNO'@'localhost';

-- Concessão de Múltiplos Privilégios e Colunas Específicas
GRANT SELECT, INSERT        ON funcionarios TO 'ALUNO'@'localhost';
GRANT SELECT (nome, setor)  ON funcionarios TO 'ALUNO'@'localhost';

-- Concessão de Execução de Procedure
GRANT EXECUTE ON PROCEDURE TESTE.proc_quadrado TO 'ALUNO'@'localhost';

-- Concessão de Plenos Poderes
GRANT ALL PRIVILEGES ON funcionarios TO 'ALUNO'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'ALUNO'@'localhost';

-- Atualização e Conferência
FLUSH PRIVILEGES;
SELECT * FROM mysql.user WHERE User = 'ALUNO';

-- Revogação de Acessos
REVOKE UPDATE ON funcionarios FROM 'ALUNO'@'localhost'; 

FLUSH PRIVILEGES;
REVOKE ALL PRIVILEGES ON *.* FROM 'ALUNO'@'localhost';

-- Conferência Final
SELECT * FROM mysql.user WHERE User = 'ALUNO';