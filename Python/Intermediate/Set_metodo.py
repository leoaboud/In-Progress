"""
RESUMO DIDÁTICO: Estrutura de Dados Set (Conjuntos) e Operações Matemáticas em Python

Este código ilustra a criação, manipulação e operações lógicas usando Set (conjunto) em Python.
Além de gerenciar elementos únicos, os conjuntos em Python replicam a teoria matemática de conjuntos.

O código ilustra:
1. Criação de um Conjunto Vazio ('set()'): Para criar um conjunto sem elementos, é obrigatório 
   usar a função 'set()'. Usar apenas chaves vazias ('{}') criaria um dicionário vazio.
2. Elementos Únicos e Tipos Mistos ('add'): O método '.add()' insere um elemento por vez. 
   Conjuntos aceitam tipos de dados mistos e **não permitem duplicatas**: elementos repetidos 
   são ignorados automaticamente.
3. Inserção em Lote ('update'): O método '.update()' permite adicionar múltiplos elementos de 
   uma só vez a partir de uma estrutura iterável (como uma tupla ou lista).
4. Remoção Segura ('discard'): O método '.discard()' remove um elemento específico. Se o item 
   não existir no conjunto, o Python ignora e não gera erros (ao contrário do '.remove()').
5. Não Ordenação: Conjuntos não preservam a ordem de inserção e não possuem índices ('s1[0]' quebra).

OPERAÇÕES DE CONJUNTOS (Parte Nova):
- União ('|'): Junta todos os elementos de ambos os conjuntos, removendo as duplicatas.
- Interseção ('&'): Filtra e mantém apenas os elementos que estão presentes em ambos ao mesmo tempo.
- Diferença ('-'): Remove do primeiro conjunto tudo o que também existir no segundo conjunto.
- Diferença Simétrica ('^'): Mantém tudo, EXCETO o que for comum entre eles (o oposto da interseção).
"""

# ==================== PARTE 1: MANIPULAÇÃO BÁSICA ====================

# 1. Inicializa um conjunto completamente vazio
s1 = set()

# 2. Adiciona elementos individualmente
s1.add("Leonardo")
s1.add(1)

# 3. Adiciona vários elementos de uma vez usando uma tupla. 
s1.update(("Olá mundo", 1, 2, 3, 4))

# 4. Remove elementos de forma segura.
s1.discard("Olá mundo")
s1.discard("Leonardo")

# 5. Exibe o resultado final no console
# Saída esperada: {1, 2, 3, 4}
print("Resultado da Parte 1:", s1)


# ==================== PARTE 2: OPERAÇÕES MATEMÁTICAS ====================

s1 = {1, 2, 3}
s2 = {2, 3, 4}

# União: Elementos que estão em s1 OU s2
s3 = s1 | s2  # Saída esperada: {1, 2, 3, 4}

# Interseção: Elementos que estão em s1 E s2 ao mesmo tempo
s4 = s1 & s2  # Saída esperada: {2, 3}

# Diferença: Elementos que estão em s1, mas NÃO estão em s2
s5 = s1 - s2  # Saída esperada: {1}

# Diferença Simétrica: Elementos que estão em s1 ou s2, mas NÃO em ambos
s6 = s1 ^ s2  # Saída esperada: {1, 4}

print("União (|):", s3)
print("Interseção (&):", s4)
print("Diferença (-):", s5)
print("Diferença Simétrica (^):", s6)