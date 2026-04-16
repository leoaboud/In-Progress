"""
RESUMO DIDÁTICO:
Este script aborda a diferença fundamental entre atribuição e cópia de objetos na 
memória. Ao utilizar o método .copy(), o Python cria uma "Shallow Copy" (cópia rasa), 
gerando uma nova lista em um endereço de memória distinto, mas com os mesmos elementos 
iniciais. Isso garante a independência entre as estruturas: quando o primeiro elemento 
de 'lista_a' é alterado para 'Qualquer coisa', a 'lista_b' permanece intacta com os 
dados originais. Essa técnica é essencial para manipular dados com segurança, 
evitando que modificações acidentais em uma variável afetem outras partes do programa 
que referenciam a mesma lista.
"""

lista_a = ['Luiz,', 'Maria', 1, True, 1.2]
lista_b = lista_a.copy()

lista_a[0] = 'Qualquer coisa'

print(lista_a)
print(lista_b)