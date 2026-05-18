/*
RESUMO DIDÁTICO:
Este script demonstra como o Go lida com situações de erro catastrófico e como
é possível interromper o encerramento do programa usando pânico e recuperação.

O código ilustra:
1. Panic: Uma interrupção abrupta do fluxo normal. É usado quando o programa
   encontra um estado onde não pode ou não deve continuar a execução.
2. Recover: Uma função especial que recupera o controle de um programa em
   pânico. Ela "captura" o pânico e permite que a execução continue.
3. Defer + Recover: O 'recover' só funciona se for chamado dentro de uma
   função adiada (defer), pois quando o pânico ocorre, o Go limpa a pilha
   executando apenas os defers antes de travar.
4. Fluxo de Controle: Como o pânico interrompe tudo, o 'recover' é a única
   forma de fazer com que o código após a chamada problemática seja executado.
*/

package main

import (
	"fmt"
)

// recuperar tenta capturar um pânico e evitar que o programa caia
func recuperar() {
	if r := recover(); r != nil {
		fmt.Println("Execução recuperada com sucesso!")
	}
}

func alunoaprovado(n1, n2 float64) bool {
	// IMPORTANTE: O defer deve estar no topo para garantir a recuperação
	defer recuperar()

	media := (n1 + n2) / 2

	if media > 6 {
		return true
	} else if media < 6 {
		return false
	}

	// Se a média for exatamente 6, o programa "entra em pânico"
	panic("A MÉDIA É EXATAMENTE 6!")
}

func main() {
	// Como a média é 6, o panic será acionado
	fmt.Println(alunoaprovado(6, 6))

	// Graças ao recover, esta linha será impressa. Sem ele, o programa morreria antes.
	fmt.Println("Pós execução (O programa continuou vivo)")
}
