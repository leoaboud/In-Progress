/*******************************************************************************
  SCRIPT DE ESTUDO: FUNÇÕES MATEMÁTICAS NATIVAS
  PADRONIZAÇÃO: VÍRGULAS À DIREITA E EXPLICAÇÃO DE RESULTADOS ARITMÉTICOS.
*******************************************************************************/

-- =============================================================================
-- 1. FUNÇÃO ABS (VALOR ABSOLUTO)
-- RETORNA O VALOR POSITIVO INDEPENDENTE DO SINAL ORIGINAL.
-- =============================================================================

SELECT 
      ABS(-1.0) AS VAL1,
      ABS(0.0) AS VAL2,
      ABS(1.0) AS VAL3,
      ABS(-9.0) AS VAL4,
      ABS(-5.4) AS VAL5,
      ABS(5.4) AS VAL6;


-- =============================================================================
-- 2. FUNÇÃO RAND (NÚMEROS ALEATÓRIOS)
-- GERA UM RESULTADO DECIMAL ALEATÓRIO ENTRE 0 E 1.
-- =============================================================================

SELECT RAND() AS ALEATORIO
UNION
SELECT RAND()
UNION
SELECT RAND()
UNION
SELECT RAND();


-- =============================================================================
-- 3. FUNÇÃO ROUND (ARREDONDAMENTO)
-- RETORNA O VALOR ARREDONDADO COM BASE NA CASA DECIMAL INFORMADA.
-- =============================================================================

SELECT 
      ROUND(123.9994, 3) AS RESULTADO1, -- MANTÉM 999 (4 < 5)
      ROUND(123.9995, 3) AS RESULTADO2; -- SOBE PARA 124.000 (5 >= 5)

-- EXEMPLOS DE ARREDONDAMENTO EM NÍVEL DE DEZENA E CENTENA (VALORES NEGATIVOS)
SELECT ROUND(123.4545, 2) AS RETORNO
UNION ALL
SELECT ROUND(123.45, -2) -- RESULTADO: 100
UNION ALL
SELECT ROUND(193.45, -2) -- RESULTADO: 200
UNION ALL
SELECT ROUND(249.45, -2) -- RESULTADO: 200
UNION ALL
SELECT ROUND(251.45, -2); -- RESULTADO: 300

SELECT ROUND(150.75, 0) AS ZERO_CASAS
UNION ALL
SELECT ROUND(150.75, 1) AS UMA_CASA;


-- =============================================================================
-- 4. FUNÇÃO TRUNCATE (TRUNCAMENTO)
-- DIFERENTE DO ROUND, O TRUNCATE APENAS CORTA OS NÚMEROS SEM ARREDONDAR.
-- =============================================================================

SELECT TRUNCATE(1.223, 2) AS RESULTADO;
SELECT TRUNCATE(122, -2) AS RESULTADO; -- ZERA AS DUAS ÚLTIMAS CASAS (100)
SELECT TRUNCATE(10.28 * 100, 0) AS RESULTADO;
SELECT TRUNCATE(10.28 * 100, 3) AS RESULTADO;


-- =============================================================================
-- 5. RAIZ QUADRADA (SQRT) E SINAL (SIGN)
-- =============================================================================

-- SQRT: RETORNA A RAIZ QUADRADA. VALORES NEGATIVOS RESULTAM EM NULL.
SELECT SQRT(4) AS RESULTADO;
SELECT SQRT(20) AS RESULTADO;
SELECT SQRT(-16) AS RESULTADO_NULO;

-- SIGN: RETORNA O RESULTADO DO SINAL (-1 PARA NEGATIVO, 0 PARA ZERO, 1 PARA POSITIVO).
SELECT SIGN(-234) AS NEGATIVO;
SELECT SIGN(0) AS ZERO;
SELECT SIGN(234) AS POSITIVO;


-- =============================================================================
-- 6. POTÊNCIA (POW) E RESTO DA DIVISÃO (MOD)
-- =============================================================================

-- POW: ELEVA O PRIMEIRO NÚMERO À POTÊNCIA DO SEGUNDO.
SELECT POW(2, 2) AS RESULTADO;
SELECT POW(3, 2) AS RESULTADO;
SELECT POW(2, -2) AS RESULTADO;

-- MOD: RETORNA O RESTO DA DIVISÃO INTEIRA ENTRE DOIS NÚMEROS.
SELECT MOD(5, 2) AS RESTO_1;
SELECT MOD(27, 3) AS RESTO_0;
SELECT MOD(20, 3) AS RESTO_2;