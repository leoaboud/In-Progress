/*
RESUMO DIDÁTICO:
Este script demonstra a criação de testes unitários automatizados para validar 
o comportamento da função 'TipodeEnderecos'.

O código ilustra:
1. O Pacote Testing: Uso do pacote nativo 'testing' do Go e a convenção de que 
   toda função de teste deve começar com a palavra 'Test' e receber '*testing.T'.
2. Table-Driven Tests: Criação de uma estrutura ('cenarioteste') e um slice 
   ('cenariosdeteste') para agrupar múltiplos dados de entrada e seus respectivos 
   resultados esperados em formato de tabela.
3. Testes em Paralelo ('t.Parallel()'): Permite que o Go execute este teste 
   simultaneamente com outros testes do projeto que também tenham essa marcação, 
   otimizando o tempo de execução.
4. Relatório de Falhas ('t.Errorf'): Método utilizado para sinalizar que o teste 
   falhou, exibindo uma mensagem descritiva sem interromper a execução dos 
   próximos cenários da tabela.
*/

package enderecos

import (
	"testing"
)

// Estrutura que define a anatomia de cada caso de teste
type cenarioteste struct {
	enderecoinserido string
	retornoesperado  string
}

func TestTipodeEnderecos(t *testing.T) {
	t.Parallel() // Sinaliza que este teste pode rodar em paralelo

	// A "Tabela" contendo casos de sucesso, variações de maiúsculas/minúsculas,
	// casos inválidos e strings vazias.
	cenariosdeteste := []cenarioteste{
		{"Rua ABC", "Rua"},
		{"Avenida Paulista", "Avenida"},
		{"Estrada Qualquer", "Estrada"},
		{"Rodovia dos Imigrantes", "Rodovia"},
		{"RUA DOS BOBOS", "Rua"},
		{"Praça da Luz", "Tipo inválido"},
		{"AVENIDA ABC", "Avenida"},
		{"ESTRADA QUER", "Estrada"},
		{"RODOVIA DUTRA ABC", "Rodovia"},
		{"PRAÇA DA SÉ", "Tipo inválido"},
		{" ", "Tipo inválido"},
	}

	// O laço que percorre a tabela e testa cenário por cenário
	for _, cenario := range cenariosdeteste {
		tipodeenderecorecebido := TipodeEnderecos(cenario.enderecoinserido)
		if tipodeenderecorecebido != cenario.retornoesperado {
			t.Errorf("O tipo recebido é diferente do esperado! Esperava %s e recebeu %s",
				cenario.retornoesperado,      // O que você queria
				tipodeenderecorecebido,       // O que o código calculou
			)
		}
	}
}