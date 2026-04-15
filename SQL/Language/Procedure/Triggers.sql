/*******************************************************************************
  SCRIPT DE ESTUDO: TRIGGERS (GATILHOS DE AUDITORIA)
  PADRONIZAÇÃO: VÍRGULAS À DIREITA E LOG DE ALTERAÇÕES.
*******************************************************************************/

-- =============================================================================
-- 1. CRIAÇÃO DA TABELA DE AUDITORIA
-- ARMAZENA O HISTÓRICO PARA COMPARAR O RETORNO ANTES E DEPOIS DA ALTERAÇÃO.
-- =============================================================================

CREATE TABLE AUDITORIA_SALARIO 
(
      ID             INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
      ID_FUNC        INT,
      SALARIO_ANTES  DECIMAL(10,2) NOT NULL,
      SALARIO_DEPOIS DECIMAL(10,2) NOT NULL,
      USUARIO        VARCHAR(50) NOT NULL,
      DATA_HORA      DATETIME NOT NULL
);

SELECT * FROM FUNCIONARIOS;


-- =============================================================================
-- 2. CRIAÇÃO DO TRIGGER (GATILHO)
-- O DISPARO OCORRE AUTOMATICAMENTE APÓS CADA ATUALIZAÇÃO NA TABELA FUNCIONARIOS.
-- =============================================================================

DELIMITER //

CREATE TRIGGER TG_AUDIT_SAL AFTER UPDATE
ON FUNCIONARIOS
FOR EACH ROW
BEGIN
      -- INSERE O REGISTRO DE AUDITORIA USANDO OS PREFIXOS OLD (ANTIGO) E NEW (NOVO)
      INSERT INTO AUDITORIA_SALARIO 
      ( ID_FUNC, SALARIO_ANTES, SALARIO_DEPOIS, USUARIO, DATA_HORA )
      VALUES 
      ( NEW.ID, OLD.SALARIO, NEW.SALARIO, USER(), NOW() );
END //

DELIMITER ;


-- =============================================================================
-- 3. TESTE DE DISPARO E VERIFICAÇÃO DE RESULTADO
-- =============================================================================

-- REALIZA UM AUMENTO DE 15% NO FUNCIONÁRIO 5
UPDATE FUNCIONARIOS SET SALARIO = SALARIO * 1.15
WHERE ID = 5;

-- LISTA TODOS OS GATILHOS ATIVOS NO BANCO DE DADOS
SHOW TRIGGERS;

-- VERIFICA O RETORNO DO LOG GERADO PELO GATILHO
SELECT * FROM AUDITORIA_SALARIO;