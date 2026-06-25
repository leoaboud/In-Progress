"""
RESUMO DIDÁTICO: Resolução de Desafios Lógicos (Paridade, Horários e Validação de Strings)

Este arquivo consolida três desafios clássicos de programação que exercitam lógica condicional, 
tratamento de exceções e manipulação de comprimentos de strings em Python.

O código ilustra:
1. Operador de Resto da Divisão / Módulo ('%'): Utilizado no Desafio 1. O cálculo 'num_int % 2 == 0' 
   verifica se o resto da divisão por 2 é zero. Se for, o número é categoricamente Par.
2. Tratamento Genérico de Erros ('try / except'): Garante que entradas de texto inválidas 
   não quebrem o programa ao tentar convertê-las para inteiros ('int()').
3. Operadores Lógicos de Intervalo ('and'): Utilizado no Desafio 2 para criar intervalos matemáticos 
   fechados (ex: entre 0 e 11 horas inclusive), combinando duas condições na mesma linha.
4. Funções de Medição de Comprimento ('len()'): Utilizado no Desafio 3 para capturar a quantidade de 
   caracteres de uma string e aninhar condições para validar se a entrada é aceitável ou não.
"""

# ==================== #1 -- DESAFIO 1: PAR OU ÍMPAR ====================
print("--- DESAFIO 1 ---")
num = input("Digite um número inteiro: ")

try:
    num_int = int(num)
    par_impar = num_int % 2 == 0
    par_impar_texto = 'ímpar'
    
    if par_impar:
        par_impar_texto = 'par'

    print(f'O número {num_int} é {par_impar_texto}\n')

except ValueError:
    print("Você não digitou um número inteiro válido.\n")


# ==================== #2 -- DESAFIO 2: SAUDAÇÃO POR HORÁRIO ====================
print("--- DESAFIO 2 ---")
hora = input("Digite um horário (apenas horas cheias de 0 a 23): ")

try:
    # Corrigido: Agora usamos a variável inteira (hora_int) nas comparações matemáticas abaixo
    hora_int = int(hora)

    if hora_int >= 0 and hora_int <= 11:
        print(f'Bom dia Sr., são {hora_int}h\n')

    elif hora_int >= 12 and hora_int <= 17:
        print(f'Boa tarde Sr., são {hora_int}h\n')

    elif hora_int >= 18 and hora_int <= 23:
        print(f'Boa noite Sr., são {hora_int}h\n')

    else:
        print("Horário inválido! Digite um valor entre 0 e 23.\n")

except ValueError:
    print("Digite um horário válido (apenas números inteiros).\n")


# ==================== #3 -- DESAFIO 3: TAMANHO DO NOME ====================
print("--- DESAFIO 3 ---")
nome = input("Digite seu nome: ")
tamanho = len(nome)

# Valida se o usuário não deixou vazio ou digitou apenas 1 letra
if tamanho > 1:
    if tamanho <= 4:
        print("Seu nome é curto.")
    
    elif tamanho >= 5 and tamanho <= 6:
        print("Seu nome é normal.")

    else:
        print("Seu nome é muito grande.")
else:
    print("Por favor, digite mais de uma letra.")