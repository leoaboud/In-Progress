-- Seleção básica de contexto
USE curso;

-- Operadores Aritméticos e Cálculos de Porcentagem (Literais)
SELECT 10 + 5  AS soma;
SELECT 10 - 5  AS subtracao;
SELECT 10 * 5  AS multiplicacao;
SELECT 10 / 5  AS divisao;
SELECT 10 % 3  AS resto_modulo;

-- Aplicação de Acréscimo e Decréscimo de 10%
SELECT 
    nome_mun, 
    populacao,
    (populacao * 1.10) AS acrescimo_10,
    (populacao * 0.90) AS decrescimo_10
FROM senso 
WHERE ano = '2014';

-- Operadores Relacionais e Comparação
SELECT * FROM senso WHERE populacao >= 100000;
SELECT * FROM senso WHERE populacao <= 50000;
SELECT * FROM senso WHERE ano <> '2014';
SELECT * FROM senso WHERE ano != '2015';

-- Operadores Lógicos e Filtros de Texto
SELECT * FROM senso 
WHERE cod_uf = '35' AND ano = '2014';

SELECT * FROM senso 
WHERE cod_uf = '35' OR cod_uf = '33';

-- Tratamento de Valores Nulos e Padrões de Texto
SELECT * FROM senso WHERE populacao IS NOT NULL;

SELECT * FROM senso WHERE nome_mun LIKE 'A%';    -- Começa com A
SELECT * FROM senso WHERE nome_mun LIKE '%O';    -- Termina com O
SELECT * FROM senso WHERE nome_mun LIKE '%PA%';  -- Contém PA

-- Ordenação de Dados
SELECT * FROM senso 
ORDER BY nome_mun ASC;

SELECT * FROM senso 
ORDER BY populacao DESC;