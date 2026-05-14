"""
RESUMO DIDÁTICO:
Este script é uma aula prática sobre Escopo de Variáveis (Global vs. Local). 
O conceito de escopo determina a visibilidade e a "vida" de uma variável dentro 
do programa. No Python, uma variável definida fora de qualquer função é GLOBAL 
e pode ser lida em qualquer lugar. Já variáveis definidas dentro de funções são 
LOCAIS; elas nascem quando a função é chamada e morrem quando ela termina. 

O script demonstra o fenômeno do "Shadowing" (Sombreamento): quando você cria 
uma variável local com o mesmo nome de uma global (como o 'x'), a função usará 
a versão local, "escondendo" a global sem alterá-la. Isso mantém o código 
organizado e evita que funções diferentes causem efeitos colaterais indesejados 
umas nas outras.
"""

# x GLOBAL
x = 1

def escopo():
    # x LOCAL da função 'escopo' (Sombreia o x global)
    x = 10

    def outra_funcao():
        # x LOCAL da função 'outra_funcao' (Sombreia o x da função pai)
        x = 11
        y = 2
        print(f'Dentro da outra_funcao: {x=}, {y=}')
    
    outra_funcao()
    print(f'Dentro do escopo: {x=}')

# Execução do fluxo:
print(f'Antes de chamar escopo: {x=}')  # Imprime o 1 global
escopo()
print(f'Depois de chamar escopo: {x=}') # O 1 global permanece intacto