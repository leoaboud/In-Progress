"""
RESUMO DIDÁTICO: Conversão de Tipos (Casting) e Estruturas Condicionais em Python

Este código ilustra como capturar dados do usuário, converter strings para números inteiros 
e aplicar uma lógica condicional para desviar o fluxo do programa.

O código ilustra:
1. Captura de Entrada ('input()'): Por padrão, qualquer dado digitado no 'input' entra no 
   sistema como texto (String), mesmo que o usuário digite apenas números.
2. Conversão de Tipos ou Casting ('int()'): Para realizar comparações matemáticas (como maior 
   ou menor), é obrigatório transformar o texto em número. Deve-se reatribuir o resultado 
   de volta à variável: 'idade = int(idade)'.
3. Sintaxe Limpa de Condicionais ('if / elif / else'): Em Python, as condições não precisam de 
   parênteses. A validação termina com dois pontos (':') e o bloco de código abaixo precisa 
   estar identado (com o recuo de 4 espaços).
4. Interpolação de Strings ('f-strings'): O uso do prefixo 'f' antes das aspas permite injetar 
   as variáveis diretamente no meio do texto utilizando chaves '{variável}'.
"""

# 1. Captura os dados do usuário (ambos entram como texto/string)
nome = input('Digite seu nome: ')
idade = input('Digite sua idade: ')

# 2. Converte o texto da idade para um número inteiro e salva na mesma variável
idade = int(idade)

# Definição da constante de maioridade
adulto = 18

# 3. Estrutura condicional para checar a maioridade
if idade >= adulto:
    print(f'{nome} tem {idade} anos, portanto você é maior de idade!')

elif idade < adulto: # Ajustado para menor estrito (<), já que o 18 entra no primeiro IF
    print(f'{nome} tem {idade} anos, portanto você é menor de idade!')

else:
    # Nota: Este else nunca será atingido neste formato, pois se o usuário não digitar 
    # um número, o programa travará logo acima na linha do 'int(idade)'.
    print('Entrada inválida.')