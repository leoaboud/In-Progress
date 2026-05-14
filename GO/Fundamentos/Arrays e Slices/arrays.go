/*
RESUMO DIDÁTICO 1: CONCEITOS BÁSICOS
Este script explora a diferença fundamental entre Arrays e Slices em Go:
1. Array: Possui tamanho FIXO. O tamanho faz parte do tipo do dado. Uma vez
   declarado, seu tamanho não muda.
2. Slice: É uma estrutura flexível e dinâmica construída "sobre" um array.
   Não possui tamanho fixo definido nos colchetes da declaração.
3. Função append: Exclusiva para Slices, permite adicionar itens dinamicamente.
4. Referência: Um slice criado a partir de um array aponta para o array original.
   Se o array mudar, o slice reflete a mudança (referência de memória).
*/

package main

import (
	"fmt"
	"reflect"
)

func main() {
	fmt.Println("Arrays e Slices")

	var array1 [5]string
	array1[0] = "Posição 1"
	fmt.Println(array1)

	array2 := [5]string{"Posição 1", "Posição 2", "Posição 3", "Posição 4", "Posição 5"}
	fmt.Println(array2)

	array3 := [...]int{1, 2, 3, 4, 5}
	fmt.Println(array3)

	slice := []int{10, 11, 12, 13, 14, 15, 16, 17}
	fmt.Println(slice)

	fmt.Println(reflect.TypeOf(slice))
	fmt.Println(reflect.TypeOf(array3))

	slice = append(slice, 18)
	fmt.Println(slice)

	slice2 := array2[1:3]
	fmt.Println(slice2)

	array2[1] = "Posição alterada"
	fmt.Println(slice2)

	// ----------------------------------------------------------------------------------------------

	fmt.Println("--------------------------------ARRAYS INTERNOS--------------------------------")
	/*
		RESUMO DIDÁTICO 2: ARRAYS INTERNOS E FUNÇÃO MAKE
		Aqui entramos no gerenciamento de memória de baixo nível do Go:
		1. Função make: Aloca um array interno e retorna um slice que aponta para ele.
		2. Length (len): É o número de elementos que o slice contém atualmente.
		3. Capacity (cap): É o número de elementos que o array interno pode suportar
		   antes de o Go precisar alocar um novo array maior.
		4. Redimensionamento Automático: Quando o 'len' ultrapassa o 'cap', o Go cria
		   um novo array interno (geralmente com o dobro da capacidade) e migra os dados.
	*/

	// make(tipo, len, cap)
	slice3 := make([]float32, 10, 11)
	fmt.Println(slice3)
	fmt.Println(len(slice3)) // Tamanho atual
	fmt.Println(cap(slice3)) // Capacidade total do array interno

	slice3 = append(slice3, 5)
	slice3 = append(slice3, 6) // Aqui o slice estoura a capacidade inicial de 11

	fmt.Println(slice3)
	fmt.Println(len(slice3))
	fmt.Println(cap(slice3)) // O Go dobrou a capacidade automaticamente!

	// Quando omitimos a capacidade, ela é igual ao tamanho inicial
	slice4 := make([]float32, 5)
	fmt.Println(slice4)
	slice4 = append(slice4, 10)
	fmt.Println(len(slice4))
	fmt.Println(cap(slice4))
}
