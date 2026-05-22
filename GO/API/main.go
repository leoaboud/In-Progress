/*
RESUMO DIDÁTICO: Ponto de Entrada (Entrypoint) e Inicialização do Servidor HTTP

Este arquivo representa a função principal ('main') e o coração da execução do seu backend. 
Sua responsabilidade única é orquestrar a inicialização das configurações fundamentais, 
carregar a malha de rotas e levantar o servidor web para escutar requisições externas.

O código ilustra:
1. Orquestração de Boot ('config.Carregar'): A primeira ação do sistema é ler e processar 
   as configurações globais do ambiente (como a porta da API e os dados de acesso ao banco), 
   garantindo que qualquer outro módulo tenha dados para trabalhar.
2. Acoplamento de Roteamento ('router.Gerar'): Invoca a fábrica de rotas para trazer o 
   multiplexador (roteador) completamente configurado com os endpoints e middlewares da aplicação.
3. Formatação Dinâmica de Strings ('fmt.Sprintf'): Transforma o número inteiro da porta lógica 
   (ex: 5000) em uma string de endereço local padronizada (ex: ":5000") exigida pelo ecossistema web do Go.
4. Escuta Ativa e Bloqueio ('http.ListenAndServe'): Inicializa o servidor HTTP nativo. Esta função 
   é blocante; ela mantém o programa rodando indefinidamente em loop, aguardando conexões.
5. Captura de Falhas Críticas ('log.Fatal'): Envolve o servidor web. Se a porta escolhida já estiver 
   sendo usada por outro programa ou houver uma falha grave na inicialização, o 'log.Fatal' 
   interrompe o programa imediatamente e imprime o relatório do erro no terminal.
*/
package main

import (
	config "api/SRC/Config"
	"api/SRC/router"
	"fmt"
	"log"
	"net/http"
)

func main() {
	// 1. Carrega todas as variáveis de ambiente necessárias (.env) para a memória
	config.Carregar()

	// 2. Instancia e configura o roteador principal (mux) contendo todos os endpoints da API
	r := router.Gerar()

	// 3. Exibe uma mensagem informativa no console indicando que o servidor está pronto
	fmt.Printf("Escutando na porta %d\n", config.Porta)

	// 4. Inicia efetivamente o servidor HTTP na porta especificada. 
	// Se algo der errado (ex: porta ocupada), o log.Fatal derruba a aplicação exibindo o erro.
	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%d", config.Porta), r))
}