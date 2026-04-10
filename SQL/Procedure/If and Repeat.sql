/*******************************************************************************
  SCRIPT DE ESTUDO: CONTROLE DE FLUXO (REPEAT E LEAVE)
  PADRONIZAÇÃO: VÍRGULAS À DIREITA E LÓGICA DE ACUMULAÇÃO.
*******************************************************************************/

-- =============================================================================
-- 1. PROCEDURE COM LAÇO DE REPETIÇÃO (REPEAT)
-- A LÓGICA ACUMULA O VALOR DO CONTADOR ATÉ ATINGIR O TETO DEFINIDO.
-- =============================================================================

DELIMITER //

CREATE PROCEDURE PROC_ACUMULA(VALOR_TETO INT)
MAIN: BEGIN
      -- DECLARAÇÃO DE VARIÁVEIS LOCAIS PARA ARMAZENAR O RESULTADO
      DECLARE CONTADOR INT DEFAULT 0;
      DECLARE SOMA     INT DEFAULT 0;

      -- VALIDAÇÃO DE ENTRADA: O VALOR DEVE SER POSITIVO
      IF VALOR_TETO < 1 THEN
            SELECT 'O VALOR DEVE SER MAIOR QUE ZERO' AS ERRO;
            -- ENCERRA A EXECUÇÃO DA PROCEDURE USANDO O LABEL 'MAIN'
            LEAVE MAIN;
      END IF;

      -- INÍCIO DO LAÇO DE REPETIÇÃO
      REPEAT
            SET CONTADOR = CONTADOR + 1;
            SET SOMA = SOMA + CONTADOR;
      -- CONDIÇÃO DE PARADA: O LAÇO TERMINA QUANDO ATINGE O TETO
      UNTIL CONTADOR = VALOR_TETO
      END REPEAT;

      -- RETORNA O RESULTADO FINAL DO SOMATÓRIO
      SELECT SOMA AS RESULTADO_SOMA;
END //

DELIMITER ;


-- =============================================================================
-- 2. EXECUÇÃO E TESTE DO RETORNO
-- =============================================================================

-- CHAMA A PROCEDURE PARA CALCULAR A SOMA DE 1 ATÉ 5
-- RESULTADO ESPERADO: 15 (1+2+3+4+5)
CALL PROC_ACUMULA(5);