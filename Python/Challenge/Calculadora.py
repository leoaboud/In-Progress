"""
RESUMO DIDÁTICO:
Este script é um exemplo completo de uma Calculadora Interativa com Tratamento de Erros. 
Ele utiliza um laço 'while True' para criar um programa que não fecha sozinho, permitindo 
múltiplas operações até que o usuário decida sair. 

Os pontos principais demonstrados são:
1. Resiliência: Uso de 'try/except' para capturar erros de digitação (letras em vez de números).
2. Validação de Dados: Verificação de operadores permitidos e tratamento para divisão por zero.
3. Controle de Fluxo: Uso de 'continue' para reiniciar o ciclo em caso de erro e 'break' 
   para encerrar o programa de forma limpa.
"""

while True:
    num1 = input('Digite um número: ')
    num2 = input('Digite um número: ')
    oper = input('Digite um operador ( + - * / ): ')

    num_validos = None
    
    # Bloco de captura de erro: tenta converter a string do input para float
    try:
        num1_float = float(num1)
        num2_float = float(num2)
        num_validos = True
    except:
        # Se a conversão falhar (ex: usuário digitou 'A'), cai aqui
        num_validos = None

    # Se os números forem inválidos, reinicia o laço com 'continue'
    if num_validos is None:
        print("Um ou ambos os numeros sao inválidos")
        continue

    # Validação do operador: deve estar na lista permitida e ter apenas 1 caractere
    oper_validos = '+-*/'
    if oper not in oper_validos or len(oper) > 1:
        print("Operador inválido")
        continue

    print('Realizado confira o resultado abaixo: ')

    # Estrutura de decisão para realizar o cálculo matemático
    if oper == '+':
        print(f'{num1_float} + {num2_float} = ', num1_float + num2_float)

    elif oper == '-':
        print(f'{num1_float} - {num2_float} = ', num1_float - num2_float)

    elif oper == '*':
        print(f'{num1_float} * {num2_float} = ', num1_float * num2_float)

    elif oper == '/':
        # Proteção contra erro matemático clássico: divisão por zero
        if num2_float != 0:
            print(f'{num1_float} / {num2_float} = ', num1_float / num2_float)
        else:
            print("Erro: Divisão por zero")

    # Lógica de saída: converte para minúsculo e checa se começa com 's'
    sair = input('Quer sair? [s]im: ').lower().startswith('s')
   
    if sair is True:
        break