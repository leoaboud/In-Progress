/*******************************************************************************
  SCRIPT DE ESTUDO: OPERAÇÕES CRUD (DDL / DML)
  PADRONIZAÇÃO: ALINHAMENTO VERTICAL E COMENTÁRIOS PADRONIZADOS.
*******************************************************************************/

-- DEFINIÇÃO DO BANCO DE DADOS DE TRABALHO
USE CURSO;

-- =============================================================================
-- 2. DDL: CREATE TABLE (DEFINIÇÃO DE DADOS)
-- =============================================================================

-- CRIA A ESTRUTURA DA TABELA CASO NÃO EXISTA PARA GERAR O RESULTADO ESPERADO
CREATE TABLE IF NOT EXISTS FUNCIONARIOS 
(
      ID      INT NOT NULL AUTO_INCREMENT, 
      NOME    VARCHAR(50) NOT NULL, 
      SALARIO DECIMAL(10, 2), 
      SETOR   VARCHAR(30), 
      PRIMARY KEY (ID)
);


-- =============================================================================
-- 3. DQL: SELECT (CONSULTA DE DADOS)
-- =============================================================================

-- EXECUTA A BUSCA TOTAL DE REGISTROS PARA RETORNO DE TODAS AS COLUNAS
SELECT * FROM FUNCIONARIOS;

-- SELECIONA COLUNAS ESPECÍFICAS ONDE O RESULTADO UTILIZA ALIAS PARA O SETOR
SELECT 
      ID, NOME,
      SALARIO,
      SETOR AS DEPTO 
FROM FUNCIONARIOS;


-- =============================================================================
-- 4. DML: INSERT (INSERÇÃO DE DADOS)
-- =============================================================================

-- REALIZA A INSERÇÃO COMPLETA GERANDO O RESULTADO DE TRÊS NOVAS LINHAS
INSERT INTO FUNCIONARIOS (NOME, SALARIO, SETOR) VALUES
      ('JOAO',      1000.00, 'RH'), 
      ('JOSE',      2000.00, 'FINANCEIRO'), 
      ('ALEXANDRE', 3000.00, 'TI');

-- REALIZA A INSERÇÃO PARCIAL COM RETORNO DE VALOR NULO PARA O CAMPO SETOR
INSERT INTO FUNCIONARIOS (NOME, SALARIO) VALUES 
      ('PEDRO',   1000.00), 
      ('CLEITON', 5000.00);


-- =============================================================================
-- 5. DML: UPDATE (ATUALIZAÇÃO DE DADOS)
-- =============================================================================

-- ATUALIZA O SALÁRIO DO ID 2 COM RETORNO DE VALOR MAJORADO EM 50%
UPDATE FUNCIONARIOS 
SET SALARIO = SALARIO * 1.5
WHERE ID = 2;

-- MODIFICA MÚLTIPLOS CAMPOS E GERA UM RESULTADO COLETIVO PARA OS DEMAIS IDs
UPDATE FUNCIONARIOS 
SET SALARIO = SALARIO * 1.5, 
	SETOR   = 'TI'
WHERE ID <> 1;


-- =============================================================================
-- 6. DML: DELETE (REMOÇÃO DE DADOS)
-- =============================================================================

-- EXCLUI O REGISTRO ESPECÍFICO IMPACTANDO NO RESULTADO FINAL DA LISTAGEM
DELETE FROM FUNCIONARIOS
WHERE ID = 1;

-- CONSULTA FINAL PARA VERIFICAÇÃO DO RETORNO APÓS AS MANIPULAÇÕES
SELECT * FROM FUNCIONARIOS;