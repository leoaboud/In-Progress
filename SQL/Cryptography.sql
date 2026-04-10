/*******************************************************************************
  SCRIPT DE ESTUDO: CRIPTOGRAFIA E HASHING (MD5, SHA1, SHA2)
  PADRONIZAÇÃO: VÍRGULAS À DIREITA E SEGURANÇA DE SENHAS.
*******************************************************************************/

-- =============================================================================
-- 1. FUNÇÃO MD5 (MESSAGE DIGEST 5)
-- GERA UM RESULTADO DE 128 BITS (32 CARACTERES HEXADECIMAIS).
-- =============================================================================

SELECT MD5('12345') AS RETORNO;

-- CRIAÇÃO DE TABELA PARA ARMAZENAMENTO SEGURO DE SENHAS
CREATE TABLE IF NOT EXISTS USUARIO (
      ID_USUARIO INT NOT NULL AUTO_INCREMENT,
      NOME VARCHAR(20),
      SENHA VARCHAR(32), -- TAMANHO EXATO PARA O RETORNO DO MD5
      PRIMARY KEY(ID_USUARIO)
);

-- INSERE O USUÁRIO COM A SENHA JÁ CRIPTOGRAFADA PARA UM RESULTADO SEGURO
INSERT INTO USUARIO (NOME, SENHA) VALUES 
      ('LEONARDO', MD5('12345'));

-- VERIFICA O RESULTADO (A SENHA NÃO APARECERÁ EM TEXTO LIMPO)
SELECT * FROM USUARIO;

-- ATUALIZAÇÃO DE SENHA UTILIZANDO O MESMO PADRÃO DE HASH
UPDATE USUARIO SET 
       SENHA = MD5('654321ABC')
WHERE ID_USUARIO = '1';


-- =============================================================================
-- 2. FUNÇÕES SHA (SECURE HASH ALGORITHM)
-- SHA E SHA1 SÃO EQUIVALENTES E GERAM UM RETORNO DE 160 BITS.
-- =============================================================================

SELECT SHA('123456') AS SHA,
       SHA1('123456') AS SHA1;


-- =============================================================================
-- 3. FAMÍLIA SHA2 (ALTA SEGURANÇA)
-- PERMITE DEFINIR O COMPRIMENTO DO BIT (224, 256, 384 OU 512).
-- =============================================================================

SELECT SHA2('ABC', 224) AS SHA224,
       SHA2('ABC', 256) AS SHA256,
       SHA2('ABC', 384) AS SHA384,
       SHA2('ABC', 512) AS SHA516;


-- =============================================================================
-- 4. ANÁLISE DE TAMANHO DO RETORNO (BIT_LENGTH VS LENGTH)
-- COMPARA O ESPAÇO OCUPADO EM BITS E EM CARACTERES (BYTES).
-- =============================================================================

-- RETORNA O RESULTADO DO TAMANHO EM BITS
SELECT BIT_LENGTH(SHA2('ABC', 224)) AS HASH224_BITS,
       BIT_LENGTH(SHA2('ABC', 256)) AS HASH256_BITS,
       BIT_LENGTH(SHA2('ABC', 384)) AS HASH384_BITS,
       BIT_LENGTH(SHA2('ABC', 512)) AS HASH516_BITS;

-- RETORNA O RESULTADO DO TAMANHO EM CARACTERES (BYTES)
SELECT LENGTH(SHA2('ABC', 224)) AS HASH224_LEN,
       LENGTH(SHA2('ABC', 256)) AS HASH256_LEN,
       LENGTH(SHA2('ABC', 384)) AS HASH384_LEN,
       LENGTH(SHA2('ABC', 512)) AS HASH516_LEN;