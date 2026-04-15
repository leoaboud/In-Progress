/*******************************************************************************
  SCRIPT DE ESTUDO: CONTROLE DE FLUXO (LOOP, ITERATE E LEAVE)
  PADRONIZAÇÃO: VÍRGULAS À DIREITA E LÓGICA DE ACUMULAÇÃO EXPLÍCITA.
*******************************************************************************/

-- =============================================================================
-- 1. PROCEDURE DE ACUMULAÇÃO COM CONTROLE MANUAL
-- O ITERATE REINICIA O CICLO E O LEAVE INTERROMPE QUANDO A CONDIÇÃO É ATENDIDA.
-- =============================================================================

DELIMITER //

CREATE PROCEDURE PROC_ACUMULA_ITERATE(VALOR_TETO INT)
MAIN: BEGIN
      -- DECLARAÇÃO DE VARIÁVEIS PARA O CÁLCULO
      DECLARE CONTADOR INT DEFAULT 0;
      DECLARE SOMA     INT DEFAULT 0;

      -- VALIDAÇÃO DE ENTRADA
      IF VALOR_TETO < 1 THEN
            SELECT 'O VALOR DEVE SER MAIOR QUE ZERO' AS ERRO;
            LEAVE MAIN;
      END IF;

      -- INÍCIO DO BLOCO DE REPETIÇÃO
      TESTE: LOOP
            SET CONTADOR = CONTADOR + 1;
            SET SOMA = SOMA + CONTADOR;

            -- SE O CONTADOR AINDA NÃO ATINGIU O TETO, VOLTA AO TOPO DO LOOP
            IF CONTADOR < VALOR_TETO THEN
                  ITERATE TESTE;
            END IF;

            -- CASO CONTRÁRIO, SAI DO BLOCO DE REPETIÇÃO
            LEAVE TESTE;
      END LOOP TESTE;

      -- RETORNA O VALOR ACUMULADO FINAL
      SELECT SOMA AS RESULTADO_SOMA;
END //

DELIMITER ;


-- =============================================================================
-- 2. EXECUÇÃO E TESTE DO RETORNO
-- =============================================================================

-- CHAMA A PROCEDURE PARA CALCULAR A SOMA DE 1 ATÉ 7
-- RESULTADO ESPERADO: 28
CALL PROC_ACUMULA_ITERATE(7);