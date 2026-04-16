"""
RESUMO DIDÁTICO:
Este script implementa um algoritmo de contagem de frequência para identificar qual 
caractere ocorre com maior periodicidade em uma string. O código utiliza um laço 
'while' para iterar por cada letra, ignorando espaços em branco através do comando 
'continue'. A lógica central baseia-se em uma comparação dinâmica: a cada ciclo, 
o método .count() verifica a quantidade de vezes que a letra atual aparece na frase 
completa; se esse número for maior do que o recorde anterior (armazenado em uma 
variável de controle), os novos valores de referência são atualizados. Ao final da 
varredura, o programa entrega o caractere "vencedor" e seu respectivo total de 
aparições, exemplificando o uso de acumuladores e lógica condicional para análise 
de dados textuais.
"""

frase = 'O Python é uma linguagem de programação ' \
        'multiparadigma. ' \
        'Python foi criado por Guido Van Rossum'

i = 0
qtd_apareceu_mais_vezes = 0
letra_apareceu_mais_apareceu = ''

while i < len(frase):
    letra_atual = frase[i]

    # Ignora espaços para não distorcer a contagem de letras
    if letra_atual == ' ':
        i += 1
        continue
    
    # Conta a frequência da letra atual na frase toda
    qtd_apareceu_mais_vezes_atual = frase.count(letra_atual)

    # Lógica de atualização do recorde de frequência
    if qtd_apareceu_mais_vezes < qtd_apareceu_mais_vezes_atual:
       qtd_apareceu_mais_vezes = qtd_apareceu_mais_vezes_atual
       letra_apareceu_mais_apareceu = letra_atual

    i += 1
    
print
(
    'A letra que apareceu mais vezes foi '
    f'"{letra_apareceu_mais_apareceu}" que apareceu '
    f'{qtd_apareceu_mais_vezes}x'
)