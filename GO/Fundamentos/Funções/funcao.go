<<<<<<< HEAD
/*
RESUMO DIDÁTICO:
Este script explora a versatilidade das funções na linguagem Go. O código demonstra
conceitos fundamentais que tornam o Go poderoso para o desenvolvimento:
1. Parâmetros e Retornos: Funções com tipos definidos e a sintaxe simplificada
   quando múltiplos parâmetros compartilham o mesmo tipo (ex: n1, n2 int8).
2. Retornos Múltiplos: Uma característica marcante do Go, permitindo que uma
   função devolva mais de um valor simultaneamente.
3. Identificador "Blank" (_): Demonstra como ignorar um dos retornos de uma
   função quando ele não é necessário para a lógica atual.
4. Funções Anônimas: A capacidade de atribuir uma função a uma variável, tratando
   funções como tipos de "primeira classe" que podem ser passados e armazenados.
*/

package main

import "fmt"

// Função simples com retorno único
func somar(n1 int8, n2 int8) int8 {
	return n1 + n2
}

// Função com retornos múltiplos e parâmetros simplificados (n1, n2 compartilham o tipo)
func calculos(n1, n2 int8) (int8, int8) {
	soma := n1 + n2
	subtracao := n1 - n2
	return soma, subtracao
}

func main() {
	soma := somar(10, 20)
	fmt.Println(soma)

	// Função anônima atribuída a uma variável
	var f = func(txt string) string {
		fmt.Println(txt)
		return txt
	}

	resultado := f("Texto da funcao 1")
	fmt.Println(resultado)

	// Capturando ambos os retornos da função
	resultadoSomas, resultadoSubtracao := calculos(10, 20)
	fmt.Println(resultadoSomas, resultadoSubtracao)

	// Usando o identificador underline (_) para ignorar o segundo retorno
	resultadoSomas1, _ := calculos(10, 20)
	fmt.Println(resultadoSomas1)

	// Usando o identificador underline (_) para ignorar o primeiro retorno
	_, resultadoSubtracao1 := calculos(10, 20)
	fmt.Println(resultadoSubtracao1)
}
=======
/*
RESUMO DIDÁTICO:
Este script explora a versatilidade das funções na linguagem Go. O código demonstra
conceitos fundamentais que tornam o Go poderoso para o desenvolvimento:
1. Parâmetros e Retornos: Funções com tipos definidos e a sintaxe simplificada
   quando múltiplos parâmetros compartilham o mesmo tipo (ex: n1, n2 int8).
2. Retornos Múltiplos: Uma característica marcante do Go, permitindo que uma
   função devolva mais de um valor simultaneamente.
3. Identificador "Blank" (_): Demonstra como ignorar um dos retornos de uma
   função quando ele não é necessário para a lógica atual.
4. Funções Anônimas: A capacidade de atribuir uma função a uma variável, tratando
   funções como tipos de "primeira classe" que podem ser passados e armazenados.
*/

package main

import "fmt"

// Função simples com retorno único
func somar(n1 int8, n2 int8) int8 {
	return n1 + n2
}

// Função com retornos múltiplos e parâmetros simplificados (n1, n2 compartilham o tipo)
func calculos(n1, n2 int8) (int8, int8) {
	soma := n1 + n2
	subtracao := n1 - n2
	return soma, subtracao
}

func main() {
	soma := somar(10, 20)
	fmt.Println(soma)

	// Função anônima atribuída a uma variável
	var f = func(txt string) string {
		fmt.Println(txt)
		return txt
	}

	resultado := f("Texto da funcao 1")
	fmt.Println(resultado)

	// Capturando ambos os retornos da função
	resultadoSomas, resultadoSubtracao := calculos(10, 20)
	fmt.Println(resultadoSomas, resultadoSubtracao)

	// Usando o identificador underline (_) para ignorar o segundo retorno
	resultadoSomas1, _ := calculos(10, 20)
	fmt.Println(resultadoSomas1)

	// Usando o identificador underline (_) para ignorar o primeiro retorno
	_, resultadoSubtracao1 := calculos(10, 20)
	fmt.Println(resultadoSubtracao1)
}
>>>>>>> 35d8bc2adc6a8969b1fee9f1cdfabbe0b2012b59
