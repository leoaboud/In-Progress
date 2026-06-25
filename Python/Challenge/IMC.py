"""
RESUMO DIDÁTICO: Expressões Aritméticas e Precedência de Operadores em Python

Este código ilustra como realizar cálculos matemáticos complexos utilizando variáveis numéricas, 
destacando o uso de operadores aritméticos essenciais no Python.

O código ilustra:
1. Operador de Exponenciação ('**'): Em Python, para elevar um número a uma potência (como 
   calcular o quadrado da altura), utiliza-se o operador de dois asteriscos ('**'). O uso de 
   'altura ** 2' equivale a $altura^2$.
2. Operador de Divisão ('/'): Representado pela barra diagonal, realiza a divisão tradicional 
   e sempre retorna um número do tipo Ponto Flutuante ('float'), mesmo que a divisão seja exata.
3. Precedência Matemática e Parênteses: Assim como na matemática tradicional, os parênteses '()' 
   têm a maior prioridade. Ao escrever 'peso / (altura ** 2)', o Python garante que primeiro 
   será calculado o quadrado da altura, para só depois dividir o peso pelo resultado obtido.
4. Concatenação Implícita no 'print()': Separar textos e variáveis por vírgulas dentro da função 
   'print' faz com que o Python junte tudo em uma única linha na tela, adicionando espaços em 
   branco de forma automática entre cada elemento.
"""

# Declaração das variáveis com os dados do usuário
nome = "Leonardo"
altura = 1.70 
peso = 60

# Cálculo do IMC: Peso dividido pela Altura elevada ao quadrado
imc = peso / (altura ** 2)

# Exibição formatada dos resultados no console
print('Nome:', nome, 'tem altura de', altura, 'e pesa', peso, 'kg')
print('Seu IMC é', imc)