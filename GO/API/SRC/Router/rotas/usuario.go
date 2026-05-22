/*
RESUMO DIDÁTICO: Configuração de Rotas e Mapeamento de Endpoints em Go

Este arquivo funciona como a "tabela de direcionamento" (roteamento) para o módulo de usuários, 
centralizando a declaração de quais URLs a API aceita e como ela deve responder a cada uma delas.

O código ilustra:
1. Desacoplamento de Rotas (Slices): O uso de um slice (`[]Rota`) agrupa todas as configurações 
   especificas desse domínio em uma única estrutura de dados limpa, facilitando a manutenção.
2. Associação de Verbos HTTP (`Method`): Demonstra a aplicação do conceito REST, onde a mesma URI 
   (`/usuarios`) adota comportamentos completamente diferentes dependendo do método utilizado (POST cria, GET busca).
3. Parâmetros Dinâmicos de Rota (`{usuarioId}`): Uso de chaves na string da URL para sinalizar 
   variáveis curingas. Roteadores como o Gorilla Mux leem essa sintaxe para extrair IDs dinamicamente da URL.
4. Ponte Rota-Controller (`Funcao`): Cria um mapeamento direto passando a função do controlador (ex: `controllers.CriarUsuario`) 
   como um argumento. Ela será disparada como callback assim que a rota for acionada.
5. Flag de Segurança (`RequerAutenticacao`): Define um campo booleano que servirá como instrução para os 
   Middlewares do sistema, determinando se aquela rota específica exige ou não a validação de um Token JWT.
*/

package rotas

import (
	controllers "api/SRC/Controllers"
	"net/http"
)


var rotasUsuarios = []Rota{
	{
		URI:                "/usuarios",
		Metodo:             http.MethodPost, // Define o verbo HTTP POST para criação de registros
		Funcao:             controllers.CriarUsuario, // Executa a lógica de criação de usuário
		RequerAutenticacao: false, // Rota pública (ex: tela de cadastro inicial)
	},
	{
		URI:                "/usuarios",
		Metodo:             http.MethodGet, // Define o verbo HTTP GET para listagem geral
		Funcao:             controllers.BuscarUsuarios,
		RequerAutenticacao: false,
	},
	{
		URI:                "/usuarios/{usuarioId}", // O '{usuarioId}' captura o ID vindo diretamente na URL
		Metodo:             http.MethodGet, // Define o verbo HTTP GET para buscar um registro específico
		Funcao:             controllers.BuscarUsuario,
		RequerAutenticacao: false,
	},
	{
		URI:                "/usuarios/{usuarioId}",
		Metodo:             http.MethodPut, // Define o verbo HTTP PUT para atualizações completas de dados
		Funcao:             controllers.AtualizarUsuario,
		RequerAutenticacao: false,
	},
	{
		URI:                "/usuarios/{usuarioId}",
		Metodo:             http.MethodDelete, // Define o verbo HTTP DELETE para remoção do registro
		Funcao:             controllers.DeletarUsuario,
		RequerAutenticacao: false,
	},
}