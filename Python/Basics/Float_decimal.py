"""
RESUMO DIDÁTICO:
Este script aborda a precisão de números de ponto flutuante (float) e as diferentes 
formas de controlar a exibição de casas decimais no Python. Devido ao padrão IEEE 754 
de representação binária, cálculos com floats podem gerar pequenas imprecisões (como 
0.7999... em vez de 0.8). O código demonstra como contornar isso utilizando f-strings 
com especificadores de precisão (:.1f) para formatação visual e a função nativa 
round() para arredondamento matemático, garantindo que o resultado final seja 
apresentado de maneira clara e correta para o usuário.
"""

num_1 = 0.1
num_2 = 0.7
num_3 = num_1 + num_2

print(num_3)
print(f'{num_3:.1f}')
print(f'{num_3:.2f}')
print(round(num_3, 2))