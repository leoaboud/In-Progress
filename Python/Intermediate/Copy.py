"""
RESUMO DIDÁTICO:
Este script aborda o problema da 'Cópia Rasa' vs 'Cópia Profunda'.

1. O Problema: Em Python, quando você copia um dicionário comum (d1.copy()), 
   objetos internos (como listas) não são copiados de verdade; eles são apenas 
   'compartilhados' entre o original e a cópia.
2. A Solução: O módulo 'copy.deepcopy' entra em todas as sub-camadas da estrutura.
3. Resultado: Ao usar 'deepcopy', o 'd1' e o 'd2' tornam-se universos paralelos. 
   Alterar uma lista dentro de 'd2' não causa o 'efeito colateral' de alterar 
   a mesma lista no 'd1'.
"""

import copy

d1 = {
    'c1': 1,
    'c2': 2,
    'l1': [0, 1, 2], # Isso é um objeto mutável dentro do dicionário
}

# d1.copy() faria uma cópia rasa (shallow)
# copy.deepcopy(d1) faz a cópia profunda
d2 = copy.deepcopy(d1)

d2['c1'] = 1000
d2['l1'][1] = 999

print(f'Dicionário 1: {d1}')
print(f'Dicionário 2: {d2}')