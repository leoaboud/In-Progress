/*
RESUMO DIDÁTICO:
Este script demonstra o padrão Multiplexador (Fan-In). A ideia central é receber 
dados de múltiplos canais de entrada independentes e afunilá-los (unificá-los) 
em um único canal de saída.

O código ilustra:
1. Padrão Multiplexador: A função 'multiplexar' recebe dois canais de leitura 
   e gerencia uma goroutine interna que encaminha o que chegar neles para um canal só.
2. Acoplamento de Geradores: A função 'main' usa o resultado de dois geradores 
   ('escrever') diretamente como argumentos da função multiplexadora.
3. Tempo Randômico: O uso de 'rand.Intn(2000)' faz com que cada gerador envie 
   mensagens em intervalos totalmente imprevisíveis (entre 0 e 2 segundos).
4. Otimização de Leitura: A 'main' não precisa saber qual canal está pronto, 
   ela apenas lê do 'canal' unificado 10 vezes.
*/

package main

import (
	"fmt"
	"math/rand"
	"time"
)

func main() {
	// 1. Criamos dois geradores e passamos os canais deles diretamente para o multiplexador
	canal := multiplexar(escrever("Olá mundo!"), escrever("Programando em GO"))

	// 2. Lemos as primeiras 10 mensagens que passarem pelo funil, independente de qual gerador veio
	for i := 0; i < 10; i++ {
		fmt.Println(<-canal)
	}
}

// A função recebe dois canais de entrada (leitura) e retorna um único canal de saída (leitura)
func multiplexar(canaldeEntrada1, canaldeEntrada2 <-chan string) <-chan string {
	canadeSaida := make(chan string)

	// Uma única goroutine monitora as duas entradas usando o select
	go func() {
		for {
			select {
			case mensagem := <-canaldeEntrada1:
				canadeSaida <- mensagem
			case mensagem := <-canaldeEntrada2:
				canadeSaida <- mensagem
			}
		}
	}()

	return canadeSaida // Retorna o canal unificado imediatamente
}

func escrever(texto string) <-chan string {
	canal := make(chan string)

	go func() {
		for {
			canal <- fmt.Sprintf("Valor recebido: %s", texto)
			// Sorteia um tempo de espera diferente a cada iteração
			time.Sleep(time.Millisecond * time.Duration(rand.Intn(2000)))
		}
	}()

	return canal
}