/*******************************************************************************
  SCRIPT DE ESTUDO: TRATAMENTO DE EXCEÇÕES E TRANSAÇÕES
  PADRONIZAÇÃO: VÍRGULAS À DIREITA E INTEGRIDADE DE DADOS.
*******************************************************************************/

-- =============================================================================
-- 1. ESTRUTURA DE TABELA PARA TESTE
-- =============================================================================

CREATE TABLE CAD_CLI (
      COD_CLI  INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
      NOME_CLI VARCHAR(20) NOT NULL,
      PRIMARY KEY (COD_CLI)
);


-- =============================================================================
-- 2. PROCEDURE COM HANDLER E TRANSACTION
-- UTILIZA UM 'CONTINUE HANDLER' PARA CAPTURAR FALHAS E EXECUTAR O ROLLBACK.
-- =============================================================================

DELIMITER //

CREATE PROCEDURE PROC_TRATA_EXC(
      IN  VAR_NOME_CLI VARCHAR(100), 
      OUT RESPOSTA     VARCHAR(50)
)
SALVAR: BEGIN
      -- DECLARAÇÃO DA VARIÁVEL DE CONTROLE DE ERRO
      DECLARE EXCECAO SMALLINT DEFAULT 0;
      
      -- SE OCORRER QUALQUER ERRO SQL, A VARIÁVEL 'EXCECAO' MUDA PARA 1
      DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET EXCECAO = 1;

      -- INÍCIO DA TRANSAÇÃO ATÔMICA
      START TRANSACTION;
            
            -- TENTA REALIZAR A INSERÇÃO
            INSERT INTO CAD_CLI (COD_CLI, NOME_CLI) VALUES 
                  (NULL, VAR_NOME_CLI);

      -- VERIFICA SE O HANDLER FOI ACIONADO
      IF EXCECAO = 1 THEN
            SET RESPOSTA = 'ERRO AO GRAVAR DADOS';
            -- DESFAZ QUALQUER ALTERAÇÃO EM CASO DE ERRO
            ROLLBACK;
            LEAVE SALVAR;
      ELSE
            SET RESPOSTA = 'SALVO COM SUCESSO';
            -- CONFIRMA A GRAVAÇÃO PERMANENTE DOS DADOS
            COMMIT;
      END IF;
END //

DELIMITER ;


-- =============================================================================
-- 3. TESTES DE EXECUÇÃO E RETORNO
-- =============================================================================

-- CASO 1: SUCESSO (NOME DENTRO DO LIMITE DE 20 CARACTERES)
CALL PROC_TRATA_EXC('ANDRE', @RESPOSTA);
SELECT @RESPOSTA AS STATUS_1;

-- CASO 2: ERRO (NOME EXCEDE O LIMITE DE 20 CARACTERES DA TABELA)
-- O HANDLER CAPTURARÁ O ERRO DE 'DATA TOO LONG'
CALL PROC_TRATA_EXC('PEDRO DE ALCANTARA MACHADO NETO RODRIGUES', @RESPOSTA);
SELECT @RESPOSTA AS STATUS_2;

-- VERIFICAÇÃO FINAL DOS DADOS PERSISTIDOS
SELECT * FROM CAD_CLI;