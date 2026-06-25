"""
RESUMO DIDÁTICO: Laço Infinito e Checagem de Existência em Conjuntos (Operador 'in')

Este código ilustra como usar um conjunto (Set) para acumular a entrada de dados do usuário 
dentro de um laço de repetição infinito, realizando uma checagem de vitória/parada.

O código ilustra:
1. Inicialização Dinâmica ('set()'): Cria um conjunto vazio pronto para armazenar strings.
2. Laço Infinito ('while True'): Mantém o programa rodando indefinidamente até que uma 
   condição de parada explícita seja acionada. O 'T' de 'True' precisa ser sempre maiúsculo.
3. Sanitização de Entrada ('.lower()'): Converte a letra digitada para minúscula antes de 
   salvar. Isso garante que se o usuário digitar 'L' ou 'l', o sistema trate como a mesma coisa.
4. Operador de Associação ('in'): Uma das operações mais rápidas e eficientes em conjuntos. 
   O comando '"l" in letras' varre o conjunto instantaneamente para saber se o elemento alvo 
   está lá dentro.
5. Interrupção de Fluxo ('break'): Interrompe o laço 'while' imediatamente assim que a 
   condição do 'if' se torna verdadeira, enviando o programa para a última linha.
"""

# Inicializa o conjunto de letras vazio
letras = set()

# Inicia o laço de repetição (True com 'T' maiúsculo)
while True:
    letra = input("Digite uma letra: ")
    
    # Adiciona a letra sempre em formato minúsculo ao conjunto
    letras.add(letra.lower())

    # Verifica se a letra secreta "l" já foi adicionada ao conjunto
    if "l" in letras:
        print("Parabéns! Você encontrou a letra secreta.")
        break  # Encerra o jogo

# Exibe a última letra digitada que causou a vitória
print("Letra vencedora:", letra)