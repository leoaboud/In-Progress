# =============================================================================
# MANUTENÇÃO VIA LINHA DE COMANDO (MYSQLCHECK)
# EXECUTAR NO PROMPT DO SISTEMA (FORA DO AMBIENTE SQL)
# =============================================================================

# 1. Reparo rápido de uma tabela específica (senso) no banco 'curso'
# O --quick tenta reparar sem reconstruir os dados, se possível.
mysqlcheck -u root -p curso senso --repair --quick

# 2. Reparo forçado com modo detalhado (-v de verbose)
# O --force ignora erros e continua o processo, detalhando cada etapa no terminal.
mysqlcheck -u root -p curso senso --repair --force -v

# 3. Verificação geral de todas as tabelas do banco 'curso'
# Útil para um check-up preventivo em todo o projeto de estudo.
mysqlcheck -u root -p curso -v

# 4. Reparo forçado em todas as tabelas do banco 'curso'
# Tenta corrigir inconsistências em qualquer tabela que apresente problemas no banco.
mysqlcheck -u root -p curso --repair --force -v