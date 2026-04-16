"""
RESUMO DIDÁTICO:
Este script ilustra a Precedência de Operadores Aritméticos no Python, que define a 
ordem em que os cálculos são resolvidos em uma expressão matemática. Seguindo uma 
lógica similar à álgebra, o Python prioriza o que está entre parênteses, seguido pela 
exponenciação, depois multiplicação/divisão e, por último, adição/subtração. O código 
compara duas variáveis com os mesmos números, mas resultados drasticamente diferentes: 
em 'conta_1', a potência é resolvida primeiro, enquanto em 'conta_2', os parênteses 
forçam a realização das somas antes da elevação, demonstrando como a organização 
dos operadores altera completamente o fluxo do cálculo.
"""

# Ordem de Precedência (Hierarquia):
# 1. (n + n) - Parênteses
# 2. ** - Exponenciação
# 3. * / // % - Multiplicação, Divisão, Divisão Inteira e Módulo
# 4. + -      - Adição e Subtração

conta_1 = 1 + 1 ** 5 + 5
# Passo 1: 1 ** 5 = 1
# Passo 2: 1 + 1 + 5 = 7
print(conta_1)


conta_2 = (1 + 1) ** (5 + 5)
# Passo 1: (1 + 1) = 2
# Passo 2: (5 + 5) = 10
# Passo 3: 2 ** 10 = 1024
print(conta_2)