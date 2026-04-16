"""
RESUMO DIDÁTICO:
Este script introduz o conceito de Tratamento de Exceções utilizando o bloco 
'try/except'. Em programação, converter uma entrada do usuário (que é sempre string) 
para um número (float) é uma operação de risco, pois o usuário pode digitar letras 
ou símbolos, o que causaria um erro fatal (crash) no programa. O bloco 'try' tenta 
executar o código; se ocorrer um erro durante a conversão, o fluxo é desviado 
imediatamente para o bloco 'except', onde podemos exibir uma mensagem amigável 
em vez de interromper o sistema. É a técnica fundamental para tornar softwares 
mais resilientes e tolerantes a falhas de entrada.
"""

numero_str = input('Vou dobrar o número que você digitar: ')

try:
    # Tenta realizar a conversão e o cálculo
    numero_float = float(numero_str)
    
    print('FLOAT: ', numero_float)
    print(f'O dobro de {numero_str} é {numero_float * 2:.2f}')

except:
    # Caso o usuário tenha digitado algo que não possa ser convertido em float
    print('Isso não é um número')