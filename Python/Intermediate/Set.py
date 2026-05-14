"""
RESUMO DIDÁTICO:
Este script explora os 'Sets' (Conjuntos) em Python. 
As principais características demonstradas são:
1. Eliminação Automática de Duplicatas: Sets não permitem valores repetidos.
2. Conversão (Casting): Transformar listas em sets é o método mais rápido para 
   limpar dados duplicados.
3. Pertencimento: O uso do operador 'in' em sets é extremamente performático 
   (muito mais rápido do que em listas) devido ao uso de tabelas Hash.
"""

# Criando um set vazio (obrigatório usar set(), pois {} cria um dicionário)
s1 = set()

# Set com dados mistos
s2 = {'Luiz', 1, 2, 3}

# Demonstração de unicidade: o Python ignorará os números repetidos
s3 = {1, 2, 3, 3, 3, 3, 3, 3, 1}
# print(s3) resultaria em {1, 2, 3}

l1 = [1, 2, 3, 3, 3, 3, 3, 1]
# Transformando uma lista em set para remover duplicatas
s4 = set(l1)

# Transformando de volta para lista (agora limpa, sem repetidos)
l2 = list(s4)

# Verificação de presença (Booleano: True/False)
print(3 in s4)