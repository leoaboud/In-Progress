"""
RESUMO DIDÁTICO:
Este script utiliza a função nativa id() para acessar o endereço de memória de 
diferentes objetos no Python. No Python, cada variável aponta para um local único 
na memória onde o valor está armazenado. Ao imprimir o ID de 'v1' e 'v2', o código 
mostra que, embora ambas sejam strings, elas residem em espaços de memória distintos. 
Essa função é essencial para entender conceitos avançados como mutabilidade, 
identidade de objetos e como o interpretador gerencia o armazenamento de dados 
internamente.
"""

v1 = 'a'
v2 = 'b'

print(id(v1))
print(id(v2))