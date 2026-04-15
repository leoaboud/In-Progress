/*******************************************************************************
  SCRIPT DE ESTUDO: TABUADA COM TABELA TEMPORÁRIA
  PADRONIZAÇÃO: VÍRGULAS À DIREITA E CONSOLIDAÇÃO DE DADOS.
*******************************************************************************/

-- =============================================================================
-- 1. PROCEDURE PARA GERAR TABUADA EM TABELA TEMPORÁRIA
-- ARMAZENA CADA LINHA DO CÁLCULO PARA UM RETORNO ÚNICO AO FINAL.
-- =============================================================================

DELIMITER //

CREATE PROCEDURE PROC_TABUADA_R_T(TABUADA INT)
BEGIN
      -- DECLARAÇÃO DE VARIÁVEIS DE CONTROLE
      DECLARE CONTADOR  INT DEFAULT 0;
      DECLARE RESULTADO INT DEFAULT 0;

      -- CRIAÇÃO DA TABELA TEMPORÁRIA PARA ARMAZENAR OS DADOS
      CREATE TEMPORARY TABLE TEMP_TAB 
      (
            RES VARCHAR(50)
      );

      -- LAÇO DE REPETIÇÃO PARA ALIMENTAR A TABELA
      REPEAT
            SET CONTADOR = CONTADOR + 1;
            SET RESULTADO = TABUADA * CONTADOR;
            
            -- INSERE O RESULTADO FORMATADO VIA CONCATENAÇÃO
            INSERT INTO TEMP_TAB
            SELECT CONCAT(TABUADA, ' X ', CONTADOR, ' = ', RESULTADO);
            
      UNTIL CONTADOR > 9
      END REPEAT;

      -- RETORNA O CONTEÚDO COMPLETO DA TABELA TEMPORÁRIA
      SELECT * FROM TEMP_TAB;

      -- LIMPEZA DA TABELA TEMPORÁRIA APÓS O USO
      DROP TEMPORARY TABLE IF EXISTS TEMP_TAB;
END //

DELIMITER ;


-- =============================================================================
-- 2. EXECUÇÃO E TESTE DO RETORNO
-- =============================================================================

-- GERA O RESULTADO CONSOLIDADO DA TABUADA DO 7
CALL PROC_TABUADA_R_T(7);