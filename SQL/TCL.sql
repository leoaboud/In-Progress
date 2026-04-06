/*******************************************************************************
  SCRIPT DE ESTUDO: CONTROLE DE TRANSAÇÕES (TCL)
  PADRONIZAÇÃO: GERENCIAMENTO DE ATOMICIDADE E PONTOS DE SALVAMENTO.
*******************************************************************************/

-- =============================================================================
-- 1. PREPARAÇÃO DO AMBIENTE (DDL)
-- =============================================================================

USE CURSO;

-- CRIA A TABELA PARA GERAR O RESULTADO DE TESTES TRANSACIONAIS
CREATE TABLE IF NOT EXISTS CADASTRO 
(
      NOME  VARCHAR(50) NOT NULL, 
      DOCTO VARCHAR(20) NOT NULL
);


-- =============================================================================
-- 2. BLOCO TRANSACIONAL (START TRANSACTION)
-- =============================================================================

-- INICIA A TRANSAÇÃO PARA QUE O RETORNO DOS DADOS FIQUE EM MEMÓRIA TEMPORÁRIA
START TRANSACTION;

    -- REALIZA A PRIMEIRA INSERÇÃO E CRIA UM MARCO PARA POSSÍVEL RETORNO
    INSERT INTO CADASTRO (NOME, DOCTO) VALUES ('ANDRE', '12341244');
    SAVEPOINT P1;

    -- REALIZA A SEGUNDA INSERÇÃO DEFININDO O RESULTADO DO SEGUNDO PONTO
    INSERT INTO CADASTRO (NOME, DOCTO) VALUES ('JOAO', '12341248');
    SAVEPOINT P2;

    -- REALIZA A TERCEIRA INSERÇÃO PARA TESTE DE DESCARTE DE RESULTADO
    INSERT INTO CADASTRO (NOME, DOCTO) VALUES ('PEDRO', '12341246');
    SAVEPOINT P3;


-- =============================================================================
-- 3. MANIPULAÇÃO DO FLUXO (ROLLBACK)
-- =============================================================================

-- DESFAZ AS ALTERAÇÕES PÓS-P2, ALTERANDO O RESULTADO FINAL DA TRANSAÇÃO
-- O RETORNO DO ESTADO DO BANCO VOLTA EXATAMENTE PARA O MOMENTO DO SAVEPOINT P2
ROLLBACK TO SAVEPOINT P2;


-- =============================================================================
-- 4. FINALIZAÇÃO (COMMIT)
-- =============================================================================

-- PERSISTE OS DADOS NO DISCO PARA QUE O RESULTADO SEJA DEFINITIVO
-- APÓS ESTE COMANDO, O RETORNO DA TABELA NÃO PODE MAIS SER DESFEITO
COMMIT;


-- =============================================================================
-- 5. VERIFICAÇÃO FINAL (DQL)
-- =============================================================================

-- CONSULTA OS DADOS PARA VALIDAR O RESULTADO APÓS O USO DO ROLLBACK E COMMIT
SELECT 
	NOME, 
    DOCTO 
FROM CADASTRO;