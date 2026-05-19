/*
RESUMO DIDÁTICO:
Este script demonstra a criação e o uso de métodos associados a structs. 
Diferente de funções comuns, métodos são funções vinculadas a um tipo específico.

O código ilustra:
1. Receiver (Receptor): A sintaxe '(u usuario)' antes do nome da função indica 
   que aquele método pertence ao tipo 'usuario'.
2. Métodos com Valor: O receptor recebe uma cópia da struct. Útil para leitura 
   de dados ou operações que não devem alterar o objeto original (ex: 'salvar').
3. Métodos com Ponteiro: O receptor '(u *usuario)' recebe a referência original. 
   É obrigatório quando o método precisa modificar um campo da struct (ex: 'aniversario').
4. Encapsulamento de Lógica: Permite que a própria estrutura "saiba" realizar 
   ações ou responder perguntas sobre si mesma (ex: 'maiordeidade').
*/

package main

import "fmt"

type usuario struct {
    nome  string
    idade uint8
}

// Método que apenas lê dados (Receiver por valor)
func (u usuario) salvar() {
    fmt.Printf("Salvando os dados do usuário %s no banco de dados\n", u.nome)
}

// Método que retorna uma informação baseada nos campos
func (u usuario) maiordeidade() bool {
    return u.idade >= 18
}

// Método que MODIFICA o estado do objeto (Receiver por ponteiro)
func (u *usuario) aniversario() {
    u.idade++
}

func main() {
    usuario1 := usuario{"Leonardo", 27}
    usuario1.salvar()

    usuario2 := usuario{"Jessica", 32}
    
    // Chamando método de verificação
    fmt.Println("É maior de idade?", usuario2.maiordeidade())
    
    // Chamando método que altera o valor original
    usuario2.aniversario()
    fmt.Println("Nova idade após aniversário:", usuario2.idade)
}