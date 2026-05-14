/*
RESUMO DIDÁTICO 1: ESTRUTURA SWITCH TRADICIONAL
O 'switch' em Go é uma alternativa mais limpa ao encadeamento de múltiplos 'if/else'.
Diferenças importantes em relação a outras linguagens (como C ou Java):
1. Break Implícito: Em Go, você não precisa escrever 'break' ao final de cada case.
   O programa executa o case correspondente e sai do switch automaticamente.
2. Default: O bloco 'default' é executado caso nenhuma das condições anteriores
   seja atendida, funcionando como uma rede de segurança.
3. Tipagem: O valor avaliado deve ser do mesmo tipo dos valores nos cases.
*/

package main

import "fmt"

func diadasemana(numero int) string {
	switch numero {
	case 1:
		return "Domingo"
	case 2:
		return "Segunda - Feira"
	case 3:
		return "Terça - Feira"
	case 4:
		return "Quarta - Feira"
	case 5:
		return "Quinta - Feira"
	case 6:
		return "Sexta - Feira"
	case 7:
		return "Sábado"
	default:
		return "Número inválido"
	}
}

/*
RESUMO DIDÁTICO 2: SWITCH SEM VARIÁVEL E FALLTHROUGH
Go oferece variações flexíveis para o switch que permitem lógicas mais complexas:
1. Switch Sem Expressão: Ao usar 'switch' sem uma variável logo à frente,
   cada 'case' pode conter uma condição booleana completa (como se fossem vários if's).
2. Cláusula Fallthrough: Esta palavra-chave força o Go a executar o código do
   PRÓXIMO case sem avaliar a condição dele.
   *Atenção*: No seu exemplo, ao entrar no caso 1, o fallthrough fará o valor
   ser sobrescrito pelo caso 2 imediatamente.
*/
func diadasemana2(numero int) string {
	var diadasemana string
	switch {
	case numero == 1:
		diadasemana = "Domingo"
		fallthrough // Pula diretamente para a execução do próximo case
	case numero == 2:
		diadasemana = "Segunda - Feira"
	case numero == 3:
		diadasemana = "Terça - Feira"
	case numero == 4:
		diadasemana = "Quarta - Feira"
	case numero == 5:
		diadasemana = "Quinta - Feira"
	case numero == 6:
		diadasemana = "Sexta - Feira"
	case numero == 7:
		diadasemana = "Sábado"
	default:
		diadasemana = "Número inválido"
	}
	return diadasemana
}

func main() { // Corrigido de 'maisn' para 'main' para execução
	fmt.Println("Switch")

	dia := diadasemana(3)
	fmt.Println(dia)

	fmt.Println("---------------")

	// Testando o fallthrough: se passar 1, o resultado será "Segunda - Feira"
	dia2 := diadasemana2(1)
	fmt.Println(dia2)
}
