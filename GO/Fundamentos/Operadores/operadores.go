/*
RESUMO DIDÁTICO:
Este script realiza um panorama completo dos operadores na linguagem Go, fundamentais
para a construção de qualquer lógica algorítmica. O código demonstra:
1. Operadores Aritméticos: Operações matemáticas básicas e a regra de ouro do Go:
   não é possível realizar operações entre tipos diferentes (ex: int16 + int32).
2. Atribuição: O uso de 'var' para declaração formal e ':=' para inferência curta.
3. Relacionais: Avaliam condições retornando um booleano (True/False).
4. Lógicos: Operadores AND (&&), OR (||) e NOT (!) para combinar expressões.
5. Unários e Compostos: Incremento (++), decremento (--) e atribuições
   abreviadas (+=, -=, *=, /=). Note que em Go, '++' é um statement e não uma expressão.
6. Estrutura Condicional: Uso do 'if/else' para controle de fluxo baseado em comparações.
*/

package main

import "fmt"

func main() {
	// ARITMETICOS
	soma := 1 + 2
	subtracacao := 1 - 2
	multiplicacao := 10 * 5
	resto := 10 % 2

	fmt.Println(soma, subtracacao, multiplicacao, resto)

	// Em Go, as variáveis precisam ter o mesmo tipo exato para operar
	var numero1 int16 = 10
	var numero2 int16 = 25
	soma2 := numero1 + numero2
	fmt.Println(soma2)

	// ATRIBUIÇÃO
	fmt.Println()
	fmt.Println("........................")
	var variavel string = "String"
	variavel2 := "String2"
	fmt.Println(variavel, variavel2)

	// RELACIONAIS
	fmt.Println(1 > 2)
	fmt.Println(1 >= 2)
	fmt.Println(1 == 2)
	fmt.Println(1 < 2)
	fmt.Println(1 <= 2)
	fmt.Println(1 != 2)

	//LOGICOS
	fmt.Println()
	fmt.Println("........................")
	verdadeiro, falso := true, false
	fmt.Println(verdadeiro && falso)
	fmt.Println(verdadeiro || falso)
	fmt.Println(!verdadeiro)
	fmt.Println(!falso)

	//UNÁRIOS
	fmt.Println()
	fmt.Println("........................")
	numero := 10
	numero++
	numero += 15
	fmt.Println(numero)

	numero--
	numero -= 20

	numero *= 3
	numero /= 10
	numero %= 3

	fmt.Println(numero)

	fmt.Println()
	fmt.Println("........................")
	var texto string
	if numero > 5 {
		texto = "numero maior 5"
	} else {
		texto = "numero menor 5"
	}

	fmt.Println(texto)
}
