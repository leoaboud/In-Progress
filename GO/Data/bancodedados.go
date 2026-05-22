/*
RESUMO DIDÁTICO: Carregamento do arquivo .env e Consulta com Varredura de Dados (Scan)

Este script demonstra como ler credenciais confidenciais de um arquivo de configuração (.env) 
local para conectar-se ao banco de dados MySQL e processar os registros retornados.

O código ilustra:
1. Injeção de Ambiente ('godotenv.Load'): Lê o arquivo '.env' no mesmo diretório e disponibiliza 
   seus valores para o sistema operacional antes que a tentativa de conexão aconteça.
2. Interpolação de String ('fmt.Sprintf'): Junta as variáveis de ambiente recuperadas por 
   'os.Getenv' em uma única string, mantendo dados sensíveis ocultos do código-fonte.
3. Leitura Avançada de Registros ('linhas.Next'): Executa um loop que move o ponteiro do cursor 
   do banco linha por linha. Retorna 'false' automaticamente quando chega ao fim dos dados.
4. Mapeamento de Memória ('linhas.Scan'): Extrai os valores das colunas da linha atual e os copia 
   para os endereços de memória das variáveis locais (`&id`, `&nome`, `&email`). A ordem das 
   variáveis precisa bater perfeitamente com a ordem das colunas da tabela.
5. Checagem de Erros Pós-Loop ('linhas.Err'): Uma boa prática essencial em Go. Verifica se o loop 
   terminou por ter lido tudo com sucesso ou se foi interrompido no meio por uma falha de rede.
*/
package main

import (
	"data/sql"
	"fmt"
	"log"
	"os"

	_ "github.com/go-sql-driver/mysql"
	"github.com/joho/godotenv"
)

func main() {
	// Carrega o arquivo .env localizado na mesma pasta do arquivo atual
	if err := godotenv.Load(); err != nil {
		log.Fatal("Erro ao carregar o arquivo .env: ", err)
	}

	// Monta a string de conexão puxando as variáveis do ambiente de forma segura
	stringConexao := fmt.Sprintf("%s:%s@tcp(127.0.0.1:3306)/%s?charset=utf8&parseTime=True&loc=Local",
		os.Getenv("DB_USUARIO"),
		os.Getenv("DB_SENHA"),
		os.Getenv("DB_NOME"),
	)

	// Prepara e configura os parâmetros da conexão com o driver do MySQL
	db, err := sql.Open("mysql", stringConexao)
	if err != nil {
		log.Fatal("Erro ao configurar a conexão: ", err)
	}
	defer db.Close() // Garante o fechamento do banco de dados ao final da função main

	// Dispara o ping que realmente testa se a conexão com o banco foi bem-sucedida
	err = db.Ping()
	if err != nil {
		log.Fatal("Não foi possível conectar ao banco de dados: ", err)
	}

	fmt.Println("Conexão realizada com sucesso total! Conectado ao MySQL 🚀")

	// Executa uma consulta SQL direta na tabela 'usuarios'
	linhas, err := db.Query("select id, nome, email from usuarios")
	if err != nil {
		log.Fatal(err)
	}
	defer linhas.Close()

	// Loop para percorrer cada linha retornada do banco de dados
	for linhas.Next() {
		// 1. Crie variáveis locais para armazenar o valor de cada coluna
		var id int
		var nome string
		var email string

		// 2. Use o Scan para copiar os dados da linha atual para as variáveis
		// IMPORTANTE: A ordem aqui deve ser a mesma ordem das colunas no seu 'select'
		err := linhas.Scan(&id, &nome, &email)
		if err != nil {
			log.Fatal("Erro ao ler os dados da linha: ", err)
		}

		// 3. Agora exibe os dados reais no terminal!
		fmt.Printf("ID: %d | Nome: %s | Email: %s\n", id, nome, email)
	}

	// Verifica se houve algum erro durante a iteração das linhas
	if err = linhas.Err(); err != nil {
		log.Fatal(err)
	}
}