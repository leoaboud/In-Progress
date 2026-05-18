
/*
RESUMO DIDÁTICO:
Este arquivo faz parte do pacote 'auxiliar' e ilustra o conceito de visibilidade
(encapsulamento) em Go. Na linguagem Go, a exportação de identificadores não utiliza
palavras-chave como 'public' ou 'private'; em vez disso, a visibilidade é determinada
pela letra inicial do nome da função, variável ou struct.
Neste exemplo, a função escrever2() inicia com letra minúscula, o que a torna um
identificador NÃO EXPORTADO. Isso significa que ela é privada ao pacote 'auxiliar',
sendo acessível por qualquer arquivo dentro desta mesma pasta, mas invisível para
o pacote 'main' ou qualquer outro pacote externo.
*/

package auxiliar

import "fmt"

// escrever2 inicia com letra minúscula, sendo uma função NÃO EXPORTADA (privada).
// Ela só pode ser chamada por outros arquivos dentro da pasta 'auxiliar'.
func escrever2() {
	fmt.Println("Escrevendo pela função escrever2")
}

/*
RESUMO DIDÁTICO:
Este arquivo faz parte do pacote 'auxiliar' e ilustra o conceito de visibilidade
(encapsulamento) em Go. Na linguagem Go, a exportação de identificadores não utiliza
palavras-chave como 'public' ou 'private'; em vez disso, a visibilidade é determinada
pela letra inicial do nome da função, variável ou struct.
Neste exemplo, a função escrever2() inicia com letra minúscula, o que a torna um
identificador NÃO EXPORTADO. Isso significa que ela é privada ao pacote 'auxiliar',
sendo acessível por qualquer arquivo dentro desta mesma pasta, mas invisível para
o pacote 'main' ou qualquer outro pacote externo.
*/

package auxiliar

import "fmt"

// escrever2 inicia com letra minúscula, sendo uma função NÃO EXPORTADA (privada).
// Ela só pode ser chamada por outros arquivos dentro da pasta 'auxiliar'.
func escrever2() {
	fmt.Println("Escrevendo pela função escrever2")
}

