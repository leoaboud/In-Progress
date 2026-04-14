/*******************************************************************************
  SCRIPT DE ESTUDO: BACKUP E RECOVERY (MYSQLDUMP)
  PADRONIZAÇÃO: LINHA DE COMANDO E DIRETÓRIOS EAD.
*******************************************************************************/

-- =============================================================================
-- 1. ESTRATÉGIAS DE BACKUP (EXPORTAÇÃO)
-- EXECUTADOS NO PROMPT DE COMANDO DO SISTEMA OPERACIONAL (CMD/POWERSHELL).
-- =============================================================================

-- Backup completo de um único banco de dados
mysqldump -u root -p curso > C:\EAD\MYSQL\backup\arquivo_bk1.sql

-- Backup de uma tabela específica (Ex: senso)
mysqldump -u root -p curso senso > C:\EAD\MYSQL\backup\arquivo_bk2.sql

-- Backup de múltiplas tabelas (Ex: senso e material)
mysqldump -u root -p curso senso material > C:\EAD\MYSQL\backup\arquivo_bk3.sql

-- Backup de vários bancos de dados simultaneamente
mysqldump -u root -p --databases curso sakila > C:\EAD\MYSQL\backup\backup_dbs.sql

-- Backup total da instância (Todos os bancos, usuários e privilégios)
mysqldump -u root -p --all-databases > C:\EAD\MYSQL\backup\backup_geral.sql

-- BACKUP ESSENCIAL: Incluindo Procedures, Functions e Triggers
-- Fundamental para quem desenvolve lógica dentro do banco de dados.
mysqldump -u root -p --routines --triggers curso > C:\EAD\MYSQL\backup\curso_bk.sql


-- =============================================================================
-- 2. ESTRATÉGIAS DE RESTORE (IMPORTAÇÃO)
-- CERTIFIQUE-SE DE QUE O BANCO DE DESTINO EXISTE ANTES DE RESTAURAR.
-- =============================================================================

-- Preparação: Criando um banco de teste para validação do backup
-- (Comando executado dentro do MySQL)
CREATE DATABASE CURSO_TESTE;

-- Restore simples no banco original
mysql -u root -p curso < C:\EAD\MYSQL\backup\arquivo_bk1.sql

-- Restore do backup em um banco de dados diferente (Migração de dados)
mysql -u root -p curso_teste < C:\EAD\MYSQL\backup\arquivo_bk1.sql

-- Restore total da instância
mysql -u root -p < C:\EAD\MYSQL\backup\backup_geral.sql

-- Importação de backup completo (Dados + Lógica/Routines)
mysql -u root -p curso_teste < C:\EAD\MYSQL\backup\curso_bk.sql