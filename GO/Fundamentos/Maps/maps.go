/*
RESUMO DIDÁTICO 1: CONCEITOS DE MAPS
Este script apresenta os Maps em Go, uma estrutura de dados que armazena pares de
chave-valor. Os pontos principais demonstrados são:
1. Tipagem Rígida: Ao declarar um map[string]string, todas as chaves DEVEM ser
   strings e todos os valores DEVEM ser strings.
2. Inicialização: O uso de chaves {} para criar o map já com dados.
3. Acesso e Modificação: Como adicionar novos pares após a criação do map
   usando a sintaxe usuario["chave"] = "valor".
*/

package main

import (
	"fmt"
)

func main() {
	fmt.Println("Maps")

	// Map simples: Chave string, Valor string
	usuario := map[string]string{
		"nome":      "Leonardo",
		"Sobrenome": "Aboud",
	}
	fmt.Println(usuario)

	/*
		RESUMO DIDÁTICO 2: MAPS ANINHADOS E MANIPULAÇÃO
		Go permite estruturas complexas onde o valor de um map pode ser outro map:
		1. Aninhamento: map[string]map[string]string cria uma estrutura de "árvore",
		   útil para dados JSON-like.
		2. Função delete: Uma função nativa do Go para remover chaves de um map.
		   Sintaxe: delete(mapa, "chave").
		3. Flexibilidade: Diferente dos Arrays, Maps são dinâmicos por natureza e
		   crescem conforme a necessidade sem precisar de funções como append.
	*/
	usuario2 := map[string]map[string]string{
		"Nome": {
			"primeiro": "Giulia",
			"ultimo":   "Iwamoto",
		},
		"curso": {
			"nome":      "Engenharia",
			"faculdade": "Cruzeiro do Sul",
		},
	}
	fmt.Println(usuario2)

	// Removendo uma chave (nota: no seu código original você tentou deletar "nome" em minúsculo,
	// mas a chave no map era "Nome" com N maiúsculo. Chaves são case-sensitive!)
	delete(usuario2, "Nome")
	fmt.Println(usuario2)

	// Adicionando uma nova chave aninhada dinamicamente
	usuario2["signo"] = map[string]string{
		"nome": "Peixe",
	}

	fmt.Println(usuario2)
}
