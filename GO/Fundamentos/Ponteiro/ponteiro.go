/*
RESUMO DIDÁTICO:
Este script ilustra a diferença entre atribuição por valor e atribuição por
referência (ponteiros) na linguagem Go. O código demonstra:
1. Cópia por Valor: Ao atribuir uma variável comum a outra, o Go cria uma cópia
   independente na memória. Alterar a original não afeta a cópia.
2. Ponteiros (*int): Um ponteiro não armazena um valor numérico comum, mas sim o
   ENDEREÇO de memória de outra variável.
3. Operador de Endereço (&): Usado para obter o endereço de memória de uma variável.
4. Desreferenciação (*ponteiro): Usado para acessar ou "ver" o valor que está
   guardado dentro do endereço para o qual o ponteiro aponta.
*/

package main

import "fmt"

func main() {
	// Exemplo de Cópia por Valor
	var variavel1 int = 10
	var variavel2 int = variavel1

	fmt.Println(variavel1, variavel2) // 10 10

	variavel1++
	fmt.Println(variavel1, variavel2) // 11 10 (variavel2 não muda porque é uma cópia)

	// REFERÊNCIA DE MEMÓRIA (Ponteiros)
	fmt.Println("........................")

	var variavel3 int = 100
	var ponteiro *int // Declaração de um ponteiro que aponta para um tipo inteiro

	// Por padrão, um ponteiro não inicializado aponta para <nil>
	fmt.Println(variavel3, ponteiro)

	ponteiro = &variavel3 // O ponteiro agora recebe o ENDEREÇO de memória da variavel3

	// Imprime o valor da variável e o endereço hexadecimal contido no ponteiro
	fmt.Println(variavel3, ponteiro)

	variavel3 = 150

	// Ao usar *ponteiro, estamos "desreferenciando", ou seja, pegando o valor real
	// que está naquele endereço. Se variavel3 mudou, o ponteiro reflete isso.
	fmt.Println(variavel3, *ponteiro)
}
