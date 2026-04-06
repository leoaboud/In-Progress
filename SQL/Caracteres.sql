/*******************************************************************************
  SCRIPT DE ESTUDO: FUNÇÕES DE STRING E MANIPULAÇÃO DE DADOS
  PADRONIZAÇÃO: TRATAMENTO DE TEXTO, VARIÁVEIS E OPERAÇÕES DML.
*******************************************************************************/

-- =============================================================================
-- 1. FUNÇÕES DE CÓDIGO ASCII
-- =============================================================================

-- RETORNA O VALOR DECIMAL DO PRIMEIRO CARACTERE PARA CADA STRING INFORMADA
SELECT ASCII('SQL') AS RETORNO; 
SELECT ASCII('S')   AS RETORNO;
SELECT ASCII('Q')   AS RETORNO;
SELECT ASCII('L')   AS RETORNO;


-- =============================================================================
-- 2. FUNÇÕES DE LIMPEZA (TRIM)
-- =============================================================================

-- LTRIM: GERA O RETORNO DO TEXTO SEM OS ESPAÇOS INICIAIS (ESQUERDA)
SET @FRASE_PARA_LTRIM := '      CINCO ESPAÇOS NO INICIO';

SELECT CONCAT('TEXTO SEM ESPAÇO: ', LTRIM(@FRASE_PARA_LTRIM)) AS RETORNO
UNION ALL
SELECT CONCAT('TEXTO COM ESPAÇO: ', @FRASE_PARA_LTRIM);

-- RTRIM: GERA O RETORNO DO TEXTO SEM OS ESPAÇOS FINAIS (DIREITA)
SET @FRASE_PARA_RTRIM := 'CINCO ESPAÇOS NO FINAL      ';

SELECT CONCAT(RTRIM(@FRASE_PARA_RTRIM), ' | FIM') AS RETORNO
UNION ALL
SELECT CONCAT(@FRASE_PARA_RTRIM, ' | FIM');

-- TRIM: LIMPA AMBAS AS EXTREMIDADES PARA UM RESULTADO PADRONIZADO
SET @FRASE_PARA_TRIM := '      CINCO ESPAÇOS NAS PONTAS      ';

SELECT CONCAT('INÍCIO: ', TRIM(@FRASE_PARA_TRIM), ' :FIM') AS RETORNO
UNION ALL
SELECT CONCAT('INÍCIO: ', @FRASE_PARA_TRIM, ' :FIM');


-- =============================================================================
-- 3. COMPARAÇÃO E CONCATENAÇÃO
-- =============================================================================

-- REALIZA A COMPARAÇÃO DE STRINGS COM RETORNO NUMÉRICO (-1, 0 OU 1)
SELECT STRCMP('SQL1', 'SQL2') AS RETORNO;
SELECT STRCMP('MYSQL', 'MY')  AS RETORNO;
SELECT STRCMP('SQL', 'SQL')   AS RETORNO;

-- CONCAT: UNE MÚLTIPLOS VALORES PARA GERAR UM RESULTADO ÚNICO
SELECT CONCAT('MY', 'S', 'QL') AS RETORNO;

-- EXEMPLO PRÁTICO COM RETORNO DE DADOS DINÂMICOS DO SISTEMA
SELECT CONCAT(
	'OLÁ ', 
	CURRENT_USER(), 
    ', SEU SALDO É R$ ', 
    11.00, 
    ' EM ', 
    DAY(NOW()), 
    '/', MONTH(NOW()), 
    '/', YEAR(NOW())
    ) AS RETORNO;

-- CONCAT_WS: UTILIZA UM SEPARADOR FIXO PARA O RETORNO DA LISTA
SELECT CONCAT('BEM VINDO! ', CONCAT_WS(', ', 'ROSA', 'ANDRE')) AS RETORNO;

USE SAKILA;
SELECT 
    CONCAT_WS(' | ', ACTOR_ID, FIRST_NAME, LAST_NAME) AS RETORNO 
FROM ACTOR;


-- =============================================================================
-- 4. SUBSTITUIÇÃO DE TEXTO (REPLACE)
-- =============================================================================

-- LOCALIZA UM PADRÃO E GERA O RESULTADO COM A NOVA SUBSTRING
SET @PALAVRA := 'BALA';

SELECT @PALAVRA AS DE, 
REPLACE(@PALAVRA, 'BA', 'MO') AS PARA;

USE WORLD;
SELECT NAME, 
      CONTINENT, 
      REPLACE(CONTINENT, 'SOUTH AMERICA', 'AMÉRICA DO SUL') AS RETORNO
FROM COUNTRY;


-- =============================================================================
-- 5. CRIAÇÃO E MANUTENÇÃO (DDL/DML)
-- =============================================================================

USE CURSO;

CREATE TABLE IF NOT EXISTS PESSOAS 
	(
    NOME VARCHAR(30)
	);

