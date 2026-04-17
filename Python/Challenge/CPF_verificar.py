"""
RESUMO DIDÁTICO:
Este script implementa o Algoritmo de Validação do CPF (Cadastro de Pessoas Físicas), 
utilizando lógica matemática para verificar a autenticidade dos dígitos verificadores. 
O código utiliza Expressões Regulares (módulo 're') para limpar a entrada, garantindo 
que apenas números sejam processados. A lógica de validação consiste em dois ciclos 
de somatórios ponderados: o primeiro valida o 10º dígito e o segundo o 11º. Além dos 
cálculos, o script possui uma trava de segurança que detecta sequências repetidas 
(ex: '111.111.111-11'), as quais, embora passem matematicamente pela fórmula, são 
inválidas por definição da Receita Federal. Ao final, o script reconstrói um CPF 
teórico e o compara com o enviado pelo usuário para determinar sua validade.
"""

import re
import sys

entrada = input('Digite seu CPF: ')

# Limpeza de dados: remove qualquer caractere que não seja número (0-9)
cpf_enviado = re.sub(
    r'[^0-9]',
    '',
    entrada
)

# Validação de sequências: impede que números como '111.111.111-11' passem
entrada_sequencial = entrada == entrada[0] * len(entrada)
if entrada_sequencial:
    print('Você enviou dados sequenciais')
    sys.exit()

# Cálculo do Primeiro Dígito Verificador (10º dígito)
nove_digitos = cpf_enviado[:9]
contador_1 = 10
resultado_1 = 0

for digito in nove_digitos:
    resultado_1 += int(digito) * contador_1
    contador_1 -= 1 
digito_1 = (resultado_1 * 10) % 11
digito_1 = digito_1 if digito_1 <= 9 else 0 

# Cálculo do Segundo Dígito Verificador (11º dígito)
dez_digitos = nove_digitos + str(digito_1)
contador_2 = 11
resultado_2 = 0

for digito in dez_digitos:
    resultado_2 += int(digito) * contador_2
    contador_2 -= 1 
digito_2 = (resultado_2 * 10) % 11
digito_2 = digito_2 if digito_2 <= 9 else 0 

# Verificação Final
novo_cpf = f'{nove_digitos}{digito_1}{digito_2}'

if cpf_enviado == novo_cpf:
    print(f'O CPF {cpf_enviado} é válido')
else:
    print(f'O CPF {cpf_enviado} é inválido')