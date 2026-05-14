<<<<<<< HEAD
/*
RESUMO DIDÁTICO:
Este script demonstra a organização de projetos em Go através do uso de módulos e pacotes.
O código ilustra três níveis de importação:
1. Pacotes nativos (fmt): bibliotecas padrão da linguagem.
2. Pacotes internos (modulo/auxiliar): demonstra como referenciar funcionalidades
   criadas em diferentes pastas dentro do mesmo projeto, respeitando a estrutura
   [Nome do Módulo]/[Nome da Pasta].
3. Pacotes externos (checkmail): mostra a integração com bibliotecas de terceiros
   baixadas via 'go get', permitindo validar formatos de e-mail de forma profissional.
Este é o arquivo principal (package main), que centraliza a execução e orquestra
a comunicação entre esses diferentes componentes.
*/

package main

import (
	"fmt"
	"modulo/auxiliar" // Importação interna: [Nome do Módulo definido no go.mod]/[Pasta]

	"github.com/badoux/checkmail" // Importação externa: biblioteca de terceiros
)

func main() {
	// Exibe mensagem direta do arquivo principal
	fmt.Println("Escrevendo do arquivo main")

	// Chama a função exportada do pacote 'auxiliar'
	auxiliar.Escrever()

	// Utiliza o pacote externo para validar o formato de um e-mail
	// Retorna <nil> se o formato estiver correto ou um erro caso contrário
	erro := checkmail.ValidateFormat("devbook@gmail.com")
	fmt.Println(erro)
}
=======
/*
RESUMO DIDÁTICO:
Este script demonstra a organização de projetos em Go através do uso de módulos e pacotes.
O código ilustra três níveis de importação:
1. Pacotes nativos (fmt): bibliotecas padrão da linguagem.
2. Pacotes internos (modulo/auxiliar): demonstra como referenciar funcionalidades
   criadas em diferentes pastas dentro do mesmo projeto, respeitando a estrutura
   [Nome do Módulo]/[Nome da Pasta].
3. Pacotes externos (checkmail): mostra a integração com bibliotecas de terceiros
   baixadas via 'go get', permitindo validar formatos de e-mail de forma profissional.
Este é o arquivo principal (package main), que centraliza a execução e orquestra
a comunicação entre esses diferentes componentes.
*/

package main

import (
	"fmt"
	"modulo/auxiliar" // Importação interna: [Nome do Módulo definido no go.mod]/[Pasta]

	"github.com/badoux/checkmail" // Importação externa: biblioteca de terceiros
)

func main() {
	// Exibe mensagem direta do arquivo principal
	fmt.Println("Escrevendo do arquivo main")

	// Chama a função exportada do pacote 'auxiliar'
	auxiliar.Escrever()

	// Utiliza o pacote externo para validar o formato de um e-mail
	// Retorna <nil> se o formato estiver correto ou um erro caso contrário
	erro := checkmail.ValidateFormat("devbook@gmail.com")
	fmt.Println(erro)
}
>>>>>>> 35d8bc2adc6a8969b1fee9f1cdfabbe0b2012b59
