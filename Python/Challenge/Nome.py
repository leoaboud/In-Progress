
nome = input('Digite seu nome: ')

idade = input('Digite sua idade: ')

if nome and idade != "":
    
    print(f'Seu nome é {nome}')

    print(f'Seu nome invertido é {nome[::-1]}')

    if ' ' in nome:

        print(f'Seu nome contém espaços')
    
    else:

        print('Seu nome não contém espaços')

    print(f'Seu nome contém {len(nome)}')

    print(f'A primeira letra do seu nome é {nome[0]}')

    print(f'A última letra é {nome[-1]}')

else:
    print(f'Desculpe, você deixu o campo vazio')