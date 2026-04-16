"""
RESUMO DIDÁTICO:
Este script demonstra o uso de f-strings (Formatted String Literals) para a criação 
de mensagens dinâmicas e formatadas. O código realiza o cálculo do Índice de Massa 
Corporal (IMC) utilizando operadores aritméticos de divisão (/) e exponenciação (**). 
A técnica de formatação '.2f' é aplicada para limitar o número de casas decimais 
da variável 'altura', garantindo uma exibição visualmente padronizada. Essa abordagem 
facilita a interpolação de variáveis dentro de textos, tornando o código mais legível 
e profissional ao manipular dados numéricos e strings simultaneamente.
"""

nome = "Leonardo"
altura = 1.70 
peso = 60

imc = peso / (altura ** 2)

linha1 = f'{nome} tem {altura:.2f} de altura e pesa {peso} Kg'
linha2 = f'Seu IMC é {imc}'

print(linha1)
print(linha2)