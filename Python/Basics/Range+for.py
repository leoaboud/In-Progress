"""
RESUMO DIDÁTICO:
Este script detalha o funcionamento da função range(), que é utilizada para gerar 
sequências numéricas de forma eficiente. A função pode receber até três argumentos: 
start (início), stop (fim, não inclusivo) e step (passo/intervalo). O código 
demonstra três variações: apenas o limite final (começando em 0), definição de 
início e fim, e a inclusão de um salto (step) para pular números. É importante 
notar que o valor de 'stop' nunca é incluído na sequência final. O uso do laço 
'for' permite percorrer essas sequências, sendo uma ferramenta indispensável para 
controlar repetições e iterar sobre índices de coleções.
"""

# range(stop) -> Começa em 0 e vai até stop-1
numeros1 = range(10)

# range(start, stop) -> Começa em start e vai até stop-1
numeros2 = range(5, 10)

# range(start, stop, step) -> Começa em start, vai até stop-1, pulando de step em step
numeros3 = range(5, 10, 2)

print("--- Sequência 1 (0 a 9) ---")
for numero1 in numeros1:
    print(numero1)

print("\n--- Sequência 2 (5 a 9) ---")
for numero2 in numeros2:
    print(numero2)

print("\n--- Sequência 3 (5 a 9, passo 2) ---")
# Corrigindo a variável no loop para numeros3 (no original estava numeros1)
for numero3 in numeros3:
    print(numero3)