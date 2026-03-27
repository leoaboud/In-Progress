-- 1. Simulando Erro de Estrutura
-- O MySQL retornará erro porque o número de colunas (3 vs 2) não coincide
SELECT '1', '1', 'ABC'
UNION 
SELECT 'A', '2';

-- 2. Diferença entre UNION e UNION ALL (Lógica de Conjuntos)
-- UNION ALL: Mantém tudo, inclusive duplicatas
SELECT 'A' AS campo1, 'B' AS campo2
UNION ALL
SELECT 'A' AS campo3, 'B' AS campo4;

-- UNION: Remove linhas idênticas (atua como um DISTINCT global)
SELECT 'A' AS campo1, 'B' AS campo2
UNION
SELECT 'A' AS campo3, 'B' AS campo4;

-- 3. União de Dados Reais (Anos Diferentes)
-- Como os anos são diferentes ('2014' e '2013'), as linhas são únicas por natureza
SELECT ano, estado FROM curso.senso WHERE ano = '2014'
UNION 
SELECT ano, estado FROM curso.senso WHERE ano = '2013';

-- UNION ALL aqui terá o mesmo resultado visual que o UNION acima, 
-- mas é mais rápido por não processar a remoção de duplicatas
SELECT ano, estado FROM curso.senso WHERE ano = '2014'
UNION ALL
SELECT ano, estado FROM curso.senso WHERE ano = '2013';

-- 4. Impacto do UNION em Colunas Únicas
-- Se selecionarmos apenas 'estado', o UNION mostrará cada estado apenas uma vez
SELECT estado FROM curso.senso WHERE ano = '2014'
UNION
SELECT estado FROM curso.senso WHERE ano = '2013';

-- O UNION ALL repetirá os estados para cada registro encontrado nos dois anos
SELECT estado FROM curso.senso WHERE ano = '2014'
UNION ALL
SELECT estado FROM curso.senso WHERE ano = '2013';

-- 5. União Complexa com Ordenação Final
-- O ORDER BY deve vir sempre ao final do último SELECT e afeta o resultado todo
SELECT ano, estado, nome_mun, populacao
FROM   curso.senso
WHERE  ano = '2014' AND cod_uf = '11'
UNION
SELECT ano, estado, nome_mun, populacao
FROM   curso.senso
WHERE  ano = '2013' AND cod_uf = '11'
ORDER  BY nome_mun, ano;

-- Mesma consulta, mas permitindo duplicatas (caso existissem)
SELECT ano, estado, nome_mun, populacao
FROM   curso.senso
WHERE  ano = '2014' AND cod_uf = '11'
UNION ALL
SELECT ano, estado, nome_mun, populacao
FROM   curso.senso
WHERE  ano = '2013' AND cod_uf = '11'
ORDER  BY nome_mun, ano;