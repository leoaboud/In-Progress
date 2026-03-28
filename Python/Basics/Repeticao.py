'''
condicao = True

while condicao:

    nome = input("Digit seu nome")

    print(f'seu nome é {nome}')

    if nome == 'sair':

        break
'''

'''
contador = 0

while contador <= 10:

    print(contador)
    
    contador = contador + 1

print("acabou")
'''

'''
contador = 0

while contador <= 100:

    contador += 1

    if contador == 6:

        print('Nao vou mostar o 6')

        continue

    if contador >= 10 and contador <= 27:

        print('Não vou mostrar o', contador)
        
        continue 

    print(contador)

    if contador == 40:

        break

print("acabou")
'''

'''
qtd_linhas = 5
qtd_colunas = 5

linha = 1 
while linha <= qtd_linhas:

    coluna = 1

    while coluna <= qtd_colunas:

        print(f'{linha=}, {coluna=}')

        linha += 1

print ('Acabou')
'''

'''
nome = 'Leonardo'

indice = 0 
novo = ''

while indice < len(nome):

    letra = nome [indice]

    novo += f'*{letra}'
    
    indice += 1

print(novo)
'''