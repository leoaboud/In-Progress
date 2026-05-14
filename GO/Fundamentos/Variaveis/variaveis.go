<<<<<<< HEAD
/*
RESUMO DIDÁTICO:
Este script demonstra as diferentes formas de declarar e inicializar variáveis na
linguagem Go. O exemplo abrange a declaração explícita com a palavra-reservada 'var'
(com e sem definição de tipo) e a declaração curta utilizando o operador ':=',
que permite ao compilador inferir o tipo do dado automaticamente. Além disso,
o código ilustra como realizar declarações múltiplas em bloco ou em uma única linha,
reforçando a característica de tipagem forte e estática da linguagem.
*/

package main

import (
	"fmt"
)

func main() {
	var variavel1 string = "Variavel 1"

	variavel2 := "Variavel 2"

	var (
		variavel3 string = "Variavel 3"
		variavel4 string = "Variavel 4"
	)

	const constante1 string = "Constante 1"
	variavel5, variavel6 := "Variavel 5", "Variavel 6"

	fmt.Println(variavel1)
	fmt.Println(variavel2)
	fmt.Println(variavel3, variavel4)
	fmt.Println(variavel5, variavel6)

	fmt.Println(constante1)

	variavel5, variavel6 = variavel6, variavel5
	fmt.Println(variavel5, variavel6)
}
=======
/*
RESUMO DIDÁTICO:
Este script demonstra as diferentes formas de declarar e inicializar variáveis na
linguagem Go. O exemplo abrange a declaração explícita com a palavra-reservada 'var'
(com e sem definição de tipo) e a declaração curta utilizando o operador ':=',
que permite ao compilador inferir o tipo do dado automaticamente. Além disso,
o código ilustra como realizar declarações múltiplas em bloco ou em uma única linha,
reforçando a característica de tipagem forte e estática da linguagem.
*/

package main

import (
	"fmt"
)

func main() {
	var variavel1 string = "Variavel 1"

	variavel2 := "Variavel 2"

	var (
		variavel3 string = "Variavel 3"
		variavel4 string = "Variavel 4"
	)

	const constante1 string = "Constante 1"
	variavel5, variavel6 := "Variavel 5", "Variavel 6"

	fmt.Println(variavel1)
	fmt.Println(variavel2)
	fmt.Println(variavel3, variavel4)
	fmt.Println(variavel5, variavel6)

	fmt.Println(constante1)

	variavel5, variavel6 = variavel6, variavel5
	fmt.Println(variavel5, variavel6)
}
>>>>>>> 35d8bc2adc6a8969b1fee9f1cdfabbe0b2012b59
