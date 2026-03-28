#1 -- desafio 1
'''
num = input("Digite um numero: ")

try:
    num_int = int(num)
    par_impar = num_int % 2 == 0
    par_impar_texto = 'impar'
    

    if par_impar:
        par_impar_texto = 'par'

    print(f'O numero  {num_int} é {par_impar_texto}')

except:
    print("Você nao digitou um numero inteiro")
'''

'''
#2 -- desafio 2

hora = input("Digite um horario: ")

try:
    hora_int = int(hora)

    if hora >= 0 and hora <= 11:
        print(f' Bom dia Sr. são {hora_int}')

    elif hora >= 12 and hora <= 17:
        print(f' Bom tarde Sr. são {hora_int}')

    elif hora >= 18 and hora <= 23:
        print(f' Bom noite Sr. são {hora_int}')

    else:
        print("Não é horario")

except:
    print("Digite um horario valido")
'''

#3 -- desafio 3

nome = input("Digite seu nome: ")
tamanho = len(nome)

if tamanho > 1:

    if tamanho <= 4:

        print("Seu nome é curto")
    
    elif tamanho >= 5 and tamanho <= 6:

        print("Seu nome é normal")

    else:

        print("Seu nome é muito grande ")

else:
    
    print("Digite mais de uma letra")