"""
RESUMO DIDÁTICO:
Este script demonstra o processo de iteração sobre uma string e a construção dinâmica 
de um novo conteúdo (acumulação). Através de um laço 'for', o código percorre cada 
caractere da palavra "Python" individualmente. A cada iteração, uma nova string é 
montada utilizando uma f-string que prefixa um asterisco à letra atual, demonstrando 
como strings podem ser concatenadas e transformadas durante um ciclo de repetição. 
O resultado final exemplifica a manipulação de padrões de texto e a persistência 
de dados em variáveis acumuladoras.
"""

texto = 'Python'

novo_texto = ''
for letra in texto:
    novo_texto += f'*{letra}'
    print(letra)
print(novo_texto + '*')