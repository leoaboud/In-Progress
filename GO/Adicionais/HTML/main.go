/*
RESUMO DIDÁTICO: O Servidor HTTP (main.go)

Este arquivo representa o "cérebro" da aplicação web, sendo responsável por 
gerenciar as requisições, as rotas e os dados do sistema.

O código ilustra:
1. Criação do Servidor ('net/http'): O Go utiliza a biblioteca padrão para escutar 
   uma porta lógica (porta 5000) e aguardar conexões vindas do navegador.
2. Definição de Rotas ('http.HandleFunc'): Mapeia uma URL específica (ex: '/home') 
   para uma função executável. Sempre que alguém entra nessa URL, essa função roda.
3. Carregamento e Cache ('template.ParseGlob'): Lê todos os arquivos '.html' da 
   pasta durante a inicialização do programa e os compila em memória para que 
   as páginas abram instantaneamente quando solicitadas.
4. Provedor de Dados: Cria a estrutura de dados na memória (a struct 'usuario' com 
   o Nome "Leonardo") e despacha essa informação junto com o comando de renderização.
*/

package main

import (
	"fmt"
	"html/template"
	"log"
	"net/http"
)

// Variável global que guardará todos os templates HTML carregados na memória
var templates *template.Template

type usuario struct {
	Nome  string
	Email string
}

func main() {
	// 1. Carrega todos os arquivos com a extensão .html que estão na mesma pasta
	// O template.Must serve como um "validador": se houver algum erro de sintaxe
	// no HTML, o programa dá um panic e nem inicia o servidor.
	templates = template.Must(template.ParseGlob("*.html"))

	// 2. Configura a rota /home e a função anônima que vai lidar com a requisição
	http.HandleFunc("/home", func(w http.ResponseWriter, r *http.Request) {
		u := usuario{"Leonardo", "leonardo@gmail.com"}
		
		templates.ExecuteTemplate(w, "home.html", u)
	})

	// 3. Inicializa o servidor web na porta 5000
	fmt.Println("Escutando a porta 5000")
	log.Fatal(http.ListenAndServe(":5000", nil))
}