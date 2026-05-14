"""
RESUMO DIDÁTICO:
Este script demonstra o uso do operador asterisco (*) para empacotamento e 
desempacotamento. Ele mostra como capturar sobras de uma lista, como criar 
funções que aceitam qualquer quantidade de números (*args) e como "espalhar" 
uma coleção de dados para dentro de uma função.
"""

# Atribuição com desempacotamento: x=1, y=2 e o '*' agrupa o que sobrar em 'resto'
x, y, *resto = 1, 2, 3, 4
print(x, y, resto) # Exibe: 1 2 [3, 4]

# Definição de função que usa *args para empacotar argumentos em uma tupla
def soma(*args):
    total = 0
    # Itera sobre a tupla 'args' criada automaticamente pelo Python
    for numero in args:
        print('Total', total, numero)
        total += numero # Acumula o valor atual no total
        print('Total', total)
    # Exibe o resultado final, mas não retorna o valor (saída implícita: None)
    print(total)

# Chamada da função passando 6 argumentos posicionais individuais
soma(1, 2, 3, 4, 5, 6) 

# Criação de uma tupla com 10 números
numeros = 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

# Chamada usando o '*' para desempacotar (espalhar) a tupla 'numeros' 
# Isso envia cada item da tupla como um argumento separado para a função
outra_soma = soma(*numeros)

# Como a função 'soma' não possui a palavra-chave 'return', ela devolve None por padrão
print(outra_soma)

# Exemplo de uso da função nativa sum() para somar todos os itens da tupla de uma vez
print(sum(numeros))