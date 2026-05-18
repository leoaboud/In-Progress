/*
RESUMO DIDÁTICO:
Este script demonstra o uso da estrutura 'select' para gerenciar e receber
dados de múltiplos canais concorrentes de forma não-bloqueante entre si.

O código ilustra:
1. Canais com Tempos Diferentes: O 'canal1' recebe dados a cada 0.5 segundos,
   enquanto o 'canal2' recebe dados a cada 2 segundos.
2. O Problema do Bloqueio Comum: Se tentássemos ler sequencialmente usando
   '<-canal1' seguido de '<-canal2', o programa ficaria travado esperando
   o canal 2 e desperdiçaria várias mensagens prontas do canal 1.
3. Estrutura Select: O 'select' resolve isso monitorando ambos os canais ao
   mesmo tempo. Quem mandar mensagem primeiro ganha a execução daquele caso.
4. Loop Infinito Combinado: O 'for' externo garante que o 'select' continue
   escutando os canais indefinidamente à medida que novas mensagens chegam.
*/

package main

import (
	"fmt"
	"time"
)

func main() {
	// 1. Criação de dois canais independentes
	canal1, canal2 := make(chan string), make(chan string)

	// Goroutine 1: Envia dados rápido (a cada 500ms)
	go func() {
		for {
			time.Sleep(time.Millisecond * 500)
			canal1 <- "Canal 1"
		}
	}()

	// Goroutine 2: Envia dados lento (a cada 2s)
	go func() {
		for {
			time.Sleep(time.Second * 2)
			canal2 <- "Canal 2"
		}
	}()

	// 2. O Monitor Multiplexador
	for {
		select {
		case mensagemcanal1 := <-canal1:
			// Executado sempre que o canal1 tiver dados prontos
			fmt.Println(mensagemcanal1)

		case mensagemcanal2 := <-canal2:
			// Executado sempre que o canal2 tiver dados prontos
			fmt.Println(mensagemcanal2)
		}
	}
}
