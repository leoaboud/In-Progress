"""
RESUMO DIDÁTICO:
Este script ilustra o uso da função enumerate() para percorrer coleções de dados 
mantendo o controle do índice de cada elemento. Primeiro, a lista original é 
modificada dinamicamente através do método .append(), que adiciona um novo item 
ao final da estrutura. Em seguida, o objeto 'enumerate' associa cada valor da 
lista a um contador numérico automático. No laço de repetição (for), ocorre o 
desempacotamento de cada par (índice, valor), permitindo uma exibição organizada 
dos dados e de suas respectivas posições na memória.
"""

lista = ['Jessica', 'Giulia', 'Leonardo']
lista.append('Maria')

lista_enumerada = enumerate(lista)

for indice, nome in lista_enumerada:
    print(indice, nome)