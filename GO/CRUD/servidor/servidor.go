package servidor

import (
	"crud/banco"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"strconv"

	"github.com/gorilla/mux"
)

/*
RESUMO DIDÁTICO: Handlers HTTP para um CRUD Completo em Go

Este arquivo centraliza a lógica de controle (Controllers/Handlers) de uma API REST de usuários, 
conectando requisições HTTP (feitas via roteador 'gorilla/mux') às operações do banco de dados relacional.

O código ilustra:
1. Padrão CRUD Completo: Implementa os 4 verbos HTTP essenciais: POST (Criar), GET (Ler todos/individual), 
   PUT (Atualizar) e DELETE (Remover).
2. Integração JSON-Struct: Usa tanto 'json.Unmarshal' (para transformar texto enviado pelo usuário 
   em structs do Go) quanto 'json.NewEncoder.Encode' (para transformar as structs em JSON de forma 
   eficiente direto no fluxo de resposta).
3. Prepared Statements (db.Prepare): Técnica obrigatória de segurança que pré-compila a query SQL 
   usando placeholders '?'. Isso blinda a aplicação contra ataques de SQL Injection e melhora a performance.
4. Captura de Parâmetros de Rota (mux.Vars): Extrai variáveis dinâmicas embutidas na URL (como o ID) 
   e usa o pacote 'strconv' para convertê-las de string para os formatos numéricos do Go (como 'uint32').
5. Status HTTP Corretos: Configura respostas semânticas para o cliente usando 'w.WriteHeader', retornando 
   201 (Created) para criações, 200 (OK) para buscas de sucesso e 204 (No Content) para atualizações/deleções.
*/

// Estrutura que mapeia o formato do usuário tanto no Go quanto nas chaves do JSON
type usuario struct {
	ID    uint32 `json:"id"`
	Nome  string `json:"nome"`
	Email string `json:"email"`
}

// CriarUsuario insere um novo registro no banco a partir de dados em JSON
func CriarUsuario(w http.ResponseWriter, r *http.Request) {
	// Lê todo o conteúdo binário bruto que veio no corpo (body) da requisição
	corpoRequisicao, erro := ioutil.ReadAll(r.Body)
	if erro != nil {
		w.Write([]byte("Falha ao ler o corpo da execucao"))
		return 
	}

	var usuario usuario 

	// Desserializa os bytes do JSON preenchendo o endereço de memória da struct usuário
	if erro = json.Unmarshal(corpoRequisicao, &usuario); erro != nil {
		w.Write([]byte("Erro ao converter o usuário para struct"))
		return
	}
	
	// Abre a conexão com o banco de dados através do pacote interno do projeto
	db, erro := banco.Conectar()
	if erro != nil {
		w.Write([]byte("Erro ao conectar no banco de dados"))
		return
	}

	// Cria uma instrução preparada para inserção segura contra SQL Injection
	statement, erro := db.Prepare(("insert into usuarios (nome, email) values (?, ?)"))
	if erro != nil {
		w.Write([]byte("Erro ao criar o statement"))
	}
	defer statement.Close() // Garante o fechamento do statement ao sair da função

	// Executa a inserção substituindo os placeholders pelos valores reais da struct
	insercao, erro := statement.Exec(usuario.Nome, usuario.Email)
	if erro != nil {
		w.Write([]byte("Erro ao criar o statement"))
		return
	}

	// Captura o ID auto-incremental gerado pelo MySQL para esta nova linha
	idInserido, erro := insercao.LastInsertId()
	if erro != nil {
		w.Write([]byte("Erro ao obter o Id inserido"))
		return
	}

	// Define o status HTTP como 201 (Created) e exibe uma mensagem de sucesso
	w.WriteHeader(http.StatusCreated)
	w.Write([]byte(fmt.Sprint("Usuario inserido com sucesso! Id: %d", idInserido)))
}

// BuscarUsuarios lê todas as linhas da tabela de usuários e as retorna em formato JSON
func BuscarUsuarios(w http.ResponseWriter, r *http.Request) {
	db, erro := banco.Conectar()
	if erro != nil {
		w.Write([]byte("Erro ao conectar com o banco de dados"))
	}
	defer db.Close() // Fecha a conexão do banco de dados ao fim da execução

	// Executa a query para obter todos os registros da tabela de usuários
	linhas, erro := db.Query("select * from usuarios")
	if erro != nil {
		w.Write([]byte("Erro ao buscar usuarios"))
	}
	defer linhas.Close() // Fecha o cursor de leitura após varrer os dados

	var usuarios []usuario
	
	// Loop que itera por cada registro/linha retornado pelo banco de dados
	for linhas.Next() {
		var usuario usuario

		// Copia os valores das colunas da linha atual para os campos da struct usuario
		if erro := linhas.Scan(&usuario.ID, &usuario.Nome, &usuario.Email); erro != nil {
			w.Write([]byte("Erro ao scanear o usúario"))
			return
		}
		// Adiciona a struct preenchida no slice (lista) de usuários
		usuarios = append(usuarios, usuario)
	}
	
	// Define o status HTTP como 200 (OK) e codifica a lista diretamente para JSON na resposta
	w.WriteHeader(http.StatusOK)
	if erro := json.NewEncoder(w).Encode(usuarios); erro != nil {
		w.Write([]byte("Erro ao converteert os usúarios para JSON"))
		return
	}
}

