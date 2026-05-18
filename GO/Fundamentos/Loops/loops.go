/*
RESUMO DIDÁTICO:
Este script explora as diversas formas de utilizar a cláusula 'for' em Go,
que é a única estrutura de repetição da linguagem, mas que assume diferentes
comportamentos dependendo da sintaxe.

O código ilustra:
1. For como "While": O uso de uma condição simples (i < 10) para repetir o bloco
   enquanto ela for verdadeira.
2. For Clássico (C-Style): A estrutura padrão com inicialização, condição e
   pós-execução (incremento de 2 em 2, por exemplo).
3. Cláusula 'range': A forma mais idiomática de iterar sobre coleções:
   - Arrays/Slices: Retorna o índice e o valor.
   - Strings: Retorna o índice e o código numérico (rune) de cada caractere.
   - Maps: Retorna a chave e o valor associado.
4. Manipulação de Tempo: Uso do pacote 'time' para pausar a execução (Sleep).
*/

package main

import (
	"fmt"
	"time"
)

func main() {
	i := 0

	// 1. Simulando um "while"
	for i < 10 {
		i++
		fmt.Println("incrementando i")
		time.Sleep(time.Second)
	}
	fmt.Println(i)

	// 2. Loop clássico com passo customizado (j += 2)
	for j := 0; j < 10; j += 2 {
		fmt.Println("Incremetando j", j)
		time.Sleep(time.Second)
	}

	// 3. Iterando sobre Arrays com range
	nomes := [3]string{"Leonardo", "Jessica", "Giulia"}

	for indice, nome := range nomes {
		fmt.Println(indice, nome)
	}

	// 4. Iterando sobre Strings (Cuidado: o valor 'letra' é uma rune/int32)
	for indice, letra := range "PALAVRA" {
		fmt.Println(indice, letra, string(letra))
	}

	// 5. Iterando sobre Maps (Chave e Valor)
	usuario := map[string]string{
		"nome":      "Leonardo",
		"Sobrenome": "Aboud",
	}

	for chave, valor := range usuario {
		fmt.Println(chave, valor)
	}
}
