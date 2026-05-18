/*
RESUMO DIDÁTICO:
Este script demonstra a execução concorrente usando Goroutines.

O código ilustra:
1. A cláusula 'go': Ao colocar 'go' antes de uma chamada de função, você diz
   ao Go para executar essa função em uma "linha de execução" separada, sem
   esperar que ela termine para seguir para a próxima linha.
2. Concorrência vs Paralelismo: Aqui temos concorrência. O programa lida com
   duas tarefas (escrever "olá mundo" e "Programando em GO") ao mesmo tempo.
3. Função Main como "Maestra": Se a função 'main' terminar, todas as outras
   goroutines são interrompidas imediatamente, independentemente de terem
   concluído o trabalho.
4. O papel do Sleep: O 'time.Sleep' é usado aqui para que possamos observar
   as mensagens no terminal de forma pausada, caso contrário, o loop infinito
   travaria o processador ou imprimiria rápido demais.
*/

package main

import (
	"fmt"
	"time"
)

func main() {
	// Esta função inicia e o código JÁ PULA para a próxima linha
	go escrever("olá mundo!")

	// Esta função roda na linha de execução principal (main)
	// Como ela tem um loop infinito, o programa nunca sai daqui
	escrever("Programando em GO!")
}

func escrever(texto string) {
	for {
		fmt.Println(texto)
		time.Sleep(time.Second)
	}
}
