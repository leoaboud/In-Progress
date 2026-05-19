/*
RESUMO DIDÁTICO:
Este script demonstra a implementação prática de Testes Unitários Automatizados 
no Go, utilizando a técnica de Isolamento de Subtestes (t.Run).

O código ilustra:
1. Convenção de Arquivos e Pacotes: Arquivos de teste devem terminar obrigatoriamente 
   com '_test.go' e pertencer ao mesmo 'package' dos arquivos que estão testando 
   para herdar o escopo (ex: acessar 'Retangulo' e 'Circulo' sem imports).
2. Isolamento com t.Run: Permite agrupar diferentes cenários lógicos dentro de 
   uma mesma função principal ('TestArea'). Cada bloco roda de forma independente.
3. Tratamento de Falhas Críticas (t.Fatalf): Método do pacote 'testing' usado para 
   interromper imediatamente o subteste caso o valor calculado seja diferente do 
   esperado, formatando a mensagem com marcadores como '%f' (para floats).
4. Assertividade Simples: O uso de condicionais puras ('if esperado != recebido') 
   para validar os resultados, mantendo o ecossistema de testes do Go leve e sem 
   a dependência obrigatória de bibliotecas externas de "assert".
*/

package main

import (
	"math"
	"testing"
)

func TestArea(t *testing.T) {
	t.Run("Retangulo", func(t*testing.T) {
		ret := Retangulo{10, 12}
		areaEsperada := float64(120)
		areaRecebida := ret.Area()

		if areaEsperada != areaRecebida {
			t.Fatalf("A [area recebida %f é diferente da esperada %f",
			areaRecebida,
			areaEsperada,
			)
		}
	})

	t.Run("Circulo", func(t*testing.T) {
		circ := Circulo{ 10 }
		areaEsperada := float64(math.Pi * 100)
		areaRecebida := circ.Area()

		if areaEsperada != areaRecebida {
			t.Fatalf("A [area recebida %f é diferente da esperada %f",
			areaRecebida,
			areaEsperada,
			)
		}
	})
}