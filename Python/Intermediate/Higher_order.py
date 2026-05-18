"""
RESUMO DIDÁTICO:
Este script introduz o conceito de Funções de Ordem Superior (Higher-Order Functions). 
No Python, funções são objetos de "primeira classe", o que significa que podem ser 
passadas como argumentos para outras funções, da mesma forma que passamos números 
ou strings.

A função 'executa' atua como um "wrapper" (embrulho) ou mediador: ela recebe uma 
entidade funcional ('funcao') e os dados necessários (*args), disparando a 
execução internamente. Essa técnica é a base para padrões de projeto avançados, 
como Decoradores e Fábricas de Funções, permitindo criar códigos extremamente 
dinâmicos e flexíveis.
"""

def saudacao(msg, nome):
    """Função simples que formata uma mensagem de saudação."""
    return f'{msg}, {nome}'

def executa(funcao, *args):
    """
    Função de Ordem Superior:
    1. Recebe um objeto função no primeiro parâmetro.
    2. Recebe uma quantidade ilimitada de argumentos (*args).
    3. Retorna a execução da função recebida, desempacotando os argumentos.
    """
    return funcao(*args)

# Aqui, passamos a PRÓPRIA FUNÇÃO 'saudacao' (sem os parênteses) como argumento.
# 'Bom dia' e 'Leonardo' entram no *args da função 'executa'.
v = executa(saudacao, 'Bom dia', 'Leonardo')

print(v) # Exibe: Bom dia, Leonardo