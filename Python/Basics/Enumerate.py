lista = ['Jessica', 'Giulia', 'Leonardo']
lista.append('Maria')

lista_enumerada = enumerate(lista)

for indice, nome in lista_enumerada:
    print(indice, nome)