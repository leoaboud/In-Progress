
USE curso;

-- 1. Exploração inicial
SELECT * FROM senso;

-- 2. Médias de população
SELECT AVG(populacao) AS media 
FROM senso
WHERE ano = '2014';

SELECT estado, AVG(populacao) 
FROM senso
WHERE ano = '2014'
GROUP BY estado
ORDER BY 2 DESC;

SELECT a.cod_UF, b.sigla_uf, AVG(a.POPULACAO) AS media
FROM senso a 
INNER JOIN uf b ON a.cod_uf = b.cod_uf
WHERE a.ano = '2014'
GROUP BY a.cod_uf, b.sigla_uf
ORDER BY 3 DESC;

SELECT a.regiao, AVG(a.populacao) AS media
FROM senso a
WHERE ano = '2014'
GROUP BY a.regiao;

-- 3. Valores Mínimos
SELECT MIN(a.populacao) 
FROM senso a
WHERE ano = '2014';

SELECT a.estado, MIN(a.populacao) 
FROM senso a
WHERE ano = '2014'
GROUP BY a.estado;

-- 4. Valores Máximos
SELECT MAX(a.populacao) 
FROM senso a
WHERE a.ano = '2014';

SELECT a.estado, MAX(a.populacao) 
FROM senso a
WHERE a.ano = '2014'
GROUP BY a.estado
ORDER BY 2 DESC;

SELECT b.sigla_uf, MAX(a.POPULACAO) AS maximo
FROM senso a 
INNER JOIN uf b ON a.cod_uf = b.cod_uf
WHERE a.ano = '2014'
GROUP BY b.sigla_uf
ORDER BY 2;

-- 5. Somas e Totais
SELECT b.sigla_uf, SUM(a.POPULACAO) AS total_pop
FROM senso a
INNER JOIN uf b ON a.cod_uf = b.cod_uf
WHERE a.ano = '2014'
GROUP BY b.sigla_uf
ORDER BY 2;

SELECT a.cod_uf, SUM(a.populacao) 
FROM senso a
WHERE ano = '2014'
GROUP BY a.cod_uf
ORDER BY 2 DESC;

-- 6. Contagens (COUNT)
SELECT COUNT(*) 
FROM senso a 
WHERE a.ano = '2014';

SELECT a.ano, COUNT(*) AS qtd_cidades 
FROM senso a 
GROUP BY a.ano;

SELECT COUNT(DISTINCT cod_uf) FROM senso;
SELECT COUNT(cod_uf) FROM senso;

SELECT a.estado, COUNT(*) 
FROM senso a
WHERE ano = '2014'
GROUP BY a.estado
ORDER BY 2 DESC;

SELECT a.regiao, COUNT(*) 
FROM senso a
WHERE ano = '2014'
GROUP BY a.regiao
ORDER BY 2 DESC;

-- 7. Resumos Agrupados e Rollup
SELECT 
    AVG(a.populacao) AS media_pop,
    MIN(a.populacao) AS minimo_pop,
    MAX(a.populacao) AS maximo_pop,
    SUM(a.populacao) AS soma_pop,
    COUNT(*)         AS qtd_cidades
FROM senso a
WHERE ano = '2014';

-- Relatório por estado com Total Geral (Rollup)
SELECT 
    IFNULL(a.estado, 'TOTAL BRASIL') AS estado, 
    COUNT(*) AS qtd_municipios
FROM senso a 
WHERE a.ano = '2014'
GROUP BY a.estado WITH ROLLUP;

-- 8. Subqueries (Destaques por Estado)
SELECT a.estado, a.nome_mun, a.populacao
FROM (
    SELECT b.estado, MAX(populacao) AS populacao 
    FROM senso b
    WHERE ano = '2014'
    GROUP BY b.estado
) b
JOIN senso a ON a.estado = b.estado 
AND a.populacao = b.populacao
WHERE a.ano = '2014'
ORDER BY a.populacao DESC;

-- 9. Estatísticas de Dispersão e Crescimento
SELECT STDDEV(a.populacao) FROM senso a 
WHERE a.ano = '2014';
SELECT STDDEV_POP(populacao) FROM senso;

-- Comparativo Percentual 2010 vs 2014
SELECT 
    a.nome_mun,
    a.populacao AS senso_2010,
    b.populacao AS senso_2014,
    ((b.populacao - a.populacao) / a.populacao) * 100 AS crescimento_percentual
FROM senso a 
INNER JOIN senso b 
ON a.cod_mun = b.cod_mun
WHERE a.ano = '2010' 
AND b.ano = '2014';

-- Variância
SELECT VAR_POP(POPULACAO) FROM senso 
WHERE ano = '2014';

SELECT VAR_SAMP(POPULACAO) FROM senso;

-- ========================================================
-- BANCO DE DADOS: WORLD (AGREGAÇÃO DE LISTAS)
-- ========================================================
USE world;

-- Lista de populações por continente separadas por ponto e vírgula
SELECT Continent, 
       GROUP_CONCAT(DISTINCT Population ORDER BY Population
       DESC SEPARATOR ';') AS grupo 
FROM country 
GROUP BY Continent;

-- Lista de regiões por continente
SELECT Continent, 
       GROUP_CONCAT(DISTINCT Region ORDER BY Region 
       DESC SEPARATOR ';') AS regiao 
FROM country 
GROUP BY Continent;