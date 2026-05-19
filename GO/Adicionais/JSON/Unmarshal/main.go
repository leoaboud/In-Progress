/*
RESUMO DIDÁTICO:
Este script consolida o conceito de Desserialização (Unmarshal) em Go, 
focando na sintaxe correta de conversão de tipos e passagem de ponteiros.

O código ilustra:
1. Alvos de Destino Rígidos vs. Dinâmicos: O preenchimento com sucesso de uma 
   'struct' (com campos e tipos predefinidos) e de um 'map' (coleção de chave/valor).
2. Conversão Explícita de Tipos: A função 'json.Unmarshal' aceita apenas fatias 
   de bytes ('[]byte'), exigindo a conversão da string original: '[]byte(textoJSON)'.
3. Exigência de Ponteiros (&): Para que o pacote 'encoding/json' consiga alterar 
   as variáveis 'c' e 'c2' diretamente na memória e persistir os dados decodificados, 
   é obrigatório passar os seus endereços usando o operador comercial '&'.
4. Tratamento de Erros em Escopo Curto: O uso do 'if erro := ...; erro != nil' 
   declara e avalia a variável de erro em uma única linha, mantendo o escopo limpo.
*/

package main

import (
	"encoding/json"
	"fmt"
	"log"
)

type cachorro struct {
	Nome  string `json:"nome"` 
	Raca  string `json:"raca"`
	Idade uint8  `json:"idade"`
}

func main() {
	cachorroemJSON := `{"nome":"Sushi","raca":"Yorki","idade":5}`

	var c cachorro

	if erro := json.Unmarshal([]byte(cachorroemJSON), &c); erro != nil {
		log.Fatal(erro)
	}
	fmt.Println("Struct preenchida:", c)

	cachorro2emJSON := `{"nome": "Valentin", "raca": "Lulu da pomerânia"}`

	fmt.Println("\n------------------------------------------------------\n")

	c2 := make(map[string]string)
	
	if erro := json.Unmarshal([]byte(cachorro2emJSON), &c2); erro != nil {
		log.Fatal(erro)
	}
	fmt.Println("Map preenchido:", c2)
}