// BuscarUsuario extrai o ID da URL e retorna apenas o usuário correspondente
func BuscarUsuario(w http.ResponseWriter, r *http.Request) {
	// Captura o mapa de parâmetros dinâmicos da URL definidos pelo Gorilla Mux
	parametros := mux.Vars(r)
	
	// Converte o parâmetro "id" de string para um número inteiro decimal sem sinal de 32 bits (uint32)
	ID, erro := strconv.ParseUint(parametros["id"],10, 32)
	if erro != nil {
		w.Write([]byte("Erro ao converter o parâmetros para interior"))
		return
	}

	db, erro := banco.Conectar()
	if erro != nil {
		w.Write([]byte("Erro ao conectar com o banco de dados"))
		return
	}

	// Executa a busca filtrando a linha correspondente ao ID especificado
	linha, erro := db.Query("select * from usuarios where id =?", ID)
	if erro != nil {
		w.Write([]byte("Erro ao buscar usuario"))
		return
	}

	var usuario usuario
	// Se houver uma linha correspondente, faz o scan dos dados
	if linha.Next() {
		if erro := linha.Scan(&usuario.ID, &usuario.Nome, &usuario.Email); erro != nil {
			w.Write([]byte("Erro ao scanear usuario"))
		return
		}
	}

	// Converte a struct do usuário localizado e a envia de volta ao cliente em JSON
	if erro := json.NewEncoder(w).Encode(usuario); erro != nil {
		w.Write([]byte("Erro ao converter usuario para JSON"))
		return
	}
}

// AtualizarUsuario altera os dados de um usuário específico utilizando o ID na URL
func AtualizarUsuario(w http.ResponseWriter, r *http.Request) {
	parametros := mux.Vars(r)

	ID, erro := strconv.ParseUint(parametros["id"], 10, 32)
	if erro != nil {
		w.Write([]byte("Erro ao ler o parâmetro para inteiro"))
		return
	}

	corpoRequisicao, erro := ioutil.ReadAll(r.Body)
	if erro != nil {
		w.Write([]byte("Erro ao ler o corpo da requisição!"))
		return
	}

	var usuario usuario
	if erro := json.Unmarshal(corpoRequisicao, &usuario); erro != nil {
		w.Write([]byte("Erro ao converter o usuario para struct"))
		return
	}

	db, erro := banco.Conectar()
	if erro != nil {
		w.Write([]byte("Erro ao conectar com o banco de dados"))
		return
	}
	defer db.Close()

	// Prepara a query de atualização com placeholders protegidos
	statememt, erro := db.Prepare("Update usuarios set nome = ?, email = ? where id = ?")
	if erro != nil {
		w.Write([]byte("Erro ao criar o statement"))
		return
	}
	defer statememt.Close()

	// Executa o update passando os novos valores e o ID identificador (ignorando o valor de retorno com '_')
	if _, erro := statememt.Exec(usuario.Nome, usuario.Email, ID); erro != nil {
			w.Write([]byte("Erro ao atualizar o usuario"))
		return
	}
	// Define o status HTTP como 204 (No Content), indicando alteração bem-sucedida sem corpo de resposta
	w.WriteHeader(http.StatusNoContent)
} 

// DeletarUsuario remove permanentemente do banco o registro correspondente ao ID informado
func DeletarUsuario(w http.ResponseWriter, r *http.Request) {
	parametro := mux.Vars(r)
	ID, erro := strconv.ParseUint(parametro["id"], 10, 32)
	if erro != nil {
		w.Write([]byte("Erro ao converter parametros para inteiro"))
		return
	}

	db, erro := banco.Conectar()
	if erro != nil {
		w.Write([]byte("Erro ao conectar com o banco de dados"))
		return
	}
	defer db.Close()

	// Prepara o statement de remoção contendo a cláusula WHERE
	statement, erro := db.Prepare("delete from usuarios where id = ?")
	if erro != nil {
		w.Write([]byte("Erro ao criar o statement"))
		return
	}
	defer statement.Close()

	// Executa o comando delete injetando o ID recebido por parâmetro
	if _, erro := statement.Exec(ID); erro != nil {
		w.Write([]byte("Erro ao deletar o usuario!"))
		return
	}
	// Retorna o status HTTP 204 (No Content) sinalizando sucesso completo
	w.WriteHeader(http.StatusNoContent)
}