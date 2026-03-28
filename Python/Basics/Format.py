
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