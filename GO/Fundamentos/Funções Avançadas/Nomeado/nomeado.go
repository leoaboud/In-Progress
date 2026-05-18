/*
RESUMO DIDÁTICO:
Este script exemplifica o funcionamento de funções em Go, destacando a
capacidade da linguagem de retornar mais de um valor simultaneamente e o
uso de retornos nomeados.

O código ilustra:
1. Retorno Nomeado (Named Return): Os valores de retorno são declarados com
   nomes ('soma', 'subtracao') na assinatura da função. Isso cria variáveis
   locais prontas para uso dentro da função.
2. Naked Return (Retorno Limpo): Como os retornos já foram nomeados, basta
   usar a palavra 'return' sozinha. O Go entende automaticamente que deve
   enviar os valores atuais das variáveis de retorno.
3. Atribuição Múltipla: No 'main', capturamos os dois resultados da função
   de uma só vez em duas variáveis distintas usando o operador ':='.
*/

package main

import "fmt"

// Função com dois parâmetros (int) e dois retornos nomeados (int)
func calculomatematico(n1, n2 int) (soma int, subtracao int) {
	soma = n1 + n2
	subtracao = n1 - n2
	return // Retorna automaticamente as variáveis 'soma' e 'subtracao'
}

func main() {
	// Capturando os múltiplos retornos
	soma, subtracao := calculomatematico(10, 20)
	fmt.Println(soma, subtracao)
}
