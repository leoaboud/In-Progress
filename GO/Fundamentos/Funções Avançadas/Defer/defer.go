/*
RESUMO DIDÁTICO:
Este script demonstra o funcionamento da cláusula 'defer', que adia a execução
de uma função até o exato momento anterior ao retorno (return) da função que a contém.

O código ilustra:
1. Adiamanto de Execução: O 'defer' garante que uma instrução seja a última a
   ser executada, independentemente de quantos caminhos de 'return' existam.
2. Ordem de Pilha (LIFO): Se houver múltiplos 'defers', eles são executados na
   ordem inversa em que foram declarados (o último a ser "adiado" é o primeiro a rodar).
3. Uso Prático: É ideal para fechar conexões de banco de dados, arquivos ou
   exibir mensagens de finalização de processos.
*/

package main

import "fmt"

func funcao1() {
	fmt.Println("Executando a funcao 1")
}

func funcao2() {
	fmt.Println("Executando a funcao 2")
}

func aluno(n1, n2 float32) bool {
	// Este defer será executado logo antes de qualquer 'return' desta função
	defer fmt.Println("Média calculada e resultado retornado!")

	fmt.Println("Entrando na função aluno para verificar aprovação...")

	media := (n1 + n2) / 2

	if media >= 6 {
		return true
	}
	return false
}

func main() {
	// O defer aqui fará com que a funcao1 seja a última coisa do programa todo
	defer funcao1()
	funcao2()

	fmt.Println(aluno(7, 8))
}
