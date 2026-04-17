"""
RESUMO DIDÁTICO:
Este script introduz o conceito fundamental de Funções (def) no Python. Funções são 
blocos de código reutilizáveis que executam uma tarefa específica, permitindo que 
você organize seu programa de forma modular e evite a repetição de código (princípio 
DRY - Don't Repeat Yourself). 

O código demonstra dois pilares das funções:
1. Parâmetros Posicionais: Na função 'imprimir', os valores passados devem seguir a 
   ordem definida na criação.
2. Argumentos Nomeados e Padrão (Default): Na função 'saudacao', definimos um valor 
   padrão ('Sem nome'). Isso torna o parâmetro opcional; se o usuário não enviar um 
   dado, o sistema assume o valor padrão, evitando erros de execução e tornando a 
   função mais flexível.
"""

# Definição de uma função com três parâmetros obrigatórios
def imprimir(a, b, c):
    print(a, b, c)

# Chamadas enviando argumentos posicionais
imprimir(1, 2, 3)
imprimir(4, 5, 6)

# Definição de função com parâmetro opcional (valor padrão)
def saudacao(nome='Sem nome'):
    print(f'Olá, {nome}!')

# Chamadas enviando argumentos
saudacao('Leonardo')
saudacao('Jessica')
saudacao('Giulia')

# Chamada sem argumento: usará o valor 'Sem nome'
saudacao()