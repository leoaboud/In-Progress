"""
RESUMO DIDÁTICO:
Este script combina o uso de funções variádicas (*args) para cálculos matemáticos 
e lógica condicional para classificação de números. 
1. A função 'multi' demonstra como acumular valores usando o operador de 
   atribuição composta (*=).
2. A função 'par_impar' utiliza o operador de módulo (%) para verificar a 
   divisibilidade, retornando uma string formatada com o resultado.
"""

# Função que recebe argumentos ilimitados e multiplica todos entre si
def multi(*args):
    total = 1 # Iniciamos com 1, pois qualquer número vezes 0 é 0
    for numeros in args:
        total *= numeros # Acumula a multiplicação: total = total * numeros
    return total

# Chamada da função multi e armazenamento do resultado
multiplicacao = multi(1, 2, 3, 4, 5, 8)
print(multiplicacao) # Resultado esperado: 960


# Função para verificar se um número é par ou ímpar
def par_impar(numeros):
    # CORREÇÃO: Verificamos o resto da divisão do número passado por 2
    # Se o resto for 0, a variável 'e_par' será True (Verdadeiro)
    e_par = numeros % 2 == 0
    
    # CORREÇÃO: Se 'e_par' for verdadeiro, o número é par
    if e_par:
        return f'{numeros} é um número par'
    # Caso contrário, o número é ímpar
    return f'{numeros} é um número impar'

# Chamada da função par_impar passando o resultado da multiplicação anterior
print(par_impar(multiplicacao))