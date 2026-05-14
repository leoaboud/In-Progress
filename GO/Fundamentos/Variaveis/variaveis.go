/*
RESUMO DIDÁTICO:
Este script demonstra as formas de declaração e inicialização de variáveis e constantes em Go.

O código ilustra:
1. Declaração Padrão (var): Uso da palavra-chave 'var' com tipagem explícita.
2. Inferência de Tipo (:=): O operador curto que declara e inicializa a variável
   sem precisar dizer o tipo (o Go descobre pelo valor).
3. Bloco de Declaração: Agrupamento de múltiplas variáveis em um único 'var ()'.
4. Atribuição Múltipla e Swap: Como declarar várias variáveis em uma linha e como
   inverter os valores de duas variáveis (swap) de forma simples.
5. Constantes: Uso de 'const' para valores que não podem ser alterados durante a execução.
*/

package main

import (
	"fmt"
)

func main() {
	// 1. Declaração explícita com tipo
	var variavel1 string = "Variavel 1"

	// 2. Declaração curta (Short Declaration) - Tipagem automática
	variavel2 := "Variavel 2"

	// 3. Declaração em bloco (Organização)
	var (
		variavel3 string = "Variavel 3"
		variavel4 string = "Variavel 4"
	)

	// 4. Constante (Imutável)
	const constante1 string = "Constante 1"

	// 5. Declaração múltipla em uma linha
	variavel5, variavel6 := "Variavel 5", "Variavel 6"

	fmt.Println(variavel1)
	fmt.Println(variavel2)
	fmt.Println(variavel3, variavel4)
	fmt.Println(variavel5, variavel6)
	fmt.Println(constante1)

	// 6. Swap (Inversão de valores) sem variável auxiliar
	variavel5, variavel6 = variavel6, variavel5
	fmt.Println(variavel5, variavel6)
}
