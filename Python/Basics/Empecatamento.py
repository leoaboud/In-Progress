"""
RESUMO DIDÁTICO:
Este script demonstra a técnica de Desempacotamento de Listas (List Unpacking) com o uso 
de variáveis de descarte e o operador rest (*). O símbolo de sublinhado (_) é utilizado 
por convenção para sinalizar que os dois primeiros valores da lista devem ser ignorados. 
A variável 'nome' captura o terceiro elemento, enquanto o operador asterisco (*resto) 
coleta todos os valores sobressalentes — caso existissem — e os armazena em uma nova 
lista. É uma forma eficiente e legível de extrair dados específicos de estruturas 
iteráveis mantendo o controle sobre o que sobra.
"""

_, _, nome, *resto = ['Jessica', 'Giulia', 'Leonardo']
print(nome, resto)