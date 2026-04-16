"""
RESUMO DIDÁTICO:
Este script exemplifica o conceito de Coerção de Tipo (Type Casting), que consiste no 
processo de converter um dado de um tipo para outro de forma explícita ou implícita. 
No código, uma string contendo um número é convertida para inteiro (int) e para decimal 
(float). Além disso, demonstra o "Type Promotion" (Promoção de Tipo), onde o Python 
converte automaticamente o resultado de uma operação entre um float e um int para float, 
garantindo que não haja perda de precisão matemática durante o cálculo.
"""

# COERÇÃO DE TIPO

print(int('1'), type(int('1')))

print(type(float('1') + 1))