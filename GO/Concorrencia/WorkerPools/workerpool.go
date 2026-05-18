/*
RESUMO DIDÁTICO:
Este script demonstra o padrão 'Worker Pools', onde um grupo fixo de goroutines
(trabalhadores) consome tarefas de uma fila comum (canal de tarefas) e deposita
os dados processados em um canal de resultados.

O código ilustra:
1. Canais Direcionais (Directional Channels):
   - 'tarefas <-chan int': O worker só pode LER deste canal.
   - 'resultados chan<- int': O worker só pode ESCREVER neste canal.
2. Divisão de Trabalho (Multiplexação): 4 trabalhadores idênticos operam de forma
   paralela/concorrente. O Go distribui as tarefas do canal automaticamente
   entre os que estiverem livres.
3. Fibonacci Recursivo: Uma função pesada computacionalmente, ideal para
   demonstrar o ganho de performance ao usar múltiplos núcleos do processador.
4. Fechamento Seguro: 'close(tarefas)' avisa aos workers que não há mais novos
   números vindo, fazendo com que o 'for range' dentro deles termine de forma limpa.
*/

package main

import "fmt"

func main() {
	limite := 30

	// Canais com buffer para evitar que os remetentes travem antes da hora
	tarefas := make(chan int, limite)
	resultados := make(chan int, limite)

	// 1. Inicializa o Worker Pool (4 trabalhadores em background)
	go worker(tarefas, resultados)
	go worker(tarefas, resultados)
	go worker(tarefas, resultados)
	go worker(tarefas, resultados)

	// 2. Produção: Alimenta a fila de tarefas
	for i := 0; i < limite; i++ {
		tarefas <- i
	}
	// Fecha o canal para que os loops 'range' dos workers saibam quando parar
	close(tarefas)

	// 3. Consumo: Coleta e imprime cada resultado à medida que ficam prontos
	for i := 0; i < limite; i++ {
		resultado := <-resultados
		fmt.Println(resultado)
	}
}

// Uso de canais direcionais na assinatura da função para proteção de escopo
func worker(tarefas <-chan int, resultados chan<- int) {
	for numero := range tarefas {
		resultados <- fibonacci(numero)
	}
}

func fibonacci(posicao int) int {
	if posicao <= 1 {
		return posicao
	}
	return fibonacci(posicao-1) + fibonacci(posicao-2)
}
