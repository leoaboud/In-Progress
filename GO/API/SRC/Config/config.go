/*
RESUMO DIDÁTICO: Carregamento de Variáveis de Ambiente e Configuração Centralizada

Este arquivo é o ponto central de configuração do ecossistema do seu backend. Ele lê as variáveis 
armazenadas no arquivo oculto '.env' e monta as variáveis globais que o resto do sistema usará.

O código ilustra:
1. Variáveis Globais de Configuração: As variáveis 'StringConexaoBanco' e 'Porta' iniciam com valores 
   padrão e ficam disponíveis para qualquer outro pacote da API acessar (como o pacote de banco e o de roteamento).
2. Integração com o Pacote 'godotenv': A função 'godotenv.Load()' procura e lê o arquivo '.env' na raiz do 
   projeto, jogando todos aqueles valores de texto para dentro do ambiente do sistema operacional.
3. Conversão de Tipos com Fallback ('strconv.Atoi'): Como 'os.Getenv' sempre retorna textos (strings), 
   o código usa 'strconv.Atoi' para converter a porta para um número inteiro. Se essa leitura falhar (erro != nil), 
   o sistema adota uma porta padrão (9000) como plano de contingência (fallback).
4. Montagem Dinâmica de Strings ('fmt.Sprintf'): Junta de forma organizada o usuário, a senha e o nome do banco 
   extraídos do ambiente em uma única String de Conexão (DSN) padronizada que o driver do MySQL exige.
*/

package config

import (
	"fmt"
	"log"
	"os"
	"strconv"

	"github.com/joho/godotenv"
)

var (
	// StringConexaoBanco guardará a string de conexão estruturada para o MySQL
	StringConexaoBanco = " "
	
	// Porta guardará o número inteiro da porta lógica que o servidor vai escutar
	Porta              = 0
)

// Carregar inicializa as configurações lendo as variáveis de ambiente
func Carregar() {
	var erro error

	// Carrega e processa o arquivo contendo as credenciais locais
	if erro = godotenv.Load(); erro != nil {
		log.Fatal(erro)
	}

	// Busca a porta da API no ambiente e tenta convertê-la de String para Int
	Porta, erro = strconv.Atoi(os.Getenv("API_PORT"))
	if erro != nil {
		Porta = 9000 // Define a porta 9000 caso a variável não exista ou esteja corrompida
	}

	// Concatena as variáveis de credenciais no formato DSN aceito pelo driver de banco
	StringConexaoBanco = fmt.Sprintf("%s:%s@/%s?charset=utf8&parseTime=True&loc=Local",
		os.Getenv("DB_USUARIO"),
		os.Getenv("DB_SENHA"),
		os.Getenv("DB_NOME"),
	)
}