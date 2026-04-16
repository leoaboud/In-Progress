"""
RESUMO DIDÁTICO:
Este script demonstra a criação e o uso de Variáveis e Operadores Lógicos de Comparação. 
No Python, variáveis são espaços na memória que armazenam dados como textos (strings) 
e números (inteiros). O código também exemplifica a atribuição de um valor booleano 
(True ou False) a uma variável através de uma expressão lógica: a variável 
'maior_de_idade' não guarda o número 18, mas sim o resultado do teste "idade é maior 
ou igual a 18?". Ao final, a função print() é utilizada para exibir os dados de forma 
concatenada, permitindo que informações fixas e variáveis sejam apresentadas 
em uma única linha de saída.
"""

nome = 'Leonardo'
idade = 27

# Expressão relacional que resulta em um valor Booleano (True/False)
maior_de_idade = idade >= 18

print('Nome:', nome, 'Idade:', idade)
print('Você é maior de idade?', maior_de_idade)