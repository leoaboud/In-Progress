/*******************************************************************************
  SCRIPT DE ESTUDO: STORED PROCEDURES (PARÂMETROS INOUT)
  PADRONIZAÇÃO: VÍRGULAS À DIREITA E MANUTENÇÃO DA LÓGICA ORIGINAL.
*******************************************************************************/

-- =============================================================================
-- 1. DEFINIÇÃO DA PROCEDURE COM PARÂMETRO INOUT
-- O TIPO 'INOUT' PERMITE QUE O VALOR SEJA MODIFICADO DENTRO DO PROCEDIMENTO
-- E O RESULTADO SEJA DEVOLVIDO DIRETAMENTE PARA A VARIÁVEL DE ORIGEM.
-- =============================================================================

DELIMITER //

CREATE PROCEDURE PROC_AUMENTO(
      INOUT VALOR DECIMAL(10,2),
      TAXA        DECIMAL(10,2)
)
BEGIN
      -- APLICA O CÁLCULO PARA GERAR O RESULTADO NA PRÓPRIA VARIÁVEL
      SET VALOR = VALOR + VALOR * TAXA / 100;
END //

DELIMITER ;


-- =============================================================================
-- 2. EXECUÇÃO E TESTE DO RETORNO
-- =============================================================================

-- INICIALIZA A VARIÁVEL DE SESSÃO PARA ARMAZENAR O RESULTADO
SET @VALOR = 30.00;

-- VERIFICA O VALOR ANTES DO PROCESSAMENTO
SELECT @VALOR AS VALOR_INICIAL;

-- CHAMA O PROCEDIMENTO PASSANDO A VARIÁVEL E O VALOR DA TAXA
-- O RETORNO DA OPERAÇÃO ATUALIZA O CONTEÚDO DE @VALOR
CALL PROC_AUMENTO(@VALOR, 25.00);

-- EXIBE O RESULTADO FINAL APÓS A EXECUÇÃO DA PROCEDURE
SELECT @VALOR AS RESULTADO_FINAL;