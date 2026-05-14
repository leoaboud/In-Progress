/*
RESUMO DIDÁTICO:
Este script exemplifica a diferença entre passagem por valor e passagem por
referência utilizando ponteiros.

O código ilustra:
1. Passagem por Valor (Cópia): Variáveis comuns armazenam valores. Ao atribuir
   uma à outra, o Go cria uma cópia independente na memória.
2. Definição de Ponteiro: Um ponteiro (*) não armazena um valor comum, mas sim
   o endereço de memória de outra variável.
3. Operador de Endereço (&): Usado para extrair o endereço de memória de uma
   variável (ex: 'ponteiro = &variavel').
4. Desreferenciação (Dereferencing): O uso do '*' antes da variável ponteiro
   para acessar ou modificar o valor que está "guardado" naquele endereço.
*/

package main

import "fmt"

func main() {
	// EXEMPLO 1: Passagem por Valor
	// Alterar 'variavel2' não afeta 'variavel1' porque são cópias.
	var variavel1 int = 10
	var variavel2 int = variavel1

	fmt.Println(variavel1, variavel2)
	variavel1++
	fmt.Println(variavel1, variavel2)

	// EXEMPLO 2: Ponteiro (Referência)
	// 'ponteiro' guarda o local da memória. Alterar o valor via ponteiro
	// afeta todas as variáveis que "olham" para aquele endereço.
	var variavel3 int
	var ponteiro *int

	variavel3 = 100
	ponteiro = &variavel3 // 'ponteiro' recebe o endereço de 'variavel3'

	fmt.Println(variavel3, ponteiro)  // Imprime o valor e o endereço (ex: 0xc000...)
	fmt.Println(variavel3, *ponteiro) // Desreferenciação: acessa o valor no endereço

	variavel3 = 150
	fmt.Println(variavel3, *ponteiro) // O ponteiro reflete a mudança automaticamente
}
