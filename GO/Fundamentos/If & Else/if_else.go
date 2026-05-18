/*
RESUMO DIDÁTICO 1: CONDICIONAIS BÁSICAS
O controle de fluxo em Go através do 'if' e 'else' segue uma sintaxe limpa e
obrigatória quanto ao uso de chaves {}. Pontos principais:
1. Sem parênteses: Diferente de C ou Java, Go dispensa o uso de parênteses nas
   condições, a menos que seja para priorizar operações lógicas.
2. Escopo: O bloco de código só é executado se a expressão booleana resultar em true.
3. Rigidez: A chave de fechamento do 'if' e a palavra 'else' devem estar na
   mesma linha, caso contrário o compilador acusará erro.
*/

package main

import "fmt"

func main() {
	fmt.Println("Estrutura de controle")

	numero := 10

	// Condicional padrão
	if numero > 15 {
		fmt.Println("Maior que 15")
	} else {
		fmt.Println("Menor ou igual a 15")
	}

	/*
	   RESUMO DIDÁTICO 2: IF COM INIT (INICIALIZAÇÃO)
	   Go permite inicializar uma variável diretamente na declaração do 'if'.
	   Isso é extremamente útil para manter o código limpo:
	   1. Escopo Limitado: A variável criada (neste caso 'outro_numero') nasce e
	      morre dentro do bloco do if/else. Ela não existe fora dele.
	   2. Praticidade: Muito utilizado para capturar retornos de funções e já
	      validar se ocorreu um erro na mesma linha.
	   3. Else If: Permite encadear múltiplas verificações de forma lógica.
	*/
	if outro_numero := numero; outro_numero > 0 {
		fmt.Println("Número é maior que 0")
	} else if numero < -10 {
		fmt.Println("Número menor que -10")
	} else {
		fmt.Println("Entre 0 e -10")
	}

	// fmt.Println(outro_numero) // Se você descomentar esta linha, o código dará erro
	// pois a variável só existe dentro do if acima.
}
