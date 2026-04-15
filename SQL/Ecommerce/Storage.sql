/*******************************************************************************
  PROJETO: MINI E-COMMERCE (MINI_EC) - LÓGICA DE CARRINHO E ESTOQUE
  OBJETIVO: CARGA DE ITENS COM VALIDAÇÃO DE SALDO E TRANSAÇÃO LÓGICA
  PADRONIZAÇÃO: VÍRGULAS À DIREITA E TRATAMENTO DE EXCEÇÕES
*******************************************************************************/

USE MINI_EC;

DELIMITER //

CREATE PROCEDURE PROC_CARGA_CARRINHO 
(
      IN  V_SESSAO  VARCHAR(32),
      IN  V_ID_PROD INT,
      IN  V_QTD     INT,
      OUT RESPOSTA  VARCHAR(50)
)
MAIN: BEGIN
      -- Declaração de Variáveis de Controle
      DECLARE V_QTD_LIVRE   INT;
      DECLARE V_PRECO_VENDA DECIMAL(10,2);
      DECLARE COD_ERRO      CHAR(5) DEFAULT '00000';
      DECLARE MSG           TEXT;
      DECLARE ROWS_AFFECTED INT;

      -- Handler para captura de erros SQL
      DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
      BEGIN
            GET DIAGNOSTICS CONDITION 1
            COD_ERRO = RETURNED_SQLSTATE, 
            MSG = MESSAGE_TEXT;
      END;

      -- 1. VALIDAÇÃO DE DISPONIBILIDADE
      SELECT ESTOQUE_LIVRE INTO V_QTD_LIVRE 
      FROM ESTOQUE
      WHERE ID_PRODUTO = V_ID_PROD;

      IF V_QTD > V_QTD_LIVRE THEN
            SET RESPOSTA = 'Quantidade Indisponivel';
            LEAVE MAIN;
      END IF;

      -- 2. RECUPERAÇÃO DE PREÇO ATUAL
      SELECT PRECO_VENDA INTO V_PRECO_VENDA 
      FROM PRODUTO
      WHERE ID_PRODUTO = V_ID_PROD;

      -- 3. PROCESSO TRANSACIONAL (START TRANSACTION)
      START TRANSACTION;

      -- Insere no carrinho (aplicando MD5 na sessão para segurança)
      INSERT INTO CARRINHO_COMPRAS (SESSAO, ID_PRODUTO, QTD, VAL_UNIT, DESCONTO, TOTAL, DATA_HORA_SESSA) 
      VALUES ( MD5(V_SESSAO), V_ID_PROD, V_QTD, V_PRECO_VENDA, 0, V_QTD * V_PRECO_VENDA, NOW() );

      -- Atualiza o estoque: transfere do livre para o reservado
      UPDATE ESTOQUE 
      SET ESTOQUE_LIVRE = ESTOQUE_LIVRE - V_QTD, ESTOQUE_RESERVADO = ESTOQUE_RESERVADO + V_QTD
      WHERE ID_PRODUTO = V_ID_PROD;

      -- 4. FINALIZAÇÃO E CHECK DE ERROS
      IF COD_ERRO = '00000' THEN
            GET DIAGNOSTICS ROWS_AFFECTED = ROW_COUNT;
            SET RESPOSTA = CONCAT('Atualizacao com Sucesso = ', ROWS_AFFECTED);
            COMMIT; -- Confirma as alterações
      ELSE
            SET RESPOSTA = CONCAT('Erro: ', COD_ERRO, ' - ', SUBSTRING(MSG, 1, 30));
            ROLLBACK; -- Desfaz tudo em caso de erro
      END IF;

END//

DELIMITER ;