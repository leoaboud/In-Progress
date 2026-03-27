-- 1. Preparação do ambiente
CREATE TABLE cadastro (
    nome  VARCHAR(50) NOT NULL,
    docto VARCHAR(20) NOT NULL
);

-- 2. Início do bloco transacional
START TRANSACTION;

    -- Primeiro registro e ponto de salvamento
    INSERT INTO cadastro VALUES ('Andre', '12341244');
    SAVEPOINT P1;

    -- Segundo registro e ponto de salvamento
    INSERT INTO cadastro VALUES ('Joao',  '12341248');
    SAVEPOINT P2;

    -- Terceiro registro e ponto de salvamento
    INSERT INTO cadastro VALUES ('Pedro', '12341246');
    SAVEPOINT P3;

-- Retorna o estado do banco para o P2 (Pedro é removido da memória)
ROLLBACK TO SAVEPOINT P2;

-- 3. Confirmação das alterações
-- Salva permanentemente apenas o que restou (Andre e Joao)
COMMIT;

-- 4. Verificação Final
-- O resultado mostrará apenas Andre e Joao.
SELECT * FROM cadastro;