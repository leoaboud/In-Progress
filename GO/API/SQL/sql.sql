-- Active: 1779398224141@@127.0.0.1@3306@devbook
/*
RESUMO DIDÁTICO: Criação de Tabelas e Restrições de Integridade em SQL

Este script define a estrutura da tabela 'usuarios' no banco de dados MySQL, aplicando 
regras fundamentais de modelagem relacional para garantir a consistência e segurança dos dados.

O código ilustra:
1. Verificações de Segurança ('IF NOT EXISTS' / 'IF EXISTS'): Evitam erros de execução caso o 
   banco já tenha sido criado ou tentem deletar uma tabela que ainda não exista no servidor.
2. Chave Primária Auto-Incremental ('AUTO_INCREMENT PRIMARY KEY'): Garante que cada usuário possua 
   um identificador único gerado automaticamente pelo banco, impedindo duplicidade de registros.
3. Restrição de Obrigatoriedade ('NOT NULL'): Bloqueia a inserção de linhas sem informações 
   essenciais, forçando o preenchimento de campos críticos como nome, nick, e-mail e senha.
4. Restrição de Unicidade ('UNIQUE'): Garante que nenhum usuário consiga se cadastrar com um 
   apelido (nick), e-mail ou senha idênticos aos de outra pessoa já armazenada.
5. Captura Automática de Data ('TIMESTAMP DEFAULT CURRENT_TIMESTAMP'): Preenche a coluna 'criadoEm' 
   com a data e hora exatas do momento do cadastro, sem depender de comandos vindos do backend.
6. Mecanismo de Armazenamento ('ENGINE=INNODB'): Define o motor de tabela padrão do MySQL para 
   sistemas modernos, habilitando suporte a transações (ACID) e chaves estrangeiras.
*/
CREATE DATABASE IF NOT EXISTS devbook;

USE devbook;

DROP TABLE IF EXISTS usuarios;

CREATE TABLE usuarios(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    nick VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(20) NOT NULL UNIQUE,
    criadoEm TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=INNODB;