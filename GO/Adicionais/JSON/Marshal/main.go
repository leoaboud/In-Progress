/*
RESUMO DIDÁTICO:
Este script exemplifica o processo de Marshal (conversão de dados nativos para JSON) 
usando o pacote 'encoding/json', abrangendo tanto Structs quanto Maps.

O código ilustra:
1. Struct Tags (Tags de Struct): Metadados definidos ao lado dos campos usando crases 
   (backticks ``) e NÃO acentos agudos (´´). Elas dizem ao Go como mapear as chaves 
   no arquivo JSON final (ex: transformar 'Nome' em 'nome' minúsculo).
2. Representação em Bytes: A função 'json.Marshal' não retorna um texto direto, 
   mas sim um slice de bytes ([]byte). Se impresso direto, exibe apenas números.
3. Buffer de Bytes: O uso de 'bytes.NewBuffer' converte esse slice de bytes de 
   volta em uma string legível para humanos no console.
4. Flexibilidade do Marshal: Demonstração de que o Go consegue serializar tanto 
   uma estrutura rígida (struct) quanto uma estrutura dinâmica (map).
*/

package main

import (
	"bytes"
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
	c := cachorro{"Sushi", "Yorki", 5}

	// json.Marshal transforma a struct em um slice de bytes ([]byte)
	cachorroemJSON, erro := json.Marshal(c)
	if erro != nil {
		log.Fatal(erro)
	}
	
	// Imprime os números dos bytes brutos (ex: [123 34 110 111...])
	fmt.Println("Bytes puros:", cachorroemJSON)

	// Converte os bytes em texto JSON legível
	fmt.Println("JSON Convertido:", bytes.NewBuffer(cachorroemJSON))

	// Serializando um Map
	c2 := map[string]string{
		"nome": "Valentin",
		"raca": "Lulu da pomerânia",
	}
	
	fmt.Println("\n------------------------------------------------------\n")


	cachorro2emJSON, erro := json.Marshal(c2)
	if erro != nil {
		log.Fatal(erro)
	}
	
	fmt.Println("Bytes do Map:", cachorro2emJSON)
	fmt.Println("JSON do Map:", bytes.NewBuffer(cachorro2emJSON))
}