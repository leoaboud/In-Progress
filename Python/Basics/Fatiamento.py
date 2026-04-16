"""
RESUMO DIDÁTICO:
Este script explora a técnica de Fatiamento (Slicing) de strings no Python, que permite 
acessar caracteres individuais ou intervalos específicos de uma sequência. A sintaxe 
utilizada segue o padrão [início:fim:passo]. O código demonstra o acesso direto por 
índice, a extração de subconjuntos de caracteres e o uso do 'passo' para saltar posições. 
Além disso, exemplifica o uso de índices negativos, que realizam a leitura da direita 
para a esquerda, permitindo inclusive a inversão da ordem dos caracteres de forma 
simples e eficiente.
"""

variavel = 'olá mundo'

print(variavel[4])

print(variavel[4:6])

print(variavel[0:9:2])

print(variavel[-1:-10:-3])

print(variavel[-1:-10:-1])