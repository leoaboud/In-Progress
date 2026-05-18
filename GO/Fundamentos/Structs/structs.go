/*
RESUMO DIDÁTICO:
Este script demonstra o uso de 'structs' em Go, que são coleções de campos que
permitem agrupar dados de diferentes tipos em uma única unidade lógica.
O código ilustra:
1. Definição de Struct: Como criar tipos customizados para representar entidades.
2. Composição (Aninhamento): O uso de uma struct ('endereco') como campo de
   outra struct ('usuario'), permitindo criar estruturas de dados complexas.
3. Formas de Inicialização:
   - Declaração seguida de atribuição campo a campo.
   - Atribuição por ordem de valores (requer todos os campos).
   - Atribuição com nomes de campos (permite omitir valores, assumindo o Zero Value).
*/

package main

import "fmt"

type usuario struct {
	nome     string
	idade    uint8
	endereco endereco
}

type endereco struct {
	logradouro string
	numero     uint8
}

func main() {
	fmt.Println("Arquivo Structs")

	// Exemplo 1: Declaração e depois atribuição de valores
	var u usuario
	u.nome = "Leonardo"
	u.idade = 27
	fmt.Println(u)

	// Exemplo 2: Criando uma struct separada para compor outra
	enderecoEx := endereco{"Rua dos bobos", 0}

	// Exemplo 3: Inicialização completa por ordem de declaração
	usuario2 := usuario{"Jessica", 32, enderecoEx}
	fmt.Println(usuario2)

	// Exemplo 4: Inicialização parcial usando nomes de campos (idade e endereco ficam zerados)
	usuario3 := usuario{nome: "Giulia"}
	fmt.Println(usuario3)
}
