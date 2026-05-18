/*
RESUMO DIDÁTICO:
Este script demonstra o uso de 'sync.WaitGroup' para sincronizar a execução
de múltiplas goroutines, garantindo que o programa principal espere a
conclusão de todas as tarefas.

O código ilustra:
1. sync.WaitGroup: Um contador interno que rastreia quantas tarefas estão rodando.
2. .Add(n): Incrementa o contador. Você avisa ao Go: "Vou rodar 'n' tarefas".
3. .Done(): Decrementa o contador em 1. Deve ser chamado quando a tarefa termina.
4. .Wait(): Bloqueia a execução da função principal até que o contador chegue a zero.
5. Funções Anônimas Concorrentes: O uso de 'go func() { ... }()' para disparar
   blocos de código como goroutines independentes.
*/

package main

import (
	"fmt"
	"sync"
	"time"
)

func main() {
	var waitgroup sync.WaitGroup

	// IMPORTANTE: Existe um erro lógico aqui no seu código original!
	// Você chamou Add(2), mas disparou 4 goroutines que chamam Done().
	// Isso causaria um erro (panic) de "negative WaitGroup counter".
	// O correto para 4 goroutines é Add(4).
	waitgroup.Add(4)

	go func() {
		escrever("Go Routine 1")
		waitgroup.Done() // -1 no contador
	}()

	go func() {
		escrever("Go Routine 2")
		waitgroup.Done() // -1 no contador
	}()

	go func() {
		escrever("Go Routine 3")
		waitgroup.Done() // -1 no contador
	}()

	go func() {
		escrever("Go Routine 4")
		waitgroup.Done() // -1 no contador
	}()

	// O programa para aqui até que o contador de tarefas volte a ser 0
	waitgroup.Wait()
}

func escrever(texto string) {
	for i := 0; i < 5; i++ {
		fmt.Println(texto)
		time.Sleep(time.Second)
	}
}
