"""
RESUMO DIDÁTICO:
Este script simula um Sistema de Quiz. 
As principais correções aplicadas foram:
1. Alvo da Resposta: Comparar a escolha do usuário com o valor dentro da lista 
   de opções, e não com o texto da pergunta.
2. Escopo de Variáveis: Garantir que a variável 'acertou' seja reiniciada a 
   cada nova pergunta para não carregar o resultado da anterior.
3. Dinamismo: Usar 'len(pergunta["Opções"])' para validar o índice, permitindo 
   que cada pergunta tenha um número diferente de alternativas.
"""

perguntas = [
    {
        'Pergunta': 'Quanto é 2 + 2?',
        'Opções': ['1', '3', '4', '5'],
        'Resposta': '4',
    },
    {
        'Pergunta': 'Quanto é 5 * 5?',
        'Opções': ['25', '55', '10', '51'],
        'Resposta': '25',
    },
    {
        'Pergunta': 'Quanto é 10 / 2?',
        'Opções': ['4', '5', '1', '2'],
        'Resposta': '5',
    }
]

qtd_acertos = 0

for pergunta in perguntas:
    print('Pergunta:', pergunta['Pergunta'])
    print()

    opcoes = pergunta['Opções']
    for i, opcao in enumerate(opcoes):
        print(f'{i}) {opcao}')
    print()

    escolha = input('Escolha uma opção (pelo índice): ')

    acertou = False
    escolha_int = None
    qtd_opcoes = len(opcoes) # Quantidade real de opções para esta pergunta

    if escolha.isdigit():
        escolha_int = int(escolha)

    if escolha_int is not None:
        # Verifica se o número digitado existe nas opções
        if 0 <= escolha_int < qtd_opcoes:
            exibicao_opcao = opcoes[escolha_int]
            
            # Compara o valor da opção escolhida com a Resposta correta
            if exibicao_opcao == pergunta['Resposta']:
                acertou = True

    if acertou:
        qtd_acertos += 1
        print('Acertou 👍')
    else:
        print('Errou ❌')

    print()

print(f'Você acertou {qtd_acertos} de {len(perguntas)} perguntas.')