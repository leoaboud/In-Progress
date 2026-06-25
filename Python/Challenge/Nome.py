"""
RESUMO DIDÁTICO: Manipulação Avançada de Strings e Slicing em Python

Este código ilustra como realizar operações de inspeção, contagem, busca e inversão em cadeias 
de caracteres (Strings), utilizando recursos nativos da linguagem de forma performática.

O código ilustra:
1. Validação Implícita de Strings: Em Python, strings vazias são avaliadas como 'False' em 
   contextos booleanos. Portanto, a expressão 'if nome and idade:' garante que o bloco só 
   execute se ambos os campos tiverem algum conteúdo digitado.
2. Fatiamento de Strings ou Slicing ('[inicio:fim:passo]'): Uma ferramenta poderosa. O comando 
   'nome[::-1]' omite o início e o fim, mas define o passo como '-1', fazendo com que a string 
   seja lida de trás para frente (invertida).
3. Busca de Substrings ('in'): O operador 'in' realiza uma busca sequencial rápida para verificar 
   se um caractere específico (como o espaço em branco ' ') existe dentro da string.
4. Indexação Positiva e Negativa: O Python permite acessar caracteres por índices. 'nome[0]' acessa 
   o primeiro elemento (base zero). Já o índice negativo 'nome[-1]' faz o caminho inverso, 
   acessando o último elemento da string sem precisar saber o tamanho total dela.
"""

# Captura as entradas do usuário
nome = input('Digite seu nome: ')
idade = input('Digite sua idade: ')

# Valida se ambos os campos foram preenchidos (não estão vazios)
if nome and idade:
    print(f'Seu nome é {nome}')
    
    # Inverte a string usando fatiamento (slicing)
    print(f'Seu nome invertido é {nome[::-1]}')

    # Verifica a existência de espaços dentro do texto
    if ' ' in nome:
        print('Seu nome contém espaços')
    else:
        print('Seu nome não contém espaços')

    # len() conta o total de caracteres (incluindo espaços, se houver)
    print(f'Seu nome contém {len(nome)} caracteres (incluindo espaços)')

    # Exibe o primeiro caractere (índice 0) e o último (índice -1)
    print(f'A primeira letra do seu nome é {nome[0]}')
    print(f'A última letra é {nome[-1]}')

else:
    print('Desculpe, você deixou campos vazios.')