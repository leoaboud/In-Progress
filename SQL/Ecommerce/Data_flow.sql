/*******************************************************************************
  PROJETO: MINI E-COMMERCE (MINI_EC) - CARGA DE DADOS
  ESTRUTURA: INSERTS, CARGAS EXTERNAS E TESTE DE RELACIONAMENTOS
  PADRONIZAÇÃO: VÍRGULAS À DIREITA E FORMATAÇÃO DE CONSULTAS.
*******************************************************************************/

USE MINI_EC;

-- =============================================================================
-- 1. POPULANDO CADASTROS BÁSICOS
-- =============================================================================

INSERT INTO CATEGORIAS (DESCRICAO) VALUES 
      ('JOGOS'), 
      ('ELETRÔNICOS'), 
      ('SOM'), 
      ('ELETRODOMÉSTICOS');

INSERT INTO FABRICANTES (NOME_FABRICANTE) VALUES 
      ('FABR JOGOS'), 
      ('FABR ELETR.'), 
      ('FABR. SOM'), 
      ('FABR ELE.DOMES');


-- =============================================================================
-- 2. MIGRAÇÃO DE DADOS GEOGRÁFICOS
-- IMPORTANDO DADOS DA BASE 'CURSO' PARA A BASE 'MINI_EC'
-- =============================================================================

-- Carga de Unidades Federais
INSERT INTO UNIDADE_FEDERAL (COD_UF, UF, NOME_UF)
SELECT * FROM CURSO.UF;

-- Carga de Cidades (Filtrando por ano para evitar duplicidade)
INSERT INTO CIDADES (NOME_CIDADE, COD_MUN, COD_UF)
SELECT 
      A.NOME_MUN, 
      A.COD_MUN, 
      A.COD_UF 
FROM 
      CURSO.SENSO A
WHERE 
      ANO = '2014';


-- =============================================================================
-- 3. CARGA DE CLIENTES E ENDEREÇOS (GERAÇÃO DE TESTE)
-- UTILIZANDO DADOS DA BASE 'SAKILA' PARA CRIAR CLIENTES FICTÍCIOS
-- =============================================================================

SET @ANO := 10;
SET @DATA_CAD := 120;

INSERT INTO CLIENTES (NOME, SOBRENOME, EMAIL, SENHA, DATA_NASC, DATA_CADASTRO, SITUACAO)
SELECT 
      A.FIRST_NAME, 
      A.LAST_NAME,
      LOWER(CONCAT(A.FIRST_NAME, A.LAST_NAME, '@MEUEMAIL.COM')) AS EMAIL,
      MD5(A.FIRST_NAME) AS SENHA,
      DATE_ADD(A.LAST_UPDATE, INTERVAL -@ANO := @ANO + 1 YEAR) AS DATA_NASC,
      DATE_ADD(A.LAST_UPDATE, INTERVAL +@DATA_CAD := @DATA_CAD + 1 MONTH) AS DATA_CAD,
      'A' AS SITUACAO
FROM 
      SAKILA.ACTOR A
LIMIT 20;

-- Carga de Endereços Relacionados aos Clientes Criados
INSERT INTO CLIENTE_ENDERECO (ID_CLIENTE, TIPO, ENDERECO, NUMERO, BAIRRO, CEP, ID_CIDADE)
VALUES
      (1,  'P', 'RUA A', '123', 'DA LUZ', '00000000', '7'),
      (2,  'P', 'RUA B', '321', 'BARREIRO', '00000000', '15'),
      (3,  'P', 'RUA C', '456', 'SETE LEGAS', '00000000', '20'),
      (20, 'P', 'RUA T', '753', 'SOL NASCENTE', '00000000', '5002');


-- =============================================================================
-- 4. CATÁLOGO DE PRODUTOS E REGRAS DE NEGÓCIO (PAGAMENTO)
-- =============================================================================

-- Exemplo de Carga de Produtos por Categoria
INSERT INTO PRODUTO (DESCRICAO, ID_CATEGORIA, ID_FABRICANTE, PRECO_CUSTO, PRECO_VENDA)
VALUES
      ('JOGO INFANTIL', 1, 1, 50, 200),
      ('SMART TV 42',   2, 2, 1300, 2000),
      ('GELADEIRA',     4, 4, 780, 1580);

-- Carga Inicial de Estoque (Sincronizada com os IDs de Produtos)
INSERT INTO ESTOQUE (ID_PRODUTO, ESTOQUE_TOTAL, ESTOQUE_LIVRE, ESTOQUE_RESERVADO) 
VALUES
      (1, 100, 100, 0),
      (2, 100, 100, 0),
      (3, 100, 100, 0);

-- Carga de Condições de Pagamento (Ex: Parcelamento)
INSERT INTO COND_PAGTO (DESCRICAO, TIPO) VALUES 
      ('A VISTA', 'B'), 
      ('10 X',    'C');

INSERT INTO COND_PAGTO_DET (ID_PAGTO, PARCELA, PERCENTUAL, DIAS) VALUES 
      (1, 1, 100, 1),    -- À Vista
      (2, 1, 10,  30),   -- 10x (Parcela 1)
      (2, 2, 10,  60);   -- 10x (Parcela 2)


-- =============================================================================
-- 5. VALIDAÇÃO DOS DADOS (CONSULTAS COM JOIN)
-- =============================================================================

-- Verificação de Produtos com Categoria, Fabricante e Estoque
SELECT A.ID_PRODUTO, A.DESCRICAO, A.PRECO_VENDA, B.NOME_FABRICANTE, C.DESCRICAO 
       AS CATEGORIA, D.ESTOQUE_TOTAL 
       AS EST_TOT
FROM  PRODUTO A
      INNER JOIN FABRICANTES B ON A.ID_FABRICANTE = B.ID_FABRICANTE
      INNER JOIN CATEGORIAS C ON A.ID_CATEGORIA = C.ID_CATEGORIA
      INNER JOIN ESTOQUE D ON A.ID_PRODUTO = D.ID_PRODUTO;