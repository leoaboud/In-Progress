/*******************************************************************************
  SCRIPT DE ESTUDO: STORED PROCEDURES (PARÂMETROS DE ENTRADA IN)
  PADRONIZAÇÃO: VÍRGULAS À DIREITA E MANUTENÇÃO DA ESTRUTURA ORIGINAL.
*******************************************************************************/

-- =============================================================================
-- 1. PROCEDURE PARA CONSULTA FILTRADA
-- O PARÂMETRO 'P_UF' RECEBE O VALOR PARA GERAR O RESULTADO DA BUSCA NO SENSO.
-- =============================================================================

DELIMITER //

CREATE PROCEDURE PROC_CIDADE(IN P_UF VARCHAR(2))
BEGIN
      SELECT DISTINCT 
            NOME_MUN, 
            POPULACAO, 
            UF
      FROM SENSO
      WHERE UF = P_UF;
END //

DELIMITER ;

-- EXECUÇÃO DA PROCEDURE PARA RETORNO DE DADOS ESPECÍFICOS
CALL PROC_CIDADE('15');

-- USO DE VARIÁVEL DE SESSÃO PARA ALIMENTAR O RESULTADO DA PROCEDURE
SET @VAR_UF = '13'; 
CALL PROC_CIDADE(@VAR_UF);


-- =============================================================================
-- 2. CRIAÇÃO DO CENÁRIO DE ESTOQUE (DDL/DML)
-- =============================================================================

CREATE TABLE MATERIAL 
(
      COD_MAT INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
      NOME VARCHAR(50) NOT NULL,
      CUSTO DECIMAL(10,2) NOT NULL
);

INSERT INTO MATERIAL (NOME, CUSTO) VALUES
      ('XBOX', '1500'), 
      ('SMART TV 42', '2200'),
      ('NOTEBOOK', '3900'), 
      ('SMARTPHONE', '2350');

CREATE TABLE ESTOQUE 
(
      COD_MAT INT NOT NULL,
      QTD INT NOT NULL,
      FOREIGN KEY (COD_MAT) REFERENCES MATERIAL(COD_MAT)
);

INSERT INTO ESTOQUE (COD_MAT, QTD) VALUES 
      (1, 12), 
      (2, 29), 
      (3, 33), 
      (4, 54);


-- =============================================================================
-- 3. PROCEDURE PARA ATUALIZAÇÃO DE DADOS (DML)
-- REALIZA O CÁLCULO DE REAJUSTE PARA GERAR O RESULTADO DE NOVO CUSTO NO BANCO.
-- =============================================================================

DELIMITER //

CREATE PROCEDURE PROC_AJUSTA_CUSTO(IN P_COD_MAT INT, TAXA DECIMAL(10,2))
BEGIN
      -- ATUALIZA O VALOR DO CUSTO COM BASE NO PARÂMETRO INFORMADO
      UPDATE MATERIAL 
      SET CUSTO = CUSTO + CUSTO * TAXA / 100
      WHERE COD_MAT = P_COD_MAT;
END //

DELIMITER ;

-- CHAMA O PROCEDIMENTO PARA GERAR O RESULTADO DO REAJUSTE DE 7% NO ITEM 2
CALL PROC_AJUSTA_CUSTO(2, 7);

-- VERIFICA O RESULTADO FINAL NA TABELA DE MATERIAIS
SELECT * FROM MATERIAL;