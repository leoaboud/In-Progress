palavra_secreta = 'perfume'
letra_acertada = ''
numero_tentativa = 0
while True:
    letra_digitada = input ('Digite uma letra')
    numero_tentativa += 1 

    if len(letra_digitada) > 1:
        print('Digite apenas uma letra')
        continue

    if letra_digitada in palavra_secreta:
        letra_acertada += letra_digitada

    palavra_formada = ''
    for letra_secreta in palavra_secreta:
        if letra_secreta in letra_acertada:
            print(letra_secreta)
        else:
            palavra_formada += '*'
        print('palavra formada', palavra_formada)

    if palavra_formada == palavra_secreta:
        print('VOCÊ GANHOU! PARABENS')
        print('Apalavra era', palavra_secreta)
        print('Tentativa', numero_tentativa)