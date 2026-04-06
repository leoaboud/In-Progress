/*******************************************************************************
  SCRIPT DE ESTUDO: SUBQUERIES E JUNÇÕES (JOIN)
  PADRONIZAÇÃO: RELACIONAMENTOS COMPLEXOS E OTIMIZAÇÃO DE PERFORMANCE.
*******************************************************************************/

-- =============================================================================
-- 1. EXPLORAÇÃO SAKILA: RELACIONAMENTO ATORES E FILMES
-- =============================================================================

USE SAKILA;

-- FILTRA ATORES DE UM FILME ESPECÍFICO PARA UM RETORNO BASEADO EM SUBQUERY
SELECT 
      * FROM 
    ACTOR
WHERE 
    ACTOR_ID IN (
        SELECT ACTOR_ID FROM FILM_ACTOR 
        WHERE FILM_ID = 1
    );

-- GERA O RESULTADO DE FILMES DE UM ATOR ESPECÍFICO COM FILTRO DE RATING
SELECT 
      * FROM 
    FILM
WHERE 
    FILM_ID IN (
        SELECT FILM_ID FROM FILM_ACTOR 
        WHERE ACTOR_ID = 1
    )
    AND RATING = 'PG';

-- APLICA EXCLUSÃO LÓGICA PARA UM RETORNO DE FILMES QUE NÃO ATENDEM AO CRITÉRIO
SELECT 
      * FROM 
    FILM
WHERE 
    FILM_ID NOT IN (
        SELECT FILM_ID FROM FILM_ACTOR 
        WHERE ACTOR_ID = 1 
        AND RATING = 'PG'
    );


-- =============================================================================
-- 2. SUBQUERY ESCALAR (COLUNA CALCULADA)
-- =============================================================================

-- EXECUTA UMA CONTAGEM POR LINHA PARA RETORNO DA QUANTIDADE DE CIDADES
SELECT 
      A.COUNTRY_ID
    , A.COUNTRY
    , (SELECT COUNT(*) 
       FROM CITY AS B 
       WHERE A.COUNTRY_ID = B.COUNTRY_ID) AS QTDE_CIDADES
FROM 
    COUNTRY AS A;


-- =============================================================================
-- 3. EXPLORAÇÃO WORLD: COMPARAÇÃO SUBQUERY VS INNER JOIN
-- =============================================================================

USE WORLD;

-- VERSÃO A: SUBQUERIES (FILTRAGEM EM CAMADAS PARA O RESULTADO FINAL)
SELECT 
      A.COUNTRYCODE
    , SUM(A.POPULATION) AS TOTAL_POP
    , (SELECT B.NAME FROM COUNTRY AS B WHERE A.COUNTRYCODE = B.CODE) AS PAIS
FROM 
    CITY AS A
WHERE 
    A.COUNTRYCODE IN (
        SELECT C.COUNTRYCODE FROM COUNTRYLANGUAGE AS C 
        WHERE C.LANGUAGE = 'SPANISH'
    )
GROUP BY 
    A.COUNTRYCODE;

-- VERSÃO B: INNER JOIN (RESULTADO COM ALTA PERFORMANCE E UNIÃO FÍSICA)
-- O RETORNO É PROCESSADO ATRAVÉS DO CRUZAMENTO DIRETO DAS TABELAS
SELECT 
      A.COUNTRYCODE, 
      B.NAME AS PAIS, 
      SUM(A.POPULATION) AS TOTAL_POP
FROM CITY AS A
INNER JOIN COUNTRY AS B ON A.COUNTRYCODE = B.CODE 
INNER JOIN COUNTRYLANGUAGE AS C ON A.COUNTRYCODE = C.COUNTRYCODE
WHERE C.LANGUAGE = 'SPANISH'
GROUP BY A.COUNTRYCODE, 
B.NAME;