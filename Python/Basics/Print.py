"""
RESUMO DIDÁTICO:
Este script explora as diversas capacidades da função print() no Python. O código 
demonstra a exibição de números inteiros, o uso de múltiplos argumentos separados 
por vírgula e a personalização da saída através dos argumentos nomeados 'sep' 
(separador entre itens) e 'end' (caractere final da linha). Além disso, o script 
exemplifica a flexibilidade das strings (textos), mostrando como alternar entre 
aspas simples (' ') e duplas (" ") para incluir citações ou nomes destacados dentro 
de uma frase sem a necessidade de caracteres de escape, garantindo que a formatação 
visual seja mantida conforme o desejado.
"""

# Uso de argumentos numéricos e separadores
print(12)
print(34, 56)

# Customização com separador (sep) e finalizador de linha (end)
# O padrão de 'sep' é espaço (" ") e o de 'end' é quebra de linha ("\n")
print(78, 90, sep="-", end=".") 
print("") # Apenas para pular uma linha após o "end" customizado

# Manipulação de Strings e Aspas
print("Aboud")
print("Leoardo Aboud")

# Alternando aspas para exibir aspas dentro do texto
print('Leoardo "Aboud"')
print("'Leonardo' Aboud")