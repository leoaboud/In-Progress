/*******************************************************************************
  SCRIPT DE ESTUDO: CONTROLE DE FLUXO (ITERATE)
  PADRONIZAÇÃO: VÍRGULAS À DIREITA E FILTRAGEM DE RESULTADOS COM MOD.
*******************************************************************************/

-- =============================================================================
-- 1. PROCEDURE PARA FILTRAGEM DE NÚMEROS PARES
-- O COMANDO ITERATE DESVIA O FLUXO PARA O INÍCIO DO WHILE QUANDO O NÚMERO É ÍMPAR.
-- =============================================================================

DELIMITER //

CREATE PROCEDURE PROC_MOD_PAR (TETO INT)
MAIN: BEGIN
      DECLARE CONTADOR INT DEFAULT 0;

      ENQUANTO_PAR: WHILE CONTADOR < TETO DO
            SET CONTADOR = CONTADOR + 1;

            -- VERIFICA SE O NÚMERO É ÍMPAR (MOD RETORNA 1 PARA VERDADEIRO)
            IF MOD(CONTADOR, 2) THEN
                  -- PULA O RESTANTE DO CÓDIGO E VOLTA PARA O TOPO DO LAÇO
                  ITERATE ENQUANTO_PAR;
            END IF;

            -- ESTE SELECT SÓ SERÁ EXECUTADO SE O NÚMERO FOR PAR
            SELECT CONCAT(CONTADOR, ' É UM NÚMERO PAR, RESULTADO MOD: ', MOD(CONTADOR, 2)) AS VALOR;

      END WHILE;
END //

DELIMITER ;


-- =============================================================================
-- 2. EXECUÇÃO E TESTE DO RETORNO
-- =============================================================================

-- CHAMA A PROCEDURE PASSANDO O LIMITE DE VERIFICAÇÃO
-- RESULTADO: EXIBIRÁ APENAS AS MENSAGENS PARA OS NÚMEROS 2, 4, 6...
CALL PROC_MOD_PAR(10);