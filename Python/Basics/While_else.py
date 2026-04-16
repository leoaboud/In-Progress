"""
RESUMO DIDÁTICO:
Este script exemplifica o uso da cláusula 'else' em conjunto com o laço 'while', uma 
funcionalidade peculiar do Python. O 'else' atrelado a um laço de repetição só é 
executado se o laço chegar ao seu fim natural, ou seja, quando a condição se torna 
falsa. Caso o laço fosse interrompido prematuramente por um comando 'break', o 
bloco 'else' seria ignorado. No exemplo, o código percorre cada caractere da string 
individualmente através de um índice, imprime a letra e, ao finalizar a leitura de 
todo o texto, executa a mensagem do 'else' antes de seguir para o restante do programa.
"""

string = 'Valor qualquer'

i = 0

while i < len(string):
    letra = string[i]

    print(letra)
    i += 1
else:
    # Este bloco é executado quando o 'while' termina normalmente (i < len(string) é Falso)
    print('O else foi executado')

print('Fora do while')