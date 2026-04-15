/*******************************************************************************
  PROJETO: MINI E-COMMERCE (MINI_EC) - AUTOMAÇÃO DE TAREFAS
  OBJETIVO: AGENDAMENTO DE ROTINAS (CLEANUP E EXPIRAÇÃO DE ASSINATURAS)
  PADRONIZAÇÃO: EVENT SCHEDULER E MANUTENÇÃO AUTOMÁTICA
*******************************************************************************/

USE CURSO;

-- 1. CONFIGURAÇÃO DO AMBIENTE
-- Verifica se o motor de eventos está ligado no servidor
SHOW VARIABLES LIKE '%event_scheduler%';

-- Habilita o agendador globalmente
SET GLOBAL EVENT_SCHEDULER = ON;

-- =============================================================================
-- 2. CRIAÇÃO DE EVENTOS DE TESTE (LOG DE SISTEMA)
-- =============================================================================

-- Evento que roda a cada 1 minuto para monitorar a saúde do banco
CREATE EVENT EVENT_SYSTEM_LOG
ON SCHEDULE EVERY 1 MINUTE
STARTS CURRENT_TIMESTAMP
DO INSERT INTO TESTE_EVENTO (MENSAGEM, DATA_HORA)
   VALUES ('Log de Verificação de Rotina', NOW());


-- =============================================================================
-- 3. CASO REAL: BLOQUEIO AUTOMÁTICO DE ASSINATURAS VENCIDAS
-- ESTA ROTINA RODA DIARIAMENTE ÀS 23:59 PARA ATUALIZAR O STATUS.
-- =============================================================================

CREATE EVENT EVENT_EXPIRE_SUBSCRIPTIONS
ON SCHEDULE EVERY 24 HOUR
STARTS '2026-04-14 23:59:00' -- Ajustado para sua data atual de estudo
DO UPDATE ASSINATURAS 
   SET SITUACAO = 'B' -- B: Bloqueado
   WHERE DATA_FIM = CURDATE() AND SITUACAO = 'A'; -- Apenas as que ainda estão Ativas


-- =============================================================================
-- 4. GERENCIAMENTO DE EVENTOS
-- =============================================================================

-- Listar todos os eventos ativos no banco atual
SHOW EVENTS FROM CURSO;

-- Desativar temporariamente sem excluir
ALTER EVENT EVENT_EXPIRE_SUBSCRIPTIONS DISABLE;

-- Reativar ou alterar frequência (Ex: mudar para cada 12 horas)
ALTER EVENT EVENT_EXPIRE_SUBSCRIPTIONS 
      ON SCHEDULE EVERY 12 HOUR 
      ENABLE;