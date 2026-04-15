/*******************************************************************************
  PROJETO: MINI E-COMMERCE (MINI_EC) - AUTOMAÇÃO COM TRIGGERS
  OBJETIVO: RASTREABILIDADE AUTOMÁTICA DE STATUS DE PEDIDOS
  PADRONIZAÇÃO: DELIMITER E REGISTRO DE LOG (USER/TIME)
*******************************************************************************/

USE MINI_EC;

-- =============================================================================
-- 1. TRIGGER: REGISTRO INICIAL (AFTER INSERT)
-- DISPARA APÓS A CRIAÇÃO DE UM NOVO PEDIDO.
-- =============================================================================

DELIMITER //

CREATE TRIGGER TGR_INSERT_STATUS_PED AFTER INSERT
ON PEDIDOS
FOR EACH ROW
BEGIN
      -- Registra o primeiro status na tabela de rastreabilidade
      INSERT INTO RASTREABILIDADE (
            NUM_PEDIDO, 
            STATUS_PED, 
            DATA_HORA, 
            ID_USER
      ) VALUES (
            NEW.NUM_PEDIDO, 
            NEW.STATUS_PED, 
            NOW(), 
            USER()
      );
END//

DELIMITER ;


-- =============================================================================
-- 2. TRIGGER: HISTÓRICO DE MUDANÇAS (AFTER UPDATE)
-- DISPARA SEMPRE QUE O STATUS DO PEDIDO É ATUALIZADO (EX: DE FATURADO PARA ENTREGUE).
-- =============================================================================

DELIMITER //

CREATE TRIGGER TGR_UPDATE_STATUS_PED AFTER UPDATE
ON PEDIDOS
FOR EACH ROW
BEGIN
      -- Só insere no log se houver mudança real no status do pedido
      IF OLD.STATUS_PED <> NEW.STATUS_PED THEN
            INSERT INTO RASTREABILIDADE ( NUM_PEDIDO, STATUS_PED, DATA_HORA, ID_USER ) 
            VALUES ( NEW.NUM_PEDIDO, NEW.STATUS_PED, NOW(), USER() );
      END IF;
END//

DELIMITER ;