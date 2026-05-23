/*
RESUMO DIDÁTICO: Métodos Controladores (Handlers Mockados) em Go

Este arquivo funciona como a camada de Controle (Controllers) da aplicação. Ele define as funções 
que serão disparadas quando as rotas correspondentes forem acionadas pelo servidor HTTP.

O código ilustra:
1. Padrão Mock/Esqueleto: As funções estão "mockadas", ou seja, contêm apenas um código temporário 
   simples (`w.Write`) para testar o fluxo de roteamento antes de implementar a lógica real com o banco de dados.
2. Assinatura Padrão de Handlers: Todas as funções seguem estritamente a assinatura exigida pela biblioteca 
   nativa do Go para lidar com web: `func(http.ResponseWriter, *http.Request)`.
3. Resposta de Texto Direta (`w.Write`): Usa o escritor de resposta (`w`) para enviar uma fatia de bytes 
   (`[]byte`) de volta para o cliente (navegador ou Postman), que será renderizada como o texto da página.
*/

package controllers

import "net/http"

// CriarUsuario insere um novo usuário no sistema
func CriarUsuario(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Criando usuario!"))
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