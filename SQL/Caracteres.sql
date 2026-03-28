-- ========================================================
-- 1. CÓDIGOS ASCII
-- ========================================================
SELECT ASCII('SQL') AS retorno;

-- 2. Retorna o código do 'S'
SELECT ASCII('S') AS retorno;

-- 3. Retorna o código do 'Q'
SELECT ASCII('Q') AS retorno;

-- 4. Retorna o código do 'L' AS retorno;
SELECT ASCII('L') AS retorno;

-- ========================================================
-- 2. LTRIM (Limpa espaços à esquerda)
-- ========================================================
-- Definindo a variável com espaços à esquerda
SET @frase_para_ltrim := '     Cinco espaços no inicio';

-- Comparativo entre o texto limpo e o texto original
SELECT 
    CONCAT('Texto sem espaço: ', LTRIM(@frase_para_ltrim)) AS retorno 
UNION ALL
SELECT 
    CONCAT('Texto com espaço: ', @frase_para_ltrim);

-- ========================================================
-- 3. RTRIM (Limpa espaços à direita)
-- ========================================================
-- Definindo a variável com espaços à direita
SET @frase_para_rtrim := 'Cinco espaços no final     ';

-- Comparativo entre o texto limpo e o texto original
SELECT 
    CONCAT(RTRIM(@frase_para_rtrim), 'Texto sem espaço: ') AS retorno 
UNION ALL
SELECT 
    CONCAT(@frase_para_rtrim, 'Texto com espaço: ');

-- ========================================================
-- 4. TRIM (Limpa ambos os lados)
-- ========================================================
-- Definindo a variável com espaços nas pontas
SET @frase_para_trim := '     Cinco espaços no final     ';

-- Comparativo entre o texto limpo e o texto original
SELECT 
    CONCAT('Antes sem espaço: ', TRIM(@frase_para_trim), 'Depois sem espaço: ') AS retorno 
UNION ALL
SELECT 
    CONCAT('Antes sem espaço: ', @frase_para_trim, 'Depois sem espaço: ');