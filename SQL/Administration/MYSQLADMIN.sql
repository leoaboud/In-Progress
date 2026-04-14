# =============================================================================
# ADMINISTRAÇÃO DO SERVIDOR (MYSQLADMIN)
# EXECUTAR NO PROMPT DE COMANDO (CMD/TERMINAL)
# =============================================================================

# 1. DIAGNÓSTICO E MONITORAMENTO
# -----------------------------------------------------------------------------
# Exibe um resumo rápido do status (Uptime, Threads, Queries)
mysqladmin -u root -p status

# Exibe estatísticas detalhadas de desempenho do servidor
mysqladmin -u root -p extended-status

# Lista todas as variáveis de configuração do sistema
mysqladmin -u root -p variables

# Exibe os processos/conexões ativas no momento (útil para ver quem está travando o banco)
mysqladmin -u root -p processlist

# Derruba um processo específico (substitua 'num_processo' pelo ID do processlist)
mysqladmin -u root -p kill num_processo


# 2. MANUTENÇÃO E RECARREGAMENTO
# -----------------------------------------------------------------------------
# Recarrega os privilégios e tabelas de log
mysqladmin -u root -p reload

# Limpa todas as tabelas e arquivos de log (similar ao reload + flush-tables)
mysqladmin -u root -p refresh


# 3. COMANDOS DE LIMPEZA (FLUSH)
# -----------------------------------------------------------------------------
# Limpa o cache de hosts (útil se um IP for bloqueado por erros de conexão)
mysqladmin -u root -p flush-hosts

# Fecha todas as tabelas abertas e limpa o cache de tabelas
mysqladmin -u root -p flush-tables

# Limpa o cache de threads
mysqladmin -u root -p flush-threads

# Fecha e reabre os arquivos de log (útil para rotacionar logs de erro/queries)
mysqladmin -u root -p flush-logs

# Recarrega as tabelas de permissões (essencial após alterar usuários manualmente)
mysqladmin -u root -p flush-privileges

# Reseta as variáveis de status (zera os contadores do 'extended-status')
mysqladmin -u root -p flush-status


# 4. AJUDA
# -----------------------------------------------------------------------------
# Exibe a lista completa de comandos e opções do utilitário
mysqladmin -?