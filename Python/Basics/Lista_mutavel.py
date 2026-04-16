"""
RESUMO DIDÁTICO:
Este script detalha a manipulação dinâmica de Listas (Mutabilidade) no Python. 
Diferente das strings, as listas permitem alterar, adicionar, remover e mover 
elementos em tempo real. O código demonstra operações fundamentais: .append() 
para adicionar ao final, .pop() para remover o último item (ou um índice específico), 
del para deletar posições, e .insert() para injetar dados em qualquer lugar da lista. 
Também são apresentadas formas de combinar listas: a concatenação (+) que gera uma 
nova lista, e o método .extend(), que modifica a lista original "in-place", 
anexando os elementos de outra coleção de forma eficiente.
"""

# BLOCO 1: Mutabilidade e Acesso
string = 'abcde' # Imutável
lista = [123, True, 'Leonardo', 1.2, []]
lista[2] = 'Aboud' # Alterando o valor no índice 2
print(lista)
print(lista[2], type(lista[2]))

# ---------------------------------

# BLOCO 2: Métodos de Exclusão e Inclusão
lista_numerica = [10, 20, 30, 40]
lista_numerica[2] = 350
del lista_numerica[1] # Remove o 20
numero = lista_numerica[2] # Captura o valor no índice 2
lista_numerica.append(50)
lista_numerica.pop() # Remove o 50 (último)
lista_numerica.append(60)
lista_numerica.pop(1) # Remove pelo índice
lista_numerica.append('Iwamoto')
ultimo_valor = lista_numerica.pop()
print(lista_numerica, 'removido', ultimo_valor)

# ---------------------------------

# BLOCO 3: Inserção em Posições Específicas
lista_nomes = [10, 20, 30, 40]
lista_nomes.append('Leonardo')
nome_removido = lista_nomes.pop()
lista_nomes.append(123)
del lista_nomes[-1]
lista_nomes.insert(0, 'Aboud') # Insere 'Aboud' no início (índice 0)
print(lista_nomes)

# ---------------------------------

# BLOCO 4: Concatenação vs Extensão
lista_a = [1, 2, 3]
lista_b = [4, 5, 6]
lista_c = lista_a + lista_b # Cria uma nova lista (1,2,3,4,5,6)
lista_a.extend(lista_b)    # Altera a lista_a adicionando os itens da b
print(lista_a)