/*
RESUMO DIDÁTICO:
Este script demonstra o conceito de funções EXPORTADAS na linguagem Go.
Diferente da função 'escrever2', a função 'Escrever' inicia com letra MAIÚSCULA,
o que sinaliza ao compilador que este identificador deve ser visível para outros
pacotes (como o package main). Além disso, o código ilustra a característica
de escopo de pacote: mesmo que 'escrever2' seja privada, ela pode ser chamada
diretamente aqui porque ambos os arquivos pertencem ao 'package auxiliar'.
Isso permite organizar um único pacote em múltiplos arquivos mantendo a
comunicação interna entre eles.
*/

package auxiliar

import (
	"fmt"
)

// Escrever inicia com letra maiúscula, o que a torna uma função EXPORTADA.
// Isso permite que o package main ou outros pacotes a utilizem.
func Escrever() {
	fmt.Println("Escrevendo do pacote auxiliar")

	// Chama uma função que está no mesmo pacote, mas em outro arquivo.
	// Como estão no mesmo package, a visibilidade privada permite o acesso.
	escrever2()
}
