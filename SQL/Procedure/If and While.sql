/*******************************************************************************
  SCRIPT DE ESTUDO: CONTROLE DE FLUXO (WHILE DO)
  PADRONIZAÇÃO: VÍRGULAS À DIREITA E MANUTENÇÃO DA ESTRUTURA ORIGINAL.
*******************************************************************************/

-- =============================================================================
-- 1. PROCEDURE COM LAÇO WHILE
-- A LÓGICA EXECUTA O BLOCO ENQUANTO A CONDIÇÃO FOR VERDADEIRA.
-- =============================================================================

DELIMITER //

CREATE PROCEDURE PROC_ACUMULA_W(VALOR_TETO INT)
MAIN: BEGIN
      -- DECLARAÇÃO DE VARIÁVEIS LOCAIS PARA O RESULTADO
      DECLARE CONTADOR INT DEFAULT 0;
      DECLARE SOMA     INT DEFAULT 0;

      -- VALIDAÇÃO DE SEGURANÇA: ENCERRA SE O VALOR FOR INVÁLIDO
      IF VALOR_TETO < 1 THEN
            SELECT 'O VALOR DEVE SER MAIOR QUE ZERO' AS ERRO;
            LEAVE MAIN;
      END IF;

      -- O LAÇO WHILE TESTA A CONDIÇÃO NO INÍCIO
      WHILE CONTADOR < VALOR_TETO DO
            SET CONTADOR = CONTADOR + 1;
            SET SOMA = SOMA + CONTADOR;
      END WHILE;

      -- RETORNA O RESULTADO DO SOMATÓRIO ACUMULADO
      SELECT SOMA AS RESULTADO_SOMA;
END //

DELIMITER ;


-- =============================================================================
-- 2. EXECUÇÃO E TESTE DO RETORNO
-- =============================================================================

-- CHAMA A PROCEDURE PARA GERAR O RESULTADO DE 1 ATÉ 5
CALL PROC_ACUMULA_W(5);