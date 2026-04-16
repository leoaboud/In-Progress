"""
RESUMO DIDÁTICO:
Este script apresenta os operadores aritméticos fundamentais do Python, destacando as 
nuances entre os diferentes tipos de cálculos. Além das operações básicas de adição, 
subtração e multiplicação, o código diferencia a divisão convencional (/), que sempre 
retorna um número flutuante, da divisão inteira (//), que descarta as casas decimais. 
Também são explorados a exponenciação (**) para cálculos de potência e o operador de 
módulo (%), que retorna o resto de uma divisão — uma ferramenta essencial para 
verificar a paridade de números ou criar ciclos em algoritmos.
"""

adicao = 10 + 10
print('Adição', adicao)

subtracao = 10 - 5
print('Subtraçao', subtracao)

multiplicacao = 10 * 10
print('Multiplicacao', multiplicacao)

# Divisão sempre retorna float (ex: 4.5454...)
dvisao = 10 / 2.2
print('Divisão', dvisao)

# Divisão inteira trunca o resultado (ex: 4.0)
divisao_inteira = 10 // 2.2
print('Divisão inteira', divisao_inteira)

exponenciacao = 10 ** 10
print('Exponenciação', exponenciacao)

# Módulo: o resto da divisão de 55 por 2
modulo = 55 % 2
print('Modulo', modulo)