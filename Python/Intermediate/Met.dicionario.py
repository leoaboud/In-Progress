"""
RESUMO DIDÁTICO:
Este script é um "canivete suíço" dos métodos de dicionários em Python.
Ele demonstra como manipular dados de forma segura e eficiente:

1. setdefault: Garante que uma chave exista sem sobrescrever o valor atual.
2. Extração: 'pop' remove uma chave específica, enquanto 'popitem' remove a última.
3. Update: O método mais versátil para atualizar ou adicionar múltiplos campos
   ao mesmo tempo, aceitando dicionários, argumentos nomeados ou listas de tuplas.
4. Conversão: Como transformar as partes de um dicionário em listas para facilitar
   a visualização ou iteração.
"""

pessoa = {
    'nome': 'Leonardo',
    'sobrenome': "Aboud",
    'idade': 27
}

# setdefault: Se 'idade' já existe, ele não faz nada e mantém o 27.
# Se não existisse, ele criaria 'idade': 0.
pessoa.setdefault('idade', 0)
print(f"Idade atual: {pessoa['idade']}") # Saída: 27

# Métodos de Visualização
print(f"Tamanho: {len(pessoa)}") # 3 campos
print(f"Chaves: {list(pessoa.keys())}") # ['nome', 'sobrenome', 'idade']
print(f"Valores: {list(pessoa.values())}") # ['Leonardo', 'Aboud', 27]
print(f"Itens (Pares): {list(pessoa.items())}") # [('nome', 'Leonardo'), ...]

# Extração de dados
nome_removido = pessoa.pop('nome') # Remove 'nome' e guarda o valor 'Leonardo'
ultima_chave = pessoa.popitem()    # Remove e retorna o último par ('idade', 27)

# Update - Forma 1: Usando um dicionário
pessoa.update({
    'nome': 'Giulia',
    'idade': 30
})

# Update - Forma 2: Usando argumentos nomeados (mais limpo)
pessoa.update(nome='Jessica', idade=32)

# Update - Forma 3: Você criou as variáveis 'tupla' e 'lista', 
# elas também poderiam ser usadas no update:
# pessoa.update(lista)

print(f"Estado final: {pessoa}")