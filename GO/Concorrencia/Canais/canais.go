/*
RESUMO DIDÁTICO:
Este script demonstra o uso de Canais (Channels) para comunicação e
sincronização entre Goroutines.

O código ilustra:
1. Criação de Canais: 'make(chan tipo)' cria um canal que só transporta um
   tipo específico de dado.
2. Operações de Canal:
   - 'canal <- valor': Envia um dado para o canal (escrita).
   - 'valor := <- canal': Recebe um dado do canal (leitura).
3. Bloqueio (Blocking): O envio e a recepção em um canal sem buffer são
   bloqueantes. A função 'main' para no 'for range' e espera até que
   algo seja enviado.
4. Range e Close: O 'for mensagem := range canal' é uma forma elegante de
   receber dados continuamente até que o canal seja fechado com 'close(canal)'.
*/

package main

import (
	"fmt"
	"time"
)

func main() {
	// 1. Criamos o canal de comunicação
	canal := make(chan string)

	// 2. Disparamos a função em uma linha de execução separada
	go escrever("Olá mundo", canal)

	fmt.Println("Depois da função escrever (A Main continua rodando...)")

	// 3. A Main entra neste loop e FICA PARADA (bloqueada) esperando dados.
	// Ela só sai daqui quando o canal for fechado lá na função escrever.
	for mensagem := range canal {
		fmt.Println(mensagem)
	}

	fmt.Println("Fim do programa!")
}

func escrever(texto string, canal chan string) {
	time.Sleep(time.Second * 5) // Simula um atraso inicial

	for i := 0; i < 5; i++ {
		// Envia o texto para dentro do "cano"
		canal <- texto
		time.Sleep(time.Second)
	}

	// 4. MUITO IMPORTANTE: Fecha o canal. Sem isso, a 'main' esperaria
	// para sempre no loop (causando um deadlock).
	close(canal)
}
