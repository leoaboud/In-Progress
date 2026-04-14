/*******************************************************************************
  SCRIPT DE ESTUDO: TABELAS TEMPORÁRIAS (TEMPORARY TABLES)
  PADRONIZAÇÃO: VÍRGULAS À DIREITA E PERFORMANCE EM MEMÓRIA.
*******************************************************************************/

USE CURSO;

-- =============================================================================
-- 1. CRIAÇÃO MANUAL COM ENGINE MEMORY
-- O USO DO ENGINE 'MEMORY' ALOCA OS DADOS NA RAM PARA UM RESULTADO MAIS RÁPIDO.
-- =============================================================================

CREATE TEMPORARY TABLE TMP_SENSO1 
(
      ID INT PRIMARY KEY AUTO_INCREMENT,
      COD_MUN CHAR(7),
      NOME_MUN VARCHAR(80)
) ENGINE=MEMORY;

-- POPULA A TABELA TEMPORÁRIA COM O RESULTADO DE UMA CONSULTA NA TABELA REAL
INSERT INTO TMP_SENSO1 (COD_MUN, NOME_MUN)
SELECT COD_MUN, NOME_MUN 
FROM SENSO;

-- RETORNO DOS DADOS ARMAZENADOS TEMPORARIAMENTE
SELECT * FROM TMP_SENSO1;


-- =============================================================================
-- 2. CRIAÇÃO DINÂMICA (SELECT INTO)
-- CRIA A ESTRUTURA E COPIA OS DADOS AUTOMATICAMENTE PARA O RESULTADO.
-- =============================================================================

CREATE TEMPORARY TABLE TMP_SENSO2
SELECT * FROM SENSO;

-- VERIFICA O RESULTADO DA CÓPIA DINÂMICA
SELECT * FROM TMP_SENSO2;


-- =============================================================================
-- 3. ANÁLISE DE ESTRUTURA E METADADOS
-- O COMANDO EXPLAIN (OU DESCRIBE) MOSTRA COMO O MYSQL INTERPRETA O OBJETO.
-- =============================================================================

EXPLAIN TMP_SENSO1;
EXPLAIN TMP_SENSO2;
EXPLAIN SENSO;


-- =============================================================================
-- 4. MANUTENÇÃO E EXCLUSÃO
-- EMBORA O MYSQL AS EXCLUA NO FIM DA SESSÃO, É BOA PRÁTICA LIBERAR MEMÓRIA.
-- =============================================================================

-- REMOVE A TABELA PARA GERAR O RETORNO DE ESPAÇO NA MEMÓRIA/DISCO
DROP TEMPORARY TABLE IF EXISTS TMP_SENSO1;

-- CONSULTA A TABELA REMANESCENTE
SELECT * FROM TMP_SENSO2;