/*
RESUMO DIDÁTICO: Estruturação e Inicialização Automática de Rotas

Este arquivo define o modelo estrutural de uma rota na aplicação e implementa o motor que 
percorre e registra todas as rotas declaradas no roteador principal ('gorilla/mux').

O código ilustra:
1. Modelagem Base (Struct 'Rota'): Define o contrato do que compõe um endpoint ideal na API. 
   Qualquer rota criada no sistema obrigatoriamente precisa passar a URL (URI), o Verbo (Metodo), 
   a lógica (Funcao) e a flag de proteção de Token (RequerAutenticacao).
2. Tipo de Função Handler ('func(...)'): O campo 'Funcao' armazena diretamente a assinatura padrão 
   exigida pelo Go para lidar com eventos HTTP: um escritor de resposta e um ponteiro da requisição.
3. Registro Automatizado (Loop 'for range'): Em vez de registrar manualmente linha por linha no roteador 
   principal, o sistema lê dinamicamente a coleção 'rotasUsuarios' e configura o servidor de uma só vez.
4. Fluência de Métodos (Method Chaining): O método '.Methods()' é encadeado logo após o '.HandleFunc()' 
   para restringir o acesso àquele endpoint, garantindo que ele só responda ao verbo correto (ex: apenas POST).
*/
package rotas

import (
	"net/http"

	"github.com/gorilla/mux"
)


// Rota representa todas as propriedades estruturais que um endpoint da API deve possuir
type Rota struct {
	URI                string
	Metodo             string
	Funcao             func(http.ResponseWriter, *http.Request)
	RequerAutenticacao bool
}

// Configurar recebe um roteador vazio, injeta todas as rotas de usuários mapeadas e o retorna pronto
func Configurar(r *mux.Router) *mux.Router {
	// Copia o slice de configurações (declarado no arquivo vizinho) para a variável local
	rotas := rotasUsuarios 

	// Varre individualmente cada configuração de rota existente dentro do slice
	for _, rota := range rotas {
		// Vincula a URI à sua respectiva função de controle e amarra o método HTTP específico
		r.HandleFunc(rota.URI, rota.Funcao).Methods(rota.Metodo)
	}
	
	// Retorna o roteador com os novos caminhos configurados
	return r
}