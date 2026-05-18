/*
RESUMO DIDÁTICO:
Este script demonstra o padrão Generator. Em vez de a função 'main' criar
um canal e passá-lo para outra função, a própria função trabalhadora ('escrever')
cria, alimenta e devolve um canal pronto para ser consumido.

O código ilustra:
1. Padrão Generator: Uma função que encapsula o disparo de uma goroutine e
   retorna um canal de comunicação. Quem chama a função não precisa gerenciar
   a goroutine, apenas lê os dados produzidos.
2. Canal Somente de Leitura (<-chan string): A assinatura da função 'escrever'
   garante que o mundo externo só possa retirar dados do canal, protegendo-o
   contra escritas acidentais.
3. fmt.Sprintf: Uma forma de formatar strings unindo variáveis sem imprimi-las
   diretamente no console, retornando o texto formatado.
4. Controle do Consumidor: Embora a goroutine tenha um loop infinito ('for {}'),
   a 'main' dita o ritmo decidindo ler apenas 10 vezes ('i < 10') e depois encerrar.
*/

package main

import (
	"fmt"
	"time"
)

func main() {
	// 1. Chamamos a função que ativa o gerador e nos dá o canal preenchido
	canal := escrever("Olá Mundo")

	// 2. O consumidor manda na execução: pegamos apenas as 10 primeiras mensagens
	for i := 0; i < 10; i++ {
		// O código bloqueia aqui a cada 500ms esperando o gerador mandar o dado
		fmt.Println(<-canal)
	}

	// Ao sair do loop, a Main termina e encerra a goroutine em background automaticamente
}

// A seta antes de 'chan' (<-chan) diz que este canal é estritamente para LEITURA fora daqui
func escrever(texto string) <-chan string {
	canal := make(chan string)

	// Inicia o gerador em background de forma isolada
	go func() {
		for {
			canal <- fmt.Sprintf("Valor recebido: %s", texto)
			time.Sleep(time.Millisecond * 500)
		}
	}()

	// Retorna o canal imediatamente, sem esperar a goroutine terminar
	return canal
}
