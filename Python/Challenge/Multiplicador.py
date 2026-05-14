"""
RESUMO DIDÁTICO:
Este script é um exemplo clássico de Closures (Fechamentos) aplicados à lógica 
matemática. Aqui, 'criar_multiplicador' atua como uma fábrica de funções especializadas. 

Ao executar 'duplicar = criar_multiplicador(2)', você não está apenas salvando um 
número, mas sim criando uma nova função que possui em sua memória "genética" a 
instrução de sempre multiplicar qualquer entrada por 2. Isso permite que você 
crie diversas variações de comportamento (duplicar, triplicar, etc.) sem precisar 
reescrever a lógica de multiplicação todas as vezes.
"""

# Função Fábrica: define o comportamento base
def criar_multiplicador(multiplicador):
    # Função Interna (Closure): lembra do valor de 'multiplicador'
    def multiplicar(numero):
        return numero * multiplicador
    # Retorna a função especializada
    return multiplicar

# Instanciação: Criando 3 funções distintas com memórias diferentes
duplicar = criar_multiplicador(2)
triplicar = criar_multiplicador(3)
quadruplicar = criar_multiplicador(4)

# Execução: Cada função utiliza sua própria "memória de escopo"
print(duplicar(5))      # Saída: 10 (5 * 2)
print(triplicar(5))     # Saída: 15 (5 * 3)
print(quadruplicar(5))  # Saída: 20 (5 * 4)