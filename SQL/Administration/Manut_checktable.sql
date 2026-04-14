/*******************************************************************************
  SCRIPT DE ESTUDO: MANUTENÇÃO E OTIMIZAÇÃO DE TABELAS
  PADRONIZAÇÃO: VÍRGULAS À DIREITA E DIAGNÓSTICO DE SAÚDE.
*******************************************************************************/

USE CURSO;

-- =============================================================================
-- 1. MANUTENÇÃO EM TABELAS MYISAM (EX: SENSO)
-- FOCO EM CORREÇÃO DE ERROS FÍSICOS E COMPACTAÇÃO.
-- =============================================================================

-- Verifica a integridade da tabela em busca de erros
CHECK TABLE SENSO QUICK;

-- Tenta reparar a estrutura da tabela caso o CHECK aponte erros
REPAIR TABLE SENSO QUICK;

-- Atualiza as estatísticas de distribuição de chaves (ajuda o otimizador)
ANALYZE TABLE SENSO;

-- Desfragmenta os dados e recupera espaço em disco após muitos DELETEs
OPTIMIZE TABLE SENSO;


-- =============================================================================
-- 2. MANUTENÇÃO EM TABELAS INNODB (EX: CAMPEONATO)
-- FOCO EM PERFORMANCE E ATUALIZAÇÃO DE ÍNDICES.
-- =============================================================================

-- Verifica se a estrutura lógica e os índices estão consistentes
CHECK TABLE CAMPEONATO QUICK;

-- Nota: Para InnoDB, o REPAIR geralmente não é suportado da mesma forma
REPAIR TABLE CAMPEONATO QUICK;

-- Coleta estatísticas detalhadas para melhorar o plano de execução das queries
ANALYZE TABLE CAMPEONATO;

-- Reconstrói a tabela para organizar os índices e liberar páginas vazias
OPTIMIZE TABLE CAMPEONATO;