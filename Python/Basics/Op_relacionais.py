"""
RESUMO DIDÁTICO:
Este script apresenta os operadores de comparação (ou relacionais) no Python, que são
utilizados para analisar a relação entre dois valores. O resultado de qualquer 
comparação é sempre um valor booleano: True (Verdadeiro) ou False (Falso). O código
demonstra as verificações de magnitude (maior, menor, maior ou igual, menor ou igual)
e as verificações de identidade (igualdade '==' e diferença '!='). Esses operadores 
são a espinha dorsal da lógica de programação, permitindo que o sistema tome decisões
e desvie o fluxo do código com base em condições variáveis.
"""

num_1 = 10
num_2 = 5

# Operadores de Comparação
maior = num_1 > num_2           # True
maior_igual = num_1 >= num_2     # True
menor = num_1 < num_2           # False
menor_igual = num_1 <= num_2     # False
igual = num_1 == num_2           # False
diferente = num_1 != num_2       # True

print(f'{num_1} > {num_2}  :', maior)
print(f'{num_1} >= {num_2} :', maior_igual)
print(f'{num_1} < {num_2}  :', menor)
print(f'{num_1} <= {num_2} :', menor_igual)
print(f'{num_1} == {num_2} :', igual)
print(f'{num_1} != {num_2} :', diferente)