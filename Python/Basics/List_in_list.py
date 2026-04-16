"""
RESUMO DIDÁTICO:
Este script demonstra a manipulação de Matrizes (Listas de Listas) e o acesso a 
Estruturas Aninhadas. No Python, uma lista pode conter qualquer tipo de objeto, 
incluindo outras listas ou tuplas. Para acessar um dado específico nessas camadas, 
utilizamos múltiplos colchetes: o primeiro acessa a "linha" (sublista), o segundo 
acessa o "item" dentro dessa linha e, se houver uma coleção interna (como a tupla 
no índice [2][3]), um terceiro par de colchetes permite alcançar o valor 
individual. O exemplo 'salas[2][3][2]' ilustra perfeitamente essa "escada" de 
acessos, percorrendo da estrutura mais externa até o número 20, escondido dentro 
da tupla.
"""

# Estrutura aninhada: Lista contendo Listas e uma Tupla
salas = [
    # Índice 0
    ['Maria', 'Giulia',],
    # Índice 1
    ['Gabriela',],
    # Índice 2
    ['Leonardo', 'Jessica', 'Anita', (0, 10, 20, 30, 40)], # Tupla no índice 3 desta sublista
]

# Acessando 'Gabriela': Índice 1 da lista principal, índice 0 da sublista
print(salas[1][0])

# Acessando 'Giulia': Índice 0 da lista principal, índice 1 da sublista
print(salas[0][1])

# Acessando o valor 20: 
# Índice 2 da lista principal -> índice 3 (tupla) -> índice 2 da tupla
print(salas[2][3][2])