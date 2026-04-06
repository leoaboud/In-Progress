/*******************************************************************************
  SCRIPT DE ESTUDO: OPERADORES DE CONJUNTO (UNION & UNION ALL)
  PADRONIZAÇÃO: ALINHAMENTO DE SELECTS E LÓGICA DE UNIÃO DE CONJUNTOS.
*******************************************************************************/

-- 1. CONFIGURAÇÃO DE CONTEXTO
USE CURSO;

-- =============================================================================
-- 2. REGRAS DE ESTRUTURA (RESTRIÇÕES)
-- =============================================================================

/* PARA UM RETORNO VÁLIDO, O NÚMERO E TIPO DE COLUNAS DEVEM COINCIDIR.
   O EXEMPLO ABAIXO GERARIA UM RESULTADO DE ERRO POR DIVERGÊNCIA DE COLUNAS:
   
   SELECT '1', '1', 'ABC' 
   UNION 
   SELECT 'A', '2';      
*/


-- =============================================================================
-- 3. LÓGICA DE DUPLICATAS: UNION VS UNION ALL
-- =============================================================================

-- UNION ALL: REALIZA O EMPILHAMENTO TOTAL COM RETORNO DE TODAS AS LINHAS
SELECT 'A' AS CAMPO1, 'B' AS CAMPO2
UNION ALL
SELECT 'A' AS CAMPO1, 'B' AS CAMPO2;

-- UNION: COMPARA OS CONJUNTOS PARA GERAR UM RESULTADO SEM DUPLICATAS (DISTINCT)
SELECT 'A' AS CAMPO1, 'B' AS CAMPO2
UNION
SELECT 'A' AS CAMPO1, 'B' AS CAMPO2;


-- =============================================================================
-- 4. APLICAÇÃO EM DADOS REAIS (TABELA SENSO)
-- =============================================================================

-- REALIZA A UNIÃO DE ANOS DISTINTOS PARA UM RETORNO UNIFICADO DE DADOS
SELECT ANO, ESTADO FROM SENSO WHERE ANO = '2014'
UNION 
SELECT ANO, ESTADO FROM SENSO WHERE ANO = '2013';

-- UTILIZA UNION ALL PARA UM RESULTADO DE PROCESSAMENTO MAIS RÁPIDO
SELECT ANO, ESTADO FROM SENSO WHERE ANO = '2014'
UNION ALL
SELECT ANO, ESTADO FROM SENSO WHERE ANO = '2013';

-- AO REMOVER O ANO, O RESULTADO DO UNION AGRUPARÁ OS ESTADOS REPETIDOS
SELECT ESTADO FROM SENSO WHERE ANO = '2014'
UNION
SELECT ESTADO FROM SENSO WHERE ANO = '2013';


-- =============================================================================
-- 5. UNIÃO COMPLEXA COM ORDENAÇÃO (ORDER BY)
-- =============================================================================

-- COMBINA FILTROS ESPECÍFICOS PARA UM RETORNO DETALHADO DE MUNICÍPIOS
SELECT 
      ANO, 
      ESTADO, 
      NOME_MUN, 
      POPULACAO
      
FROM SENSO
WHERE ANO = '2014' AND COD_UF = '11'

UNION

SELECT 
      ANO, 
      ESTADO, 
      NOME_MUN, 
      POPULACAO
      
FROM SENSO
WHERE ANO = '2013' AND COD_UF = '11'

-- ORGANIZA O RESULTADO FINAL DE TODO O CONJUNTO UNIFICADO
ORDER BY NOME_MUN ASC, 
ANO DESC;