"""
RESUMO DIDÁTICO:
Este script demonstra a interação básica entre entrada e saída de dados no Python. 
Utiliza a função input() para capturar informações fornecidas pelo usuário através 
do teclado, armazenando-as em variáveis. Em seguida, emprega uma f-string para 
realizar a interpolação dessas variáveis em uma mensagem de texto. Um ponto 
importante é que, por padrão, a função input() sempre retorna os dados no formato 
de texto (string), mesmo que o usuário digite apenas números, permitindo que a 
exibição final seja montada de forma direta e eficiente.
"""

nome = input('Digite seu nome: ')
idade = input('digite sua idade: ')

print(f'{nome} tem {idade} anos')