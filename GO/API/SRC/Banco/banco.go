/*
RESUMO DIDÁTICO: Gerenciamento e Abertura de Conexões com o Banco de Dados

Este arquivo centraliza a lógica de infraestrutura para criar pontes de comunicação com o MySQL. 
Ele expõe uma função reutilizável que encapsula a inicialização, o teste de conectividade 
e o tratamento de falhas críticas de rede.

O código ilustra:
1. Reutilização de Módulos Internos ('config'): Importa o pacote de configuração customizado 
   do projeto para ler o valor de 'config.StringConexaoBanco' dinamicamente, sem fixar senhas 
   direto no código.
2. Inicialização Segura ('sql.Open'): Configura a estrutura do pool de conexões com o driver MySQL. 
   Se a string de conexão estiver malformada, o erro é interceptado imediatamente retornando 'nil'.
3. Validação de Conectividade ('db.Ping'): Executa uma chamada real de ida e volta ao servidor de banco. 
   Isso garante que o banco de dados não apenas exista, mas que esteja online e aceitando conexões de fato.
4. Desalocação em Caso de Falha ('db.Close'): Se o teste de ping falhar, a função fecha explicitamente 
   o pool instanciado ('db.Close()') antes de retornar o erro, evitando conexões fantasmas ou desperdício 
   de recursos em memória (vazamento de recursos).
*/

package banco

import (
	config "api/SRC/Config"
	"database/sql"

	_ "github.com/go-sql-driver/mysql"
)

// Conectar abre uma conexão com o banco de dados e a retorna se estiver tudo certo
func Conectar() (*sql.DB, error) {
	// Inicializa o pool de conexões utilizando os parâmetros configurados no pacote config
	db, erro := sql.Open("mysql", config.StringConexaoBanco)
	if erro != nil {
		return nil, erro // Retorna nil para o banco e despacha o erro de configuração
	}

	// Testa se a conexão com o servidor MySQL está ativa e autenticada
	if erro = db.Ping(); erro != nil {
		db.Close()       // Fecha os recursos alocados para não travar a memória do servidor
		return nil, erro // Retorna o erro de conexão real (ex: senha errada ou banco offline)
	}

	// Retorna o ponteiro do banco de dados pronto para uso e um erro nulo
	return db, nil
}