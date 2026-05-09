/*
RESUMO DIDÁTICO:
Este script detalha a tipagem estática da linguagem Go, demonstrando como a linguagem
trata diferentes categorias de dados. O código explora:
1. Inteiros com sinal (int64) e sem sinal (uint32).
2. Aliases importantes: 'rune' (int32 para caracteres Unicode) e 'byte' (uint8).
3. Números reais: Precisão simples (float32) e dupla (float64), além da inferência.
4. Strings e Chars: A diferença entre aspas duplas (string) e aspas simples (int32/char).
5. Zero Values: Como o Go inicializa variáveis vazias (ex: string como "", bool como false).
6. Tipos Especiais: O tipo 'error', fundamental para o fluxo de exceções da linguagem.
*/

package main

import (
	"errors"
	"fmt"
)

func main() {
	// Inteiros de diversos tamanhos e comportamentos
	var numero1 int64 = 1000000000
	fmt.Println(numero1)

	var numero2 uint32 = 1000
	fmt.Println(numero2)

	// Rune é um alias para int32 (representa um ponto de código Unicode)
	var numero3 rune = 12456
	fmt.Println(numero3)

	// Byte é um alias para uint8
	var numero4 byte = 123
	fmt.Println(numero4)

	// Números de ponto flutuante
	var numeroreal1 float32 = 123.45
	fmt.Println(numeroreal1)

	var numeroreal2 float64 = 1230000000000.45
	fmt.Println(numeroreal2)

	numeroreal3 := 12345.67
	fmt.Println(numeroreal3)

	// Manipulação de strings e inferência
	var str string = "TEXTO"
	fmt.Println(str)

	str2 := "Texto"
	fmt.Println(str2)

	// Aspas simples resultam no valor numérico da tabela ASCII/Unicode
	char := 'A'
	fmt.Println(char)

	texto := 5
	fmt.Println(texto)

	// Demonstração de Zero Values (valores padrão iniciais)
	var texto1 string
	fmt.Println(texto1) // Saída vazia

	var booleanol bool
	fmt.Println(booleanol) // Saída: false

	// Tratamento de Erros
	var erro1 error
	fmt.Println(erro1) // Saída: <nil>

	var erro2 error = errors.New("Erro interno")
	fmt.Println(erro2)
}
