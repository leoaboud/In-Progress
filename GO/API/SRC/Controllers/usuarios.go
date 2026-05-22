package controllers

import (
	banco "api/SRC/Banco"
	models "api/SRC/Models"
	repositorio "api/SRC/Repository"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
)

/*
RESUMO DIDÁTICO: Orquestração do Controller (Leitura, Deserialização e Persistência)

Este arquivo evoluiu de um esqueleto mockado para um controlador de produção. Sua função é 
agir como um intermediário: ele recebe os dados brutos da web, valida, aciona o banco e responde.

O código ilustra:
1. Captura de Payload ('ioutil.ReadAll'): Lê o fluxo de bytes brutos (Stream) contido no corpo 
   da requisição HTTP (`r.Body`). Esses bytes representam o JSON enviado pelo cliente (Postman/Frontend).
2. Deserialização / Unmarshal ('json.Unmarshal'): Converte os bytes do JSON em uma estrutura nativa 
   do Go (`models.Usuarios`). Passa-se o ponteiro da variável (`&usuario`) para que o pacote preencha 
   os campos correspondentes diretamente na memória.
3. Ciclo de Conexão Local ('banco.Conectar'): Abre o canal com o MySQL especificamente para esta 
   operação. O comando `defer db.Close()` garante que, assim que a função terminar de rodar, a 
   conexão seja devolvida ao pool, evitando sobrecarga no banco de dados.
4. Delegação de Negócio ('repositorio.Criar'): O controlador não escreve comandos SQL. Ele simplesmente 
   instancia o repositório e passa a struct preenchida. Toda a responsabilidade de manipulação do 
   banco fica isolada na camada certa.
5. Resposta Dinâmica ('w.Write'): Utiliza formatação de texto para devolver ao cliente uma confirmação 
   em formato de string contendo o número do ID que o banco acabou de gerar de forma automática.
*/

// CriarUsuario insere um novo usuário no sistema
func CriarUsuario(w http.ResponseWriter, r *http.Request) {
	// 1. Lê os bytes do corpo da requisição
	corpoRequest, erro := ioutil.ReadAll(r.Body)
	if erro != nil {
		log.Fatal(erro)
	}
	
	// 2. Transforma o JSON recebido na nossa struct de Usuário
	var usuario models.Usuarios
	if erro = json.Unmarshal(corpoRequest, &usuario); erro != nil {
		log.Fatal(erro) // Tratado o erro caso o JSON venha quebrado ou malformado
	}

	// 3. Abre a conexão com o banco de dados
	db, erro := banco.Conectar()
	if erro != nil {
		log.Fatal(erro)
	}
	defer db.Close() // Boa prática: Garante o fechamento da conexão ao final da função
	
	// 4. Instancia o repositório e executa a função de inserção no MySQL
	repositorio := repositorio.NovoRepositorioDeUsuario(db)
	usuarioID, erro := repositorio.Criar(usuario) 
	if erro != nil {
		log.Fatal(erro)
	}

	// 5. Devolve o status 201 (Created) e o ID criado para quem fez a requisição
	w.WriteHeader(http.StatusCreated)
	w.Write([]byte(fmt.Sprintf("Id inserido: %d", usuarioID)))
}

// BuscarUsuarios lista todos os usuários cadastrados
func BuscarUsuarios(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Buscando todos os usuarios!"))
}

// BuscarUsuario busca um usuário específico através de um ID
func BuscarUsuario(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Buscando usuario!"))
}

// AtualizarUsuario altera as informações de um usuário existente
func AtualizarUsuario(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Atualizando usuario!"))
}

// DeletarUsuario remove um usuário do sistema
func DeletarUsuario(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Deletando Usuario!"))
}