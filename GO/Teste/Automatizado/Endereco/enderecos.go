/*
RESUMO DIDÁTICO:
Este exemplo demonstra o sistema de visibilidade (público vs. privado) do Go 
e como manipular strings para validação de dados.

O código ilustra:
1. Regra de Exportação (Letra Maiúscula): No Go, para que uma função, struct 
   ou variável de um pacote seja acessível por outro pacote, o seu nome 
   DEVE começar com uma letra maiúscula.
2. Conversão de Slice de Strings: A sintaxe correta para inicializar um slice 
   de strings com valores predefinidos usa chaves '{}' e não parênteses '()'.
3. Manipulação de Strings: Uso de 'strings.ToLower' para normalizar o texto e 
   'strings.Split' para extrair a primeira palavra de uma frase.
*/

package enderecos

import "strings"

func TipodeEnderecos(endereco string) string {
    tiposvalidos := []string{"rua", "avenida", "estrada", "rodovia"} 
    
    enderecominiscula := strings.ToLower(endereco)
    primeirapalavra := strings.Split(enderecominiscula, " ")[0]

    enderecovalido := false
    for _, tipo := range tiposvalidos {
        if tipo == primeirapalavra {
            enderecovalido = true
            break // adicionado break para otimizar o loop assim que achar
        }
    }
    
    if enderecovalido {
        return strings.Title(primeirapalavra)
    }
    return "Tipo inválido"
}