/*
RESUMO DIDÁTICO:
Este script demonstra o conceito de Recursividade, que ocorre quando uma
função chama a si mesma para resolver um problema.

O código ilustra:
1. Caso Base: A condição 'if posicao <= 1' que interrompe as chamadas
   recursivas. Sem isso, a função entraria em um loop infinito (stack overflow).
2. Chamada Recursiva: A função 'fibonacci' invoca a si mesma duas vezes
   para calcular a soma dos dois termos anteriores da sequência.
3. Tipagem uint: O uso de 'uint' (unsigned integer) garante que a posição
   seja sempre um número inteiro positivo.
*/

package main

import "fmt"

// fibonacci calcula o valor da sequência em uma posição específica
func fibonacci(posicao uint) uint {
	// 1. Caso Base: Evita que a função chame a si mesma para sempre
	if posicao <= 1 {
		return posicao
	}

	// 2. Passo Recursivo: A função se quebra em problemas menores
	return fibonacci(posicao-2) + fibonacci(posicao-1)
}

func main() {
	fmt.Println("Função recursiva")

	posicao := uint(10) // Reduzi de 1000 para 10 para o teste rodar instantaneamente

	// 3. Iteração: Imprimindo a sequência até a posição desejada
	for i := uint(0); i < posicao; i++ {
		fmt.Println(fibonacci(i))
	}
}
