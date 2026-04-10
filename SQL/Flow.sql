/*******************************************************************************
  SCRIPT DE ESTUDO: LÓGICA CONDICIONAL (IF, IFNULL, NULLIF, CASE)
  PADRONIZAÇÃO: VÍRGULAS À DIREITA E TRATAMENTO DE RESULTADOS.
*******************************************************************************/

-- =============================================================================
-- 1. FUNÇÃO IF (SINTAXE SIMPLIFICADA)
-- =============================================================================

SET @A := 45;
SET @B := 40;

-- COMPARA OS VALORES E GERA O RESULTADO 'TRUE' OU 'FALSE' NO RETORNO
SELECT IF(@A > @B, 'TRUE', 'FALSE') AS RESULTADO;

-- GERA O RESULTADO 'MAIOR' OU 'MENOR' BASEADO NA COMPARAÇÃO ARITMÉTICA
SELECT IF(@A > @B, 'MAIOR', 'MENOR') AS RESULTADO;

-- GERA O RESULTADO 'SIM' OU 'NÃO' PARA A CONDIÇÃO DE MENORIDADE
SELECT IF(@A < @B, 'SIM', 'NÃO') AS RESULTADO;


-- =============================================================================
-- 2. FUNÇÃO IFNULL
-- =============================================================================

-- RETORNA O PRIMEIRO VALOR POIS NÃO É NULO
SELECT IFNULL(1, 0) AS RETORNO;

-- RETORNA O SEGUNDO VALOR (0) COMO RESULTADO DA PRESENÇA DE UM NULO
SELECT IFNULL(NULL, 0) AS RETORNO;

USE WORLD;

-- SUBSTITUI ANOS DE INDEPENDÊNCIA NULOS PARA UM RESULTADO PADRONIZADO
SELECT NAME,INDEPYEAR,IFNULL(INDEPYEAR, 'SEM INDEP') AS RETORNO
FROM COUNTRY;


-- =============================================================================
-- 3. FUNÇÃO NULLIF
-- =============================================================================

-- RETORNA NULL SE OS VALORES FOREM IGUAIS NO RESULTADO
SELECT NULLIF(100, 100) AS RETORNO;

-- RETORNA O PRIMEIRO VALOR SE OS DADOS FOREM DIFERENTES
SELECT NULLIF(100, 10) AS RETORNO;

SELECT NULLIF('A', 10) AS RETORNO;
SELECT NULLIF('A', 'B') AS RETORNO;
SELECT NULLIF('A', 'A') AS RETORNO;


-- =============================================================================
-- 4. CASE WHEN (LÓGICA DE DATAS)
-- =============================================================================

SET @DATA := SYSDATE();

-- AVALIA A VARIÁVEL PARA GERAR O RESULTADO TEMPORAL NO RETORNO
SELECT @DATA,
      CASE WHEN @DATA = SYSDATE() THEN 'HOJE'
		   WHEN @DATA = SYSDATE() + 1 THEN 'AMANHÃ'
		   WHEN @DATA = SYSDATE() - 1 THEN 'ONTEM' END AS DIA;


-- =============================================================================
-- 5. CASE WHEN (CLASSIFICAÇÃO DEMOGRÁFICA - WORLD)
-- =============================================================================

-- CLASSIFICA OS PAÍSES EM FAIXAS PARA UM RESULTADO DE ANÁLISE DEMOGRÁFICA
SELECT A.NAME, A.POPULATION,
      CASE WHEN A.POPULATION < 1000000 THEN 'POP < 1M'
		   WHEN A.POPULATION >= 1000000 AND A.POPULATION < 50000000 THEN 'POP >= 1M E < 50M'
		   WHEN A.POPULATION >= 50000000 AND A.POPULATION < 100000000 THEN 'POP >= 50M E < 100M'
		   WHEN A.POPULATION >= 100000000 THEN 'POP >= 100M' END AS DEMOGRAF
FROM COUNTRY AS A 
ORDER BY A.CONTINENT,A.POPULATION DESC;

-- AGRUPA O TOTAL DE PAÍSES POR FAIXA PARA UM RETORNO ESTATÍSTICO
SELECT COUNT(*) AS QTD_PAISES,
      CASE WHEN A.POPULATION < 1000000 THEN 'POP < 1M'
		   WHEN A.POPULATION >= 1000000 AND A.POPULATION < 50000000 THEN 'POP >= 1M E < 50M'
		   WHEN A.POPULATION >= 50000000 AND A.POPULATION < 100000000 THEN 'POP >= 50M E < 100M'
		   WHEN A.POPULATION >= 100000000 THEN 'POP >= 100M' END AS DEMOGRAF
FROM COUNTRY AS A
GROUP BY DEMOGRAF;


-- =============================================================================
-- 6. CASE WHEN (CLASSIFICAÇÃO DE FILMES - SAKILA)
-- =============================================================================

USE SAKILA;

-- CATEGORIZA A DURAÇÃO DOS FILMES PARA GERAR O RESULTADO POR METRAGEM
SELECT COUNT(*) AS TOTAL,
      CASE WHEN A.LENGTH < 60 THEN 'CURTA METRAGEM'
		   WHEN A.LENGTH < 90 THEN 'MEDIA METRAGEM'
		   WHEN A.LENGTH >= 90 THEN 'LONGA METRAGEM' END AS METRAGEM
FROM FILM AS A
GROUP BY METRAGEM;