"""
RESUMO DIDÁTICO:
Este script realiza o tratamento de uma string através do processo de split/join. 
A frase original é segmentada em uma lista de termos onde houver vírgula e espaço. 
Utilizando um laço de repetição (for) com indexação (enumerate), cada termo é 
individualmente limpo (removendo espaços residuais nas extremidades) e armazenado 
em uma nova lista. Por fim, os termos tratados são reagrupados em uma string única 
e formatada.
"""

frase = 'Olha só que, coisa interessante'
lista_palavra_cruas = frase.split(', ')
print(lista_palavra_cruas)

lista_frase = []
for i, frase in enumerate(lista_palavra_cruas):
    lista_frase.append(lista_palavra_cruas[i].strip())
    print(lista_frase)

frases_unidas = ', '.join(lista_frase)
print(frases_unidas)