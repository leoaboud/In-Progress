/*
RESUMO DIDÁTICO: O Padrão Repository e Inserção Segura com Statements

Este arquivo constrói a camada de persistência (Repositório) para o domínio de Usuários. 
A arquitetura foca em encapsular o cliente do banco de dados e expor métodos limpos de manipulação.

O código ilustra:
1. Encapsulamento do Banco (Struct 'Usuarios'): Guarda internamente um ponteiro para '*sql.DB'. 
   Como o campo 'db' começa com letra minúscula, ele é privado, impedindo que outras partes do sistema 
   mexam diretamente no pool de conexões.
2. Injeção de Dependência ('NovoRepositorioDeUsuario'): Uma função construtora que recebe uma conexão 
   ativa do banco de dados e a injeta no repositório. Isso facilita testes unitários e centraliza o controle.
3. Métodos com Receptor (Receiver Functions): A sintaxe 'func (repositorio Usuarios) Criar(...)' 
   anexa a função diretamente à struct, funcionando como um método de classe em orientação a objetos.
4. Instruções Preparadas ('db.Prepare'): Uma das maiores defesas em segurança web. O 'Prepare' compila 
   o comando SQL no banco de dados antes de enviar os dados, usando interrogações ('?') como placeholders. 
   Isso impede **ataques de SQL Injection**, pois o banco garante que os dados do usuário nunca serão 
   interpretados como comandos executáveis.
5. Execução Dedicada ('statement.Exec'): Executa o comando passando os valores reais nos argumentos. 
   O driver se encarrega de substituir os placeholders ('?') de forma sanitizada.
6. Recuperação de IDs Gerados ('LastInsertId'): Em tabelas com chaves auto-incrementais, o MySQL retorna 
   o ID da linha que acabou de ser criada. O Go captura esse valor como 'int64' e nós o convertemos 
   para 'uint64' para bater com o padrão da nossa Struct de modelo.
*/

package repositorio

import (
	"api/SRC/models"
	"database/sql"
)

// Usuarios representa um repositório de banco de dados dedicado à tabela de usuários
type Usuarios struct {
	db *sql.DB
}

// NovoRepositorioDeUsuario cria e retorna uma nova instância do repositório configurada com o banco de dados
func NovoRepositorioDeUsuario(db *sql.DB) *Usuarios {
	return &Usuarios{db}
}

// Criar insere um novo usuário no banco de dados e retorna o ID gerado ou um erro
func (repositorio Usuarios) Criar(usuario models.Usuarios) (uint64, error) {
	// Prepara a query SQL. Os '?' são os locais onde as variáveis do usuário entrarão com total segurança
	statement, erro := repositorio.db.Prepare(
		"insert into usuarios (nome, nick, email, senha) values (?, ?, ?, ?)",
	)
	if erro != nil {
		return 0, erro
	}
	defer statement.Close() // Garante o fechamento do statement para liberar memória do MySQL

	// Executa o comando SQL trocando os '?' pelos dados reais que vieram do struct do usuário
	resultado, erro := statement.Exec(usuario.Nome, usuario.Nick, usuario.Email, usuario.Senha)
	if erro != nil {
		return 0, erro
	}

	// Recupera o ID gerado pelo campo AUTO_INCREMENT do MySQL
	ultimoIDInserido, erro := resultado.LastInsertId()
	if erro != nil {
		return 0, erro
	}

	// Retorna o ID convertido com sucesso e o erro nulo
	return uint64(ultimoIDInserido), nil
}