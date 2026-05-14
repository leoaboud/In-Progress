"""
RESUMO DIDÁTICO:
Este script demonstra o conceito de Retorno de Função (palavra-chave 'return') e a 
natureza dinâmica do Python. Uma função termina sua execução imediatamente ao 
encontrar um 'return', enviando o valor resultante de volta para quem a chamou. 

O código também ilustra que uma mesma função pode retornar tipos de dados diferentes 
dependendo da condição: neste caso, uma Lista `[10, 20]` (se x > 10) ou um Número 
inteiro (caso contrário). Isso exige atenção do desenvolvedor, pois operações 
matemáticas como a soma final (`soma1 + soma2`) só funcionarão se ambos os retornos 
forem numéricos.
"""

def soma(x, y):
    # Se a condição for verdadeira, a função retorna uma lista e PARA aqui
    if x > 10:
        return [10, 20]
    
    # Se a condição acima for falsa, ela executa o cálculo e retorna o valor
    return x + y

# x=2, y=2. Como 2 não é > 10, retorna 2 + 2 = 4
soma1 = soma(2, 2)

# x=3, y=3. Como 3 não é > 10, retorna 3 + 3 = 6
soma2 = soma(3, 3)

# Exibe os resultados individuais
print(soma1) # 4
print(soma2) # 6

# Realiza a soma dos valores retornados (4 + 6 = 10)
print(soma1 + soma2)