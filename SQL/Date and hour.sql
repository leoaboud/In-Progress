/*******************************************************************************
  SCRIPT DE ESTUDO: MANIPULAÇÃO DE DATAS E HORAS
  PADRONIZAÇÃO: VÍRGULAS À DIREITA E CÁLCULOS DE INTERVALOS.
*******************************************************************************/

-- =============================================================================
-- 1. FUNÇÕES BÁSICAS DE TEMPO ATUAL
-- =============================================================================

SELECT CURDATE() AS APENAS_DATA;
SELECT CURRENT_TIME() AS APENAS_HORA;
SELECT NOW() AS DATA_E_HORA_COMPLETA;

-- EXEMPLO DE TABELA DE LOG PARA AUDITORIA (DML/DDL)
CREATE TABLE IF NOT EXISTS AUDIT_LOG 
(
      ID INT NOT NULL AUTO_INCREMENT,
      ACAO VARCHAR(30),
      DATA DATE,
      HORA TIME,
      PRIMARY KEY(ID)
);

-- INSERÇÃO PARA GERAR O RESULTADO COM O HORÁRIO DO SISTEMA
INSERT INTO AUDIT_LOG (ACAO, DATA, HORA) VALUES 
      ('CADASTRO', CURDATE(), CURRENT_TIME()),
      ('ATUALIZACAO', CURDATE(), CURRENT_TIME());

-- ATUALIZAÇÃO PARA UM RESULTADO DE HORA ESPECÍFICO
UPDATE AUDIT_LOG SET 
       HORA = CURRENT_TIME()
WHERE ID = '1';


-- =============================================================================
-- 2. CONFIGURAÇÕES DE LOCALIDADE E TIMEZONE
-- =============================================================================

-- DEFINE O RETORNO DOS NOMES DE MESES E DIAS PARA PORTUGUÊS
SET LC_TIME_NAMES = 'PT_BR';

-- VERIFICA O RESULTADO DAS CONFIGURAÇÕES DE FUSO HORÁRIO
SELECT @@GLOBAL.TIME_ZONE AS FUSO_GLOBAL,
       @@TIME_ZONE AS FUSO_SESSAO;


-- =============================================================================
-- 3. EXTRAÇÃO DE PARTES DA DATA (FUNCTIONAL EXTRACTION)
-- =============================================================================

-- RETORNA CADA PARTE DA DATA ATUAL COMO UMA COLUNA INDIVIDUAL
SELECT MONTH(NOW()) AS MES,
       YEAR(NOW()) AS ANO,
       DAY(NOW()) AS DIA,
       HOUR(NOW()) AS HORA,
       MINUTE(NOW()) AS MINUTO,
       SECOND(NOW()) AS SEGUNDO;

USE SAKILA;

-- APLICAÇÃO PRÁTICA EM TABELAS DE PRODUÇÃO
SELECT TITLE,
       LAST_UPDATE AS ULTIMA_ATUALIZACAO,
       MONTH(LAST_UPDATE) AS MES,
       YEAR(LAST_UPDATE) AS ANO,
       DAY(LAST_UPDATE) AS DIA
FROM FILM;


-- =============================================================================
-- 4. CÁLCULO DE DIFERENÇAS (DATEDIFF, TIMEDIFF, TIMESTAMPDIFF)
-- =============================================================================

-- DATEDIFF: RETORNA O RESULTADO DA DIFERENÇA EM DIAS (FIM - INICIO)
SELECT TITLE,
       LAST_UPDATE,
       DATEDIFF(NOW(), LAST_UPDATE) AS DIF_DIAS
FROM FILM;

-- TIMESTAMPDIFF: PERMITE ESPECIFICAR A UNIDADE DO RETORNO (ANO, MES, HORA, ETC)
SELECT TITLE, 
      LAST_UPDATE,
      TIMESTAMPDIFF(YEAR, LAST_UPDATE, NOW()) AS ANO_DIF,
      TIMESTAMPDIFF(MONTH, LAST_UPDATE, NOW()) AS MES_DIF,
      TIMESTAMPDIFF(DAY, LAST_UPDATE, NOW()) AS DIA_DIF,
      TIMESTAMPDIFF(WEEK, LAST_UPDATE, NOW()) AS SEMANA_DIF
FROM FILM
LIMIT 5;


-- =============================================================================
-- 5. ARITMÉTICA DE DATAS (DATE_ADD / DATE_SUB)
-- =============================================================================

-- GERA O RESULTADO COM ACRÉSCIMOS DE INTERVALOS ESPECÍFICOS
SELECT CURDATE() AS HOJE,
       DATE_ADD(CURDATE(), INTERVAL "2" MONTH) AS EM_DOIS_MESES,
       DATE_ADD(CURDATE(), INTERVAL "90" DAY) AS EM_90_DIAS,
       DATE_ADD(CURDATE(), INTERVAL "3" YEAR) AS EM_3_ANOS;


-- =============================================================================
-- 6. FORMATAÇÃO DE DATAS (DATE_FORMAT)
-- =============================================================================

-- FORMATA O RETORNO PARA PADRÕES BRASILEIROS OU CUSTOMIZADOS
SELECT DATE_FORMAT(NOW(), '%D/%M/%Y') AS PADRAO_BR,
       DATE_FORMAT(NOW(), '%H:%I:%S') AS HORA_FORMATADA;

-- RESULTADO POR EXTENSO UTILIZANDO CONCATENAÇÃO
SELECT CONCAT('HOJE É ', 
			  DATE_FORMAT(NOW(), '%D'), ' DE ',
			  DATE_FORMAT(NOW(), '%M'), ' DE ',
			  DATE_FORMAT(NOW(), '%Y')
			  ) AS DATA_EXTENSO;


-- =============================================================================
-- 7. FUNÇÕES ADICIONAIS DE CALENDÁRIO
-- =============================================================================

-- RETORNA O NOME DO DIA, POSIÇÃO NA SEMANA E ÚLTIMO DIA DO MÊS
SELECT 
      DAYNAME(NOW()) AS NOME_DIA,
      DAYOFWEEK(NOW()) AS DIA_SEMANA_NUM,
      DAYOFYEAR(NOW()) AS DIA_DO_ANO,
      LAST_DAY(NOW()) AS ULTIMO_DIA_MES,
      EXTRACT(YEAR FROM NOW()) AS ANO_EXTRAIDO;