"""
RESUMO DIDÁTICO:
Este script explora as diversas funcionalidades do método .format() para a interpolação 
de strings no Python. O código demonstra três níveis de complexidade: a substituição 
posicional automática (onde a ordem dos argumentos define o preenchimento), a 
substituição por índices numéricos (que permite reutilizar e reordenar valores 
específicos da lista de argumentos) e, por fim, a utilização de parâmetros nomeados 
(Keyword Arguments). Esta última técnica é a mais robusta, pois associa cada valor 
a um identificador único, tornando o código mais legível e menos dependente da 
ordem física das variáveis.
"""

a = 'A'
b = 'BB'
c = 2.2

string = 'a = {}    b = {}  c = {}'
formato1 = string.format(a, b, c)
print("V1:  " + formato1)

#---------------------------------

string = 'b = {1}   a = {2}  a = {2}  a = {2}  c = {0}'
formato2 = string.format(a, b, c)
print("V2:  " + formato2)

#---------------------------------

string = 'c = {nome3}   b = {nome1}  b = {nome2}  a = {nome2}'
formato3 = string.format(nome1 = a, nome2 = b, nome3 = c)
print("V3:  " + formato3)