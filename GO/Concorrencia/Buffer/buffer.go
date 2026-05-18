/*
RESUMO DIDÁTICO:
Este script demonstra o uso de Canais com Buffer (Buffered Channels).
A diferença fundamental é que eles permitem enviar dados sem que haja
obrigatoriamente um receptor pronto no exato momento.

O código ilustra:
1. Definição de Capacidade: 'make(chan tipo, capacidade)'. O número '2'
   indica que o canal pode armazenar até dois itens antes de "travar".
2. Execução Sequencial: Diferente do exemplo anterior, aqui não usamos uma
   'go routine' separada para o envio. Conseguimos enviar os dados na
   própria função 'main' porque o buffer permite esse armazenamento temporário.
3. Comportamento de Bloqueio:
   - Se tentássemos enviar um terceiro item ('canal <- "3"'), o programa
     travaria (deadlock), pois o buffer estaria cheio.
   - O bloqueio só ocorre quando a capacidade é excedida ou quando tentamos
     ler de um canal vazio.
*/

package main

import "fmt"

func main() {
	// 1. Criamos um canal com espaço para 2 strings
	canal := make(chan string, 2)

	// 2. Enviamos dados. A Main NÃO bloqueia aqui porque há espaço no buffer.
	canal <- "Olá mundo"
	canal <- "Programando em GO!"

	// Se adicionássemos a linha abaixo, teríamos um DEADLOCK:
	// canal <- "Terceira mensagem"

	// 3. Retiramos os dados do buffer
	mensagem := <-canal
	mensagem2 := <-canal

	fmt.Println(mensagem)
	fmt.Println(mensagem2)
}
