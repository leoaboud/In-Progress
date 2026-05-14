/*
RESUMO DIDÁTICO:
Este script demonstra o conceito de "Herança" em Go, tecnicamente chamado de
Composição ou Struct Embedding. Diferente de linguagens orientadas a objetos
tradicionais, Go não usa a palavra-chave 'extends'. Em vez disso, inserimos uma
struct dentro de outra sem dar um nome ao campo (campo anônimo).
O código ilustra:
1. Struct Embedding: A struct 'estudante' contém 'pessoa' diretamente.
2. Promoção de Campos: Como 'pessoa' é um campo anônimo, os campos de 'pessoa'
   (nome, idade, etc.) são "promovidos" para 'estudante', permitindo o acesso
   direto (ex: e1.nome em vez de e1.pessoa.nome).
3. Reuso de Código: Uma forma eficiente de compartilhar atributos entre
   diferentes entidades do sistema.
*/

package main

import "fmt"

type pessoa struct {
	nome      string
	sobrenome string
	idade     uint8
	altura    uint8
}

type estudante struct {
	pessoa    // Campo anônimo (Embedding)
	curso     string
	faculdade string
}

// Lembre-se: para executar, altere para 'func main'
func main() {
	fmt.Println("Herança (Composição)")

	p1 := pessoa{"Leonardo", "Aboud", 27, 170}
	fmt.Println(p1)

	// Inicializando estudante passando a struct pessoa pronta
	e1 := estudante{p1, "Engenharia", "Cruzeiro"}
	fmt.Println(e1)

	// Acesso direto ao campo promovido da struct 'pessoa'
	fmt.Println(e1.nome)
	fmt.Println(e1.sobrenome)
}
