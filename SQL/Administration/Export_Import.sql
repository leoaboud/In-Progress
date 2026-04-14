/*******************************************************************************
  SCRIPT DE ESTUDO: EXPORTAÇÃO E IMPORTAÇÃO (PADRÃO MYSQL 8.0)
  PADRONIZAÇÃO: VÍRGULAS À DIREITA E DIRETÓRIOS DA VERSÃO 8.0.
*******************************************************************************/

USE CURSO;

-- =============================================================================
-- 1. EXPORTAÇÃO (OUTFILE)
-- AJUSTADO PARA O DIRETÓRIO DO MYSQL 8.0
-- =============================================================================

-- Verificação dos dados antes de exportar
SELECT * FROM UF;

-- No MySQL 8.0, o caminho padrão de instalação costuma mudar para a versão 8.0
SELECT * INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\uf.csv' 
FIELDS TERMINATED BY '|' 
LINES TERMINATED BY '\n' 
FROM UF;


-- =============================================================================
-- 2. CORREÇÃO E LIMPEZA
-- =============================================================================

-- O MySQL 8.0 usa utf8mb4 como padrão, o que é mais robusto para acentuação
UPDATE UF SET ESTADO = 'TOCANTINS' WHERE COD_UF = '17';

-- Limpeza para teste de reimportação
DELETE FROM UF;


-- =============================================================================
-- 3. IMPORTAÇÃO (LOAD DATA)
-- =============================================================================

-- No MySQL 8.0, se você estiver usando o WorkBench ou VS Code remotamente,
-- pode ser necessário garantir que a opção 'local_infile' esteja ativa.
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\uf.csv' 
INTO TABLE UF
FIELDS TERMINATED BY '|' 
LINES TERMINATED BY '\n';

-- Verificação final
SELECT * FROM UF;