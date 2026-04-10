/*******************************************************************************
  SCRIPT DE ESTUDO: CONTROLE DE FLUXO (LOOP E LEAVE)
  PADRONIZAÇÃO: VÍRGULAS À DIREITA E CONTROLE EXPLÍCITO DE ITERAÇÃO.
*******************************************************************************/

-- =============================================================================
-- 1. PROCEDURE COM ESTRUTURA LOOP
-- UTILIZA UM RÓTULO (LABEL) PARA PERMITIR A SAÍDA MANUAL DO LAÇO.
-- =============================================================================

DELIMITER //

CREATE PROCEDURE PROC_TABUADA_1(TABUADA INT)
BEGIN
      -- DECLARAÇÃO DE VARIÁVEIS DE APOIO
      DECLARE CONTADOR  INT DEFAULT 0;
      DECLARE RESULTADO INT DEFAULT 0;

      -- INÍCIO DO BLOCO DE REPETIÇÃO COM RÓTULO
      LOOP_TABUADA: LOOP
            
            SET CONTADOR = CONTADOR + 1;
            SET RESULTADO = TABUADA * CONTADOR;
            
            -- INSERE O RESULTADO FORMATADO NA TABELA DE APOIO
            INSERT INTO TEMP_TAB
            SELECT CONCAT(TABUADA, ' X ', CONTADOR, ' = ', RESULTADO);

            -- CONDIÇÃO DE SAÍDA: QUANDO O CONTADOR ULTRAPASSA O LIMITE
            IF CONTADOR > 9 THEN
                  -- INTERROMPE O LOOP ESPECÍFICO PELO NOME DO RÓTULO
                  LEAVE LOOP_TABUADA;
            END IF;

      END LOOP LOOP_TABUADA;
      
END //

DELIMITER ;


-- =============================================================================
-- 2. EXECUÇÃO E TESTE DO RETORNO
-- =============================================================================

-- CHAMA A PROCEDURE PARA GERAR O RESULTADO DA TABUADA DO 7
CALL PROC_TABUADA_1(7);