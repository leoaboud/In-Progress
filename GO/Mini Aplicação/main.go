/*
RESUMO DIDÁTICO:
Este script é o arquivo principal ('main.go') que inicializa e executa a aplicação
de linha de comando. Ele faz a ponte entre o seu código e o ambiente externo.

O código ilustra:
1. Importação de Pacote Local: Como importar o pacote que você criou (usando um
   alias 'app') para acessar a função 'Gerar'.
2. os.Args: O uso do pacote 'os' para capturar os argumentos que o usuário
   digita no terminal (ex: o nome do comando e as flags).
3. Ciclo de Vida: A chamada do método '.Run()', que efetivamente "liga" a
   aplicação e processa os comandos.
4. Gestão de Erros Críticos: O uso de 'log.Fatal' para encerrar o programa
   imediatamente e exibir uma mensagem caso a aplicação falhe ao iniciar.
*/

package main

import (
	"fmt"
	"app" // Importa o seu pacote interno com o alias 'app'
	"log"
	"os" // Pacote para interagir com o Sistema Operacional
)

func main() {
	fmt.Println("Iniciando a aplicação...")

	// 1. Instancia a configuração da aplicação definida no seu pacote
	aplicacao := app.Gerar()

	// 2. Executa a aplicação passando os argumentos do terminal (os.Args)
	// Se Run retornar um erro, o bloco 'if' captura e o log.Fatal encerra tudo.
	if erro := aplicacao.Run(os.Args); erro != nil {
		log.Fatal(erro)
	}
}