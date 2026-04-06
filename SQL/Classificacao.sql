/*******************************************************************************
  SCRIPT DE ESTUDO: RANKING COM VARIÁVEIS E PARTIÇÕES
  PADRONIZAÇÃO: NUMERAÇÃO DINÂMICA E LÓGICA DE ESTADO ANTERIOR.
*******************************************************************************/

-- =============================================================================
-- 1. CRIAÇÃO DA TABELA DE CAMPEONATO (DDL)
-- =============================================================================

-- CRIA A ESTRUTURA PARA GERAR O RESULTADO DE PONTUAÇÃO DOS TIMES
CREATE TABLE IF NOT EXISTS CAMPEONATO 
	(
      NOMETIME VARCHAR(30) NOT NULL, 
      PONTOS   INT NOT NULL
	);

-- =============================================================================
-- 2. INSERÇÃO DE DADOS (DML)
-- =============================================================================

-- ADICIONA OS REGISTROS PARA COMPOR O RESULTADO DO RANKING
INSERT INTO CAMPEONATO (NOMETIME, PONTOS) VALUES
      ('CORINTHIANS', 53), ('GREMIO', 43), ('SANTOS', 41), 
      ('PALMEIRAS', 40), ('FLAMENGO', 38), ('CRUZEIRO', 37), 
      ('BOTAFOGO', 37), ('ATLETICO-PR', 34), ('VASCO', 31), 
      ('ATLETICO-MG', 31), ('FLUMINENSE', 31), ('SPORT', 29), 
      ('AVAI', 29), ('CHAPECOENSE', 28), ('PONTE PRETA', 28), 
      ('BAHIA', 27), ('SAO PAULO', 27), ('CORITIBA', 27), 
      ('VITORIA', 26), ('ATLETICO-GO', 22);


-- =============================================================================
-- 3. RANKING SIMPLES COM VARIÁVEL
-- =============================================================================

-- INICIALIZA O CONTADOR PARA DEFINIR O RETORNO DA POSIÇÃO SEQUENCIAL
SET @POSICAO = 0;

SELECT @POSICAO := @POSICAO + 1 AS POSICAO , 
	NOMETIME, 
	PONTOS
FROM CAMPEONATO
ORDER BY PONTOS DESC;


-- =============================================================================
-- 4. QUERY DE RANKING COM SUBQUERY (PROCESSAMENTO EM CAMADAS)
-- =============================================================================

USE CURSO;
SET @POSICAO = 0;

-- A SUBQUERY 'PREQUERY' GERA O RESULTADO AGRUPADO ANTES DA NUMERAÇÃO
SELECT 
      @POSICAO := @POSICAO + 1 AS POSICAO
    , PREQUERY.ESTADO
    , PREQUERY.QTD_CIDADES
FROM 
    (SELECT @POSICAO := 0) AS VARIAVEL, 
    (SELECT ESTADO, 
    COUNT(COD_MUN) AS QTD_CIDADES
       FROM SENSO
       GROUP BY ESTADO
       ORDER BY COUNT(COD_MUN) DESC) AS PREQUERY;


-- =============================================================================
-- 5. RANKING PARTICIONADO (POR GRUPO/ESTADO)
-- =============================================================================

-- DEFINE VARIÁVEIS DE CONTROLE PARA O RETORNO DE RANKING POR CATEGORIA
SET @PREV := NULL;
SET @POS_GERAL := 0;
SET @POS_ESTADO := 0;

SELECT
      -- INCREMENTO GLOBAL PARA O RESULTADO GERAL DA CONSULTA
      @POS_GERAL := @POS_GERAL + 1 AS POSICAO_GERAL
      
      -- REINICIA O CONTADOR SEMPRE QUE O RETORNO DO ESTADO MUDA (LÓGICA DE PARTIÇÃO)
    , IF(@PREV <> ESTADO, @POS_ESTADO := 1, @POS_ESTADO := @POS_ESTADO + 1) AS POSICAO_ESTADO
    
      -- ATUALIZA A VARIÁVEL DE CONTROLE COM O RESULTADO DA LINHA ATUAL
    , @PREV := ESTADO AS ESTADO_CONTROLE
    , NOME_MUN
    , POPULACAO
FROM SENSO
ORDER BY ESTADO , POPULACAO DESC;