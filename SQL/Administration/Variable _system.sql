/*******************************************************************************
  SCRIPT DE ESTUDO: GERENCIAMENTO DE VARIÁVEIS E CONEXÕES
  PADRONIZAÇÃO: VÍRGULAS À DIREITA E PERSISTÊNCIA NO MYSQL 8.0.
*******************************************************************************/

-- =============================================================================
-- 1. CONSULTA DE CONFIGURAÇÕES (VARIABLES)
-- =============================================================================

-- Lista todas as variáveis de configuração do servidor
SHOW VARIABLES;

-- Filtra variáveis por padrão de nome (Ex: hostname)
SHOW VARIABLES LIKE '%HOSTNAME%';

-- Consulta uma variável específica de fila de conexões
SHOW VARIABLES LIKE 'BACK_LOG';


-- =============================================================================
-- 2. AJUSTE DE VARIÁVEIS GLOBAIS E DE SESSÃO
-- =============================================================================

-- GLOBAL: Afeta todo o servidor (requer privilégio SUPER ou SYSTEM_VARIABLES_ADMIN)
SHOW VARIABLES LIKE 'DELAYED_INSERT_TIMEOUT';

-- No MySQL 8.0, prefira SET PERSIST para manter o valor após o RESTART
SET GLOBAL DELAYED_INSERT_TIMEOUT = 350; 

-- SESSION: Afeta apenas a sua conexão atual (ideal para testes de performance)
SHOW VARIABLES LIKE 'SORT_BUFFER_SIZE';

-- Ajustando o buffer de ordenação para a sessão atual
SET SESSION SORT_BUFFER_SIZE = 524288;


-- =============================================================================
-- 3. MONITORAMENTO DE STATUS E PROCESSOS
-- =============================================================================

-- Exibe contadores de desempenho (Queries executadas, conexões abertas, etc.)
SHOW STATUS;

-- Visualiza quem está conectado e o que está executando no momento
-- Essencial para identificar "gargalos" em Procedures complexas.
SHOW PROCESSLIST;

-- Comando para encerrar uma conexão travada
-- Use o ID encontrado na coluna 'Id' do SHOW PROCESSLIST
-- KILL 54;