/*******************************************************************************
  PROJETO: MINI E-COMMERCE (MINI_EC) - FATURAMENTO E NFE
  OBJETIVO: GERAR NOTA FISCAL E REALIZAR BAIXA DEFINITIVA DE ESTOQUE
  PADRONIZAÇÃO: CONTROLE TRANSACIONAL E INTEGRIDADE DE INVENTÁRIO
*******************************************************************************/

USE MINI_EC;

DELIMITER //

CREATE PROCEDURE PROC_FAT_PEDIDO 
(
      IN  V_NUM_PED INT,
      OUT RESPOSTA  VARCHAR(255)
)
MAIN: BEGIN
      -- Declaração de Variáveis de Controle
      DECLARE COD_ERRO CHAR(5) DEFAULT '00000';
      DECLARE MSG      TEXT;
      DECLARE V_NUM_NF INT;
      DECLARE ROWS_INS INT;

      -- Handler para captura e reversão em caso de falha crítica
      DECLARE EXIT HANDLER FOR SQLEXCEPTION
      BEGIN
            GET DIAGNOSTICS CONDITION 1 
            @SQLSTATE = RETURNED_SQLSTATE, 
            @NROERRO = MYSQL_ERRNO, 
            @MSGERRO = MESSAGE_TEXT;
            
            ROLLBACK; -- Garante que nada seja faturado pela metade
            SET RESPOSTA = CONCAT("ERRO: ", @NROERRO, " (", @SQLSTATE, "): ", @MSGERRO);
      END;

      -- 1. VALIDAÇÃO: EVITAR DUPLICIDADE DE FATURAMENTO
      IF (SELECT COUNT(*) FROM PEDIDOS WHERE NUM_PEDIDO = V_NUM_PED 
          AND STATUS_PED IN ('F','T','E')) > 0 THEN
            SET RESPOSTA = 'Pedido Ja Faturado ou em Transito';
            LEAVE MAIN;
      END IF;

      -- 2. INÍCIO DO PROCESSO FISCAL
      START TRANSACTION;

      -- Gera o cabeçalho da Nota Fiscal
      INSERT INTO NOTA_FISCAL 
      (
            NUM_PED_REF, ID_CLIENTE, ID_ENDERECO, ID_PAGTO,
            TOTAL_PROD, TOTAL_FRETE, TOTAL_DESC, TOTAL_NF,
            DATA_NF, STATUS_NF, ID_USER
      )
      SELECT 
            NUM_PEDIDO, ID_CLIENTE, ID_ENDERECO, ID_PAGTO, 
            TOTAL_PROD, TOTAL_FRETE, TOTAL_DESC, TOTAL_PEDIDO, 
            NOW(), 'N', USER()
      FROM PEDIDOS
      WHERE NUM_PEDIDO = V_NUM_PED;

      SET V_NUM_NF = LAST_INSERT_ID();

      -- Gera os itens da Nota Fiscal (Replicação do Pedido)
      INSERT INTO NF_ITENS (NUM_NOTA, ID_PRODUTO, QTD, VAL_UNIT, DESCONTO, TOTAL)
      SELECT V_NUM_NF, ID_PRODUTO, QTD, VAL_UNIT, DESCONTO, TOTAL
      FROM PEDIDO_ITENS
      WHERE NUM_PEDIDO = V_NUM_PED;

      -- 3. ATUALIZAÇÃO DE STATUS E ESTOQUE
      -- Altera status do pedido (Dispara Trigger de Rastreabilidade)
      UPDATE PEDIDOS SET STATUS_PED = 'F' WHERE NUM_PEDIDO = V_NUM_PED;

      -- Baixa definitiva no estoque total e reserva
      UPDATE ESTOQUE E
      INNER JOIN PEDIDO_ITENS PI ON E.ID_PRODUTO = PI.ID_PRODUTO
      SET E.ESTOQUE_TOTAL = E.ESTOQUE_TOTAL - PI.QTD,
          E.ESTOQUE_RESERVADO = E.ESTOQUE_RESERVADO - PI.QTD
      WHERE PI.NUM_PEDIDO = V_NUM_PED;

      -- 4. FINALIZAÇÃO
      COMMIT;
      SET RESPOSTA = CONCAT('Faturamento Concluido com Sucesso! NF: ', V_NUM_NF);

END//

DELIMITER ;