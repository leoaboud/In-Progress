"""
RESUMO DIDÁTICO:
Este script ilustra o conceito de Tuplas no Python. Ao declarar variáveis separadas 
por vírgulas sem o uso de colchetes, o Python cria automaticamente uma tupla, que 
é uma coleção ordenada e imutável. Assim como nas listas, o acesso aos elementos 
é feito através de índices que iniciam em 0. No exemplo, 'nomes[1]' acessa o 
segundo elemento da coleção. A principal vantagem das tuplas em relação às listas 
é a segurança e a performance: por serem imutáveis (não permitem alteração após 
a criação), elas ocupam menos espaço na memória e garantem a integridade dos dados 
ao longo da execução do programa.
"""

# Criando uma tupla (empacotamento de valores)
nomes = 'Jessica', 'Giulia', 'Leonardo'

# Acessando o segundo elemento (índice 1)
print(nomes[1])

# Confirmando o tipo do objeto
print(type(nomes))