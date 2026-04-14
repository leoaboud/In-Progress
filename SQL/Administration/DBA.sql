/*******************************************************************************
  SCRIPT DE ESTUDO: VOLUMETRIA E OCUPAÇÃO DE DISCO (METADADOS)
  PADRONIZAÇÃO: VÍRGULAS À DIREITA E CÁLCULO DE MB.
*******************************************************************************/

USE CURSO;

-- =============================================================================
-- 1. ANÁLISE DETALHADA POR TABELA
-- EXIBE O TAMANHO DE DADOS, ÍNDICES E QUANTIDADE DE LINHAS.
-- =============================================================================

SELECT 
      TABLE_SCHEMA AS DB, 
      TABLE_NAME AS TABELA, 
      ROUND(DATA_LENGTH / 1024 / 1024, 2) AS TAMANHO_TABELA_MB, 
      ROUND(INDEX_LENGTH / 1024 / 1024, 2) AS TAMANHO_INDICE_MB, 
      TABLE_ROWS AS LINHAS, 
      ENGINE
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'CURSO'
ORDER BY 3 DESC;


-- =============================================================================
-- 2. ANÁLISE GLOBAL POR BANCO DE DADOS (DB)
-- CONSOLIDA O TAMANHO TOTAL (DADOS + ÍNDICES) DE CADA DATABASE NA INSTÂNCIA.
-- =============================================================================

SELECT 
      TABLE_SCHEMA AS NOME_DB, 
      ROUND(SUM(DATA_LENGTH + INDEX_LENGTH) / 1024 / 1024, 2) AS DB_SIZE_MB
FROM 
      INFORMATION_SCHEMA.TABLES
GROUP BY 
      TABLE_SCHEMA
ORDER BY 
      2 DESC;