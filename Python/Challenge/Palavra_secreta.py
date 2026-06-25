"""
RESUMO DIDÁTICO: Lógica de Jogo (Forca), Loops Aninhados e Acumulação de Strings

Este código ilustra a construção de um jogo de adivinhação de palavras, combinando checagem 
de fluxo, repetição condicional e reconstrução dinâmica de strings caractere por caractere.

O código ilustra:
1. Loops Aninhados: Um laço 'for' roda dentro de um laço 'while True'. O 'while' gerencia os 
   turnos das jogadas, enquanto o 'for' varre a palavra secreta a cada tentativa para atualizar 
   o estado visual do jogo.
2. Filtro de Validação ('continue'): O comando 'continue' interrompe o turno atual do 'while' 
   imediatamente e volta para o topo do laço se o usuário digitar mais de uma letra, 
   impedindo que palpites inválidos gastem tentativas.
3. Acumulação de Acertos: A string 'letra_acertada' funciona como um histórico de acertos, 
   guardando todas as letras válidas digitadas até o momento.
4. Máscara de Caracteres (Reconstrução): A cada rodada, a string 'palavra_formada' é reiniciada 
   vazia. O 'for' analisa a palavra secreta: se a letra já foi acertada, ela é revelada; 
   caso contrário, oculta-se com um asterisco ('*').
"""

palavra_secreta = 'perfume'
letra_acertada = ''
numero_tentativa = 0

while True:
    letra_digitada = input('Digite uma letra: ').lower() # .lower() evita problemas com maiúsculas
    numero_tentativa += 1 

    # Validação para garantir que o usuário digitou apenas um caractere
    if len(letra_digitada) > 1:
        print('Digite apenas uma letra.')
        continue

    # Se o palpite estiver correto, adiciona ao histórico de acertos
    if letra_digitada in palavra_secreta:
        letra_acertada += letra_digitada

    # Reconstrói a palavra dinamicamente para mostrar o progresso
    palavra_formada = ''
    for letra_secreta in palavra_secreta:
        if letra_secreta in letra_acertada:
            palavra_formada += letra_secreta # Adiciona a letra revelada
        else:
            palavra_formada += '*' # Mantém oculta

    # O print da palavra formada deve ficar FORA do loop 'for'
    print('Palavra formada:', palavra_formada)

    # Condição de vitória
    if palavra_formada == palavra_secreta:
        print('\nVOCÊ GANHOU! PARABÉNS! 🏆')
        print('A palavra era:', palavra_secreta)
        print('Total de tentativas:', numero_tentativa)
        break # Encerra o loop 'while' e finaliza o jogo