/*******************************************************************************
  PROJETO: MINI E-COMMERCE (MINI_EC) - FINALIZAÇÃO DE VENDA
  OBJETIVO: TRANSFORMAR CARRINHO EM PEDIDO E LIMPAR SESSÃO
  PADRONIZAÇÃO: VÍRGULAS À DIREITA E CONTROLE TRANSACIONAL (COMMIT/ROLLBACK)
*******************************************************************************/

USE MINI_EC;

DELIMITER //

CREATE PROCEDURE PROC_FECHA_CARRINHO 
(
      IN  V_SESSAO     VARCHAR(32),
      IN  V_ID_CLIENTE INT,
      IN  V_ID_PAGTO   INT,
      IN  V_FRETE      DECIMAL(10,2), 
      IN  V_ENDER      CHAR(1), -- P: Principal, A: Alternativo
      OUT RESPOSTA     VARCHAR(255)
)
MAIN: BEGIN
      -- Declaração de Variáveis Locais
      DECLARE V_TOTAL_PED   DECIMAL(10,2);
      DECLARE V_TOTAL_DESC  DECIMAL(10,2);
      DECLARE V_NUM_PED     INT;
      DECLARE V_ID_ENDERECO INT;
      DECLARE COD_ERRO      CHAR(5) DEFAULT '00000';
      DECLARE MSG           TEXT;
      DECLARE ROWS_AFFECTED INT;

      -- Handler para captura de erros críticos
      DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
      BEGIN
            GET DIAGNOSTICS CONDITION 1
            COD_ERRO = RETURNED_SQLSTATE, 
            MSG = MESSAGE_TEXT;
      END;

      -- 1. CÁLCULO DOS TOTAIS DO CARRINHO
      SELECT 
            SUM(TOTAL), 
            SUM(DESCONTO) INTO V_TOTAL_PED, V_TOTAL_DESC
      FROM 
            CARRINHO_COMPRAS
      WHERE 
            SESSAO = MD5(V_SESSAO);

      -- 2. BUSCA DO ENDEREÇO DO CLIENTE
      SELECT ID_ENDERECO INTO V_ID_ENDERECO 
      FROM CLIENTE_ENDERECO
      WHERE ID_CLIENTE = V_ID_CLIENTE 
      LIMIT 1;

      -- 3. INÍCIO DA TRANSAÇÃO LÓGICA
      START TRANSACTION;

      -- Insere o cabeçalho do pedido
      INSERT INTO PEDIDOS 
      (
            ID_CLIENTE, 
            ID_ENDERECO, 
            ID_PAGTO, 
            TOTAL_PROD,
            TOTAL_FRETE, 
            TOTAL_DESC, 
            TOTAL_PEDIDO, 
            DATA_PEDIDO, 
            STATUS_PED
      ) VALUES (
            V_ID_CLIENTE, 
            V_ID_ENDERECO, 
            V_ID_PAGTO, 
            V_TOTAL_PED, 
            V_FRETE, 
            V_TOTAL_DESC,
            ((V_TOTAL_PED + V_FRETE) - V_TOTAL_DESC), 
            NOW(), 
            'A'
      );

      -- Recupera o número do pedido gerado
      SET V_NUM_PED = LAST_INSERT_ID();

      -- Transfere os itens do carrinho para a tabela definitiva de itens do pedido
      INSERT INTO PEDIDO_ITENS 
      (
            NUM_PEDIDO, 
            ID_PRODUTO, 
            QTD, 
            VAL_UNIT, 
            DESCONTO, 
            TOTAL
      )
      SELECT 
            V_NUM_PED, 
            ID_PRODUTO, 
            QTD, 
            VAL_UNIT, 
            DESCONTO, 
            TOTAL
      FROM 
            CARRINHO_COMPRAS
      WHERE 
            SESSAO = MD5(V_SESSAO);

      -- Limpa o carrinho de compras após a finalização
      DELETE FROM CARRINHO_COMPRAS
      WHERE SESSAO = MD5(V_SESSAO);  

      -- 4. VALIDAÇÃO FINAL (COMMIT OU ROLLBACK)
      IF COD_ERRO = '00000' THEN
            GET DIAGNOSTICS ROWS_AFFECTED = ROW_COUNT;
            SET RESPOSTA = CONCAT('Pedido finalizado com sucesso! ID: ', V_NUM_PED);
            COMMIT;
      ELSE
            SET RESPOSTA = CONCAT('Erro ao finalizar: ', COD_ERRO, ' - ', MSG);
            ROLLBACK;
      END IF;

END//

DELIMITER ;