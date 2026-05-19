/*
RESUMO DIDÁTICO:
Este script demonstra a função especial 'init()', utilizada para preparar o 
estado do programa antes da execução da lógica principal.

O código ilustra:
1. Precedência de Execução: A função 'init' é executada automaticamente ANTES 
   da função 'main', independentemente de onde ela esteja no arquivo.
2. Inicialização Automática: Não é necessário (nem permitido) chamar a função 
   'init' manualmente; o Go Runtime cuida disso.
3. Configuração de Ambiente: É o local ideal para validar variáveis de ambiente, 
   conectar bancos de dados ou configurar globais necessárias para o programa.
4. Múltiplos Inits: Um diferencial do Go é que você pode ter múltiplas funções 
   'init' em diferentes arquivos do mesmo pacote, e todas serão executadas.
*/

package main

import "fmt"

// A função init sempre "ganha" da main na ordem de execução
func init() {
    fmt.Println("Executando a função INIT (Preparação)")
}

func main() {
    fmt.Println("Função main (Execução Principal)")
}