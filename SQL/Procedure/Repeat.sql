/*******************************************************************************
  SCRIPT DE ESTUDO: TABUADA DINÂMICA (REPEAT...UNTIL)
  PADRONIZAÇÃO: VÍRGULAS À DIREITA E FORMATAÇÃO DE RESULTADOS.
*******************************************************************************/

-- =============================================================================
-- 1. PROCEDURE PARA GERAR TABUADA
-- UTILIZA UM LAÇO DE REPETIÇÃO PARA CALCULAR E EXIBIR O RETORNO LINHA A LINHA.
-- =============================================================================

DELIMITER //

CREATE PROCEDURE PROC_TABUADA_R(TABUADA INT)
BEGIN
      -- DECLARAÇÃO DE VARIÁVEIS PARA CONTROLE DO LAÇO E RESULTADO
      DECLARE CONTADOR  INT DEFAULT 0;
      DECLARE RESULTADO INT DEFAULT 0;

      REPEAT
            SET CONTADOR = CONTADOR + 1;
            SET RESULTADO = TABUADA * CONTADOR;
            
            -- RETORNA O RESULTADO FORMATADO DA OPERAÇÃO
            SELECT 
                  TABUADA AS NUMERO, 
                  ' X ' AS OPERADOR, 
                  CONTADOR AS MULTIPLICADOR, 
                  ' = ' AS IGUAL, 
                  RESULTADO AS RESULTADO;
                  
      -- A CONDIÇÃO DE PARADA OCORRE APÓS A DÉCIMA ITERAÇÃO
      UNTIL CONTADOR > 9
      END REPEAT;
END //

DELIMITER ;


-- =============================================================================
-- 2. EXECUÇÃO E TESTE DO RETORNO
-- =============================================================================

-- GERA O RESULTADO DA TABUADA DO 4
CALL PROC_TABUADA_R(4);