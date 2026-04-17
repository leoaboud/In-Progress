"""
RESUMO DIDÁTICO:
Este script apresenta o Operador Ternário (ou Expressão Condicional) do Python, uma 
forma compacta de escrever estruturas 'if/else' em uma única linha. A sintaxe 
funciona como uma escolha direta: <valor_se_verdadeiro> if <condicao> else <valor_se_falso>. 
O código demonstra como essa técnica é útil para atribuições rápidas, como validar 
dígitos (garantindo que não ultrapassem o valor 9) ou realizar escolhas baseadas 
em estados lógicos. Além disso, o script exemplifica o aninhamento de ternários, 
mostrando como encadear múltiplas verificações em uma sequência fluida, embora 
exija atenção redobrada para manter a clareza do código.
"""

# 1. Operação ternária básica
# Como 10 == 11 é Falso, a variável assumirá o valor após o 'else'
condicao = 10 == 11
variavel = 'Valor' if condicao else 'Outro valor'
print(f'Exemplo 1: {variavel}')

# 2. Validação de dados (Lógica de dígito único)
digito = 9
# Ambas as formas abaixo resultam no mesmo comportamento para este caso
novo_digito  = digito if digito <= 9 else 0
novo__digito = 0 if digito > 9 else digito

print(f'Validação 1: {novo_digito}')
print(f'Validação 2: {novo__digito}')

# 3. Ternários aninhados (Encadeamento)
# O Python avalia da esquerda para a direita:
# É False? Não. Então pula para o próximo 'else'.
# O próximo teste (if True) é verdadeiro? Sim. Então imprime 'Outro valor'.
resultado_complexo = 'Valor' if False else 'Outro valor' if True else 'Fim'
print(f'Resultado aninhado: {resultado_complexo}')