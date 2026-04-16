"""
RESUMO DIDÁTICO:
Este script demonstra a técnica clássica de iteração por índices em uma lista. 
Utilizando a combinação das funções len() e range(), o código gera uma sequência 
numérica que corresponde às posições válidas da lista. No laço 'for', cada número 
produzido pelo range é usado como uma "chave" para acessar o elemento correspondente 
através da indexação direta (lista[indice]). O uso da função type() dentro do print 
confirma que a variável 'indice' é do tipo inteiro (int), reforçando que o range 
trabalha exclusivamente com números inteiros para o controle das iterações.
"""

lista = ['Jessica', 'Giulia', 'Leonardo']
indices = range(len(lista))

for indice in indices:
    print(indice, lista[indice], type(indice))