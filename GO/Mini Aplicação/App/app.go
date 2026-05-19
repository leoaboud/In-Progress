/*
RESUMO DIDÁTICO:
Este script exemplifica a construção de uma aplicação de linha de comando robusta
que interage com protocolos de rede (DNS).

O código ilustra:
1. Uso de Pacotes Externos: Utilização da biblioteca 'urfave/cli' para gerenciar
   comandos, flags e a estrutura da aplicação CLI.
2. Definição de Comandos e Flags: Configuração de subcomandos ('ip' e 'Servidores')
   e parâmetros de entrada ('--host') que o usuário pode passar pelo terminal.
3. Callbacks (Action): Associação de uma função específica para ser executada
   quando um comando é chamado (ex: 'buscarIPs').
4. Pacote Net: Uso de funções nativas do Go ('LookupIP' e 'LookupNS') para
   resolver nomes de domínio e buscar endereços IP ou servidores de nome (NS).
5. Tratamento de Erros em CLI: Uso de 'log.Fatal' para encerrar a execução e
   exibir o erro caso a busca na rede falhe.
*/

package app

import (
	"fmt"
	"log"
	"net"

	"github.com/urfave/cli"
)

// Gerar cria e configura a estrutura da aplicação CLI
func Gerar() *cli.App {
	app := cli.NewApp()
	app.Name = "Aplicação de linha de comando"
	app.Usage = "Busca IPs e nomes de servidores"

	// Definição de parâmetros configuráveis
	flags := []cli.Flag{
		cli.StringFlag{
			Name:  "host",
			Value: "google.com.br", // Valor padrão
		},
	}

	// Registro dos comandos disponíveis na aplicação
	app.Commands = []cli.Command{
		{
			Name:   "ip",
			Usage:  "Busca IPs de endereços na internet",
			Flags:  flags,
			Action: buscarIPs,
		},
		{
			Name:   "servidores",
			Usage:  "Busca o nome dos servidores de nome (NS)",
			Flags:  flags,
			Action: buscarservidores,
		},
	}

	return app
}

// buscarIPs utiliza o pacote net para encontrar os IPs vinculados ao host
func buscarIPs(c *cli.Context) {
	host := c.String("host")

	ips, erro := net.LookupIP(host)
	if erro != nil {
		log.Fatal(erro)
	}

	for _, ip := range ips {
		fmt.Println(ip)
	}
}

// buscarservidores busca os Name Servers (NS) do host
func buscarservidores(c *cli.Context) {
	host := c.String("host")

	servidores, erro := net.LookupNS(host)
	if erro != nil {
		log.Fatal(erro)
	}

	for _, servidor := range servidores {
		fmt.Println(servidor.Host)
	}
}