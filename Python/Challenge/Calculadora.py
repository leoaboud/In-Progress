while True:
    num1 = input('Digite um número: ')
    num2 = input('Digite um número: ')
    oper = input('Digite um operador ( + - * / ): ')

    num_validos = None
    
    try:
        num1_float = float(num1)
        num2_float = float(num2)
        num_validos = True

    except:
        num_validos = None

    if num_validos is None:
        print("Um ou ambos os numeros sao inválidos")
        continue

    oper_validos = '+-*/'
    
    if oper not in oper_validos or len(oper) > 1:
        print("Operador inválido")
        continue

    print('Realizado confira o resultado abaixo: ')

    if oper == '+':
        print(f'{num1_float} + {num2_float} = ', num1_float + num2_float)

    elif oper == '-':
        print(f'{num1_float} - {num2_float} = ', num1_float - num2_float)

    elif oper == '*':
        print(f'{num1_float} * {num2_float} = ', num1_float * num2_float)

    elif oper == '/':
        if num2_float != 0:
            print(f'{num1_float} / {num2_float} = ', num1_float / num2_float)
        else:
            print("Erro: Divisão por zero")

    sair = input('Quer sair? [s]im: ').lower().startswith('s')
   
    if sair is True:
        break