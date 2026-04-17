"""
RESUMO DIDÁTICO:
Este script explora o conceito de Desempacotamento (Unpacking) no Python, uma técnica 
poderosa para extrair valores de coleções e distribuí-los em variáveis ou argumentos 
de funções. O código demonstra o desempacotamento em variáveis utilizando o operador 
'*_' para capturar e descartar valores intermediários, permitindo focar apenas nos 
itens de interesse (como o primeiro, o penúltimo e o último da lista). Além disso, 
o uso do caractere asterisco (*) antes de um objeto em uma função como o print() 
realiza o desempacotamento de argumentos: cada item da coleção é enviado como um 
parâmetro individual, o que facilita a exibição formatada de strings, listas, 
tuplas e até matrizes complexas de forma limpa e legível.
"""

string = 'ABCD'
lista = ['Leonardo', 'Jessica', 1, 2, 3, 'Giulia']
tupla = 'Python', 'é', 'legal'
salas = [
    ['Maria', 'Giulia',],
    ['Gabriela',],
    ['Leonardo', 'Jessica', 'Anita'],
]

# 1. Desempacotamento em variáveis
# p (primeiro), s (segundo), *_ (resto ignorado), ap (penúltimo), u (último)
p, s, *_, ap, u = lista
print('Destaques da lista:', p, u, ap)

print('\n--- Desempacotamento no print ---')

# 2. Desempacotamento de iteráveis (espalhamento)
print(*string)  
print(*lista)   
print(*tupla)   

# 3. Desempacotamento de matrizes com separador customizado
# Cada sublista vira um argumento para o print, separados por quebra de linha
print(*salas, sep='\n')