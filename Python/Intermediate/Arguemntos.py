"""
RESUMO DIDÁTICO:
Este script explora a flexibilidade na passagem de argumentos para funções no Python. 
O código demonstra a diferença entre Argumentos Posicionais e Argumentos Nomeados 
(Keyword Arguments). 

Enquanto nos argumentos posicionais a ordem dos valores determina qual variável 
recebe qual dado, nos argumentos nomeados você indica explicitamente o nome do 
parâmetro (ex: x=1), o que permite inverter a ordem se desejar e torna o código 
muito mais autoexplicativo. Além disso, o uso de f-strings com a sintaxe '{x=}' 
é uma ferramenta poderosa de depuração (debug), pois imprime automaticamente o 
nome da variável seguido de seu valor atual, facilitando o rastreio do fluxo 
de dados.
"""

def soma(x, y, z):
    # O uso de {x=} exibe o nome do parâmetro e o valor passado
    print(f'{x=} {y=} {z=}', '|', 'x + y + z = ', x + y + z)

# Chamada com Argumentos Posicionais (a ordem importa)
soma(1, 2, 3)

# Chamada com Argumentos Nomeados (clareza total sobre o que cada valor representa)
soma(x=1, y=2, z=3)

# Exemplo prático de argumento nomeado em funções integradas:
# O 'sep' é um argumento nomeado da função print()
print(1, 2, 3, sep='-')

def soma(x, y, z= None):
    if z is not None:
        print(f'{x=} {y=} {z=}', x + y + z)
    else:
        print(f'{x=} {y=}', x + y)

soma(1, 2)
soma(3, 4)
soma(100, 200)
soma(7, 9 , 0)
soma(z=0, x=7, y=9)