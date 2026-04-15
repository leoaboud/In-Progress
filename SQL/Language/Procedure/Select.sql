/*******************************************************************************
  SCRIPT DE ESTUDO: STORED PROCEDURES COM JOIN E MENSAGENS
  PADRONIZAÇÃO: VÍRGULAS À DIREITA E CONSOLIDAÇÃO DE DADOS.
*******************************************************************************/

-- =============================================================================
-- 1. PROCEDURE PARA CONSULTA DE ESTOQUE E VALORES
-- UNE AS TABELAS DE MATERIAL E ESTOQUE PARA CALCULAR O VALOR TOTAL EM POSSE.
-- =============================================================================

DELIMITER //

CREATE PROCEDURE PROC_QTD_VAL (P_COD_MAT INT)
BEGIN
      -- RETORNA OS DADOS DO PRODUTO, QUANTIDADE E O CÁLCULO DO VALOR TOTAL
      SELECT A.NOME, A.CUSTO, B.QTD, 
            A.CUSTO * B.QTD AS VALOR_TOTAL
      FROM MATERIAL AS A
      INNER JOIN ESTOQUE AS B ON A.COD_MAT = B.COD_MAT
      WHERE A.COD_MAT = P_COD_MAT;

      -- RETORNA UMA MENSAGEM DE STATUS APÓS O PROCESSAMENTO
      SELECT 'CONSULTA REALIZADA COM SUCESSO' AS MSG;
END //

DELIMITER ;


-- =============================================================================
-- 2. EXECUÇÃO E TESTE DO RETORNO
-- =============================================================================

-- CHAMA A PROCEDURE PARA VISUALIZAR OS DADOS DO MATERIAL DE CÓDIGO 3
CALL PROC_QTD_VAL(3);