INSERT INTO PESSOAS (NOME) VALUES 
      ('JOSÉ'), 
      ('ANDRÉ'), 
      ('HELÉN');

-- EXECUTA A ATUALIZAÇÃO MASSIVA PARA UM RESULTADO SEM ACENTUAÇÃO
SET SQL_SAFE_UPDATES = 0;
UPDATE PESSOAS SET NOME = REPLACE(NOME, 'É', 'E');
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM PESSOAS;


-- =============================================================================
-- 6. TIPOS DE DADOS (VARCHAR VS CHAR)
-- =============================================================================

CREATE TABLE IF NOT EXISTS TST 
	(
      C1 VARCHAR(3),
      C2 CHAR(3)
	);

INSERT INTO TST (C1, C2) VALUES 
      ('2', '2'), 
      ('37', '37'), 
      ('597', '597');


-- =============================================================================
-- 7. PADRONIZAÇÃO DE STRINGS (LPAD / RPAD)
-- =============================================================================

-- LPAD: PREENCHE À ESQUERDA PARA GARANTIR O RETORNO COM TAMANHO FIXO
SELECT LPAD('123456', 10, '0') AS RETORNO;

SELECT 
      C1, 
      C2, 
      LPAD(C1, 5, '0') AS LPAD_C1, 
      LPAD(C2, 10, '0') AS LPAD_C2
FROM TST;

-- RPAD: PREENCHE À DIREITA PARA UM RESULTADO DE ALINHAMENTO POSTERIOR
SELECT RPAD('123456', 10, '0') AS RETORNO;


-- =============================================================================
-- 8. EXTRAÇÃO E CAIXA DE TEXTO (LEFT, RIGHT, UPPER, LOWER, REVERSE)
-- =============================================================================

USE SAKILA;

-- EXTRAI OS CARACTERES INICIAIS PARA O RETORNO DA SUBSTRING
SELECT 
      FIRST_NAME, 
      LEFT(FIRST_NAME, 5) AS RETORNO
FROM ACTOR;

-- EXTRAI OS CARACTERES FINAIS PARA O RETORNO DA SUBSTRING
SELECT 
      FIRST_NAME, 
      RIGHT(FIRST_NAME, 5) AS RETORNO
FROM ACTOR;

USE WORLD;

-- CONVERTE O RESULTADO PARA LETRAS MAIÚSCULAS
SELECT NAME, UPPER(NAME) AS RETORNO FROM COUNTRY;

-- CONVERTE O RESULTADO PARA LETRAS MINÚSCULAS
SELECT NAME, LOWER(NAME) AS RETORNO FROM COUNTRY;

-- INVERTE A STRING PARA UM RETORNO ESPELHADO
SELECT NAME, REVERSE(NAME) AS RETORNO FROM COUNTRY;


-- =============================================================================
-- 9. MEDIÇÃO DE TAMANHO (CHAR_LENGTH, LENGTH, BIT_LENGTH)
-- =============================================================================

USE CURSO;

-- RETORNA A QUANTIDADE DE CARACTERES, BYTES E BITS DO RESULTADO
SELECT 
      C1, 
      C2, 
      CHAR_LENGTH(C1) AS LEN_C1, 
      LENGTH(C1)      AS BYTES_C1, 
      BIT_LENGTH(C1)  AS BITS_C1
FROM TST;


-- =============================================================================
-- 10. LOCALIZAÇÃO E CONJUNTOS (FIELD, FIND_IN_SET, MAKE_SET)
-- =============================================================================

-- FIELD: RETORNA A POSIÇÃO DO ITEM NA LISTA INFORMADA
SELECT FIELD('QUI', 'SEG', 'TER', 'QUA', 'QUI', 'SEX') AS RETORNO;

-- FIND_IN_SET: BUSCA NA LISTA SEPARADA POR VÍRGULA E GERA O RETORNO DA POSIÇÃO
SELECT FIND_IN_SET('B','A,B,C,D') AS RETORNO;

-- MAKE_SET: GERA O RESULTADO DE UM CONJUNTO BASEADO EM VALORES BINÁRIOS
SELECT MAKE_SET('2','A,B,C,D') AS RETORNO;


-- =============================================================================
-- 11. SUBSTRING E TRATAMENTO DE DATAS
-- =============================================================================

USE WORLD;

-- EXTRAI PARTES ESPECÍFICAS DA STRING PARA UM RESULTADO FRAGMENTADO
SELECT NAME, 
	SUBSTRING(NAME, 1, 3) AS NAME1,
	SUBSTRING(NAME, 4, 3) AS NAME2
FROM COUNTRY;

-- TRATAMENTO DE DATA ATUAL COM RETORNO DE ANO, MÊS E DIA VIA SUBSTRING
SELECT 
      SUBSTRING(NOW(), 1, 4) AS ANO, 
      SUBSTRING(NOW(), 6, 2) AS MES, 
      SUBSTRING(NOW(), 9, 2) AS DIA;