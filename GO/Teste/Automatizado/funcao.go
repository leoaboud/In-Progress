/*
RESUMO DIDÁTICO:
Este script exemplifica a importação de pacotes customizados locais e o uso 
de apelidos (aliases) para referenciar esses pacotes dentro do código.

O código ilustra:
1. Namespaces de Pacotes: Por padrão, quando você importa um pacote, você o 
   chama pelo nome definido na cláusula 'package' do arquivo de origem (neste 
   caso, 'enderecos'), e não pelo nome da pasta física ('Endereco').
2. Importação com Erro de Referência: O código tenta usar a variável 'enderecos', 
   mas como o import foi feito de forma seca ("funcao/Endereco"), o compilador 
   espera que você use o nome exato do pacote ou declare um apelido explícito.
3. Boas Práticas de Organização: Separação de lógicas de validação em diretórios 
   específicos para manter o código limpo e modular.
*/

package main

import (
    "fmt"
	"funcao/Endereco" 
)

func main() {
    tipoEndereco := enderecos.TipodeEnderecos("Avenida Paulista")
    fmt.Println(tipoEndereco)
}