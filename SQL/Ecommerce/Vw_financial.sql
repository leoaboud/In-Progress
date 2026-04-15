/*******************************************************************************
  PROJETO: MINI E-COMMERCE (MINI_EC) - INTELIGÊNCIA FINANCEIRA
  OBJETIVO: PROJEÇÃO DE PARCELAS E VENCIMENTOS (CONTAS A RECEBER)
  PADRONIZAÇÃO: VIEWS PARA SIMPLIFICAÇÃO DE RELATÓRIOS
*******************************************************************************/

USE MINI_EC;

-- Criação da View para gestão de fluxo de caixa
CREATE OR REPLACE VIEW V_FINANCEIRO AS
SELECT A.NUM_NOTA,
       A.ID_CLIENTE,
       D.NOME AS CLIENTE,
       A.ID_PAGTO,
       B.DESCRICAO AS FORMA_PAGTO,
       B.TIPO,
       A.TOTAL_NF,
       A.DATA_NF,
       C.PARCELA,
       C.PERCENTUAL,
       C.DIAS,
      -- Cálculo do valor monetário da parcela com base no percentual
      CAST(A.TOTAL_NF / 100 * C.PERCENTUAL AS DECIMAL(10,2)) AS VALOR_PARCELA,
      -- Projeção da data de vencimento somando os dias da condição de pagamento
      CAST(DATE_ADD(A.DATA_NF, INTERVAL C.DIAS DAY) AS DATE) AS VENCIMENTO
FROM NOTA_FISCAL A
      INNER JOIN COND_PAGTO B ON A.ID_PAGTO = B.ID_PAGTO
      INNER JOIN COND_PAGTO_DET C ON A.ID_PAGTO = C.ID_PAGTO
      INNER JOIN CLIENTES D ON A.ID_CLIENTE = D.ID_CLIENTE
WHERE A.STATUS_NF = 'N'; -- Apenas Notas Fiscais Normais (ignora canceladas/devolvidas)

-- Exemplo de uso para o financeiro
SELECT * FROM V_FINANCEIRO ORDER BY VENCIMENTO;