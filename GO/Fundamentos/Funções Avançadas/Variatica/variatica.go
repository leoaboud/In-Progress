/*
RESUMO DIDÁTICO:
Este script apresenta as "Variadic Functions" (Funções Variádicas), que são
funções que podem receber um número indefinido de argumentos de um mesmo tipo.

O código ilustra:
1. Sintaxe do Prefixo Elipse (...): Ao declarar um parâmetro como '...tipo',
   o Go transforma todos os argumentos passados em um 'slice' daquele tipo.
2. Flexibilidade de Argumentos: A função pode receber zero, um ou dezenas
   de argumentos sem a necessidade de mudar sua assinatura.
3. Tratamento como Slice: Dentro da função, o parâmetro variádico (ex: 'numeros')
   é percorrido exatamente como um slice comum, utilizando o 'range'.
4. Restrição de Posicionamento: Em funções com múltiplos parâmetros (ex: 'escrever'),
   o parâmetro variádico DEVE ser obrigatoriamente o último da lista.
*/

package main

import "fmt"

// soma aceita qualquer quantidade de inteiros e os trata como um slice
func soma(numeros ...int) int {
	total := 0
	for _, numero := range numeros {
		total += numero
	}
	return total
}

// O parâmetro variádico '...int' deve vir por último
func escrever(texto string, numeros ...int) {
	for _, numero := range numeros {
		fmt.Println(texto, numero)
	}
}

func main() {
	// Exemplo 1: Passando 6 argumentos
	totaldasoma := soma(1, 2, 3, 4, 5, 6)
	fmt.Println(totaldasoma)

	// Exemplo 2: Passando zero argumentos (o slice interno será vazio/nil)
	totaldasoma2 := soma()
	fmt.Println(totaldasoma2)

	// Exemplo 3: Misturando parâmetros fixos e variádicos
	escrever("Olá mund", 10, 20, 30, 40, 50, 60)
}
