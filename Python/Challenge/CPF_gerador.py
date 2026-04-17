"""
RESUMO DIDÁTICO:
Este script evolui a lógica de validação para a Automação de Geração de CPFs Válidos, 
utilizando o módulo 'random' para criar dados sintéticos. O código utiliza um laço 
'for' principal para gerar 100 CPFs distintos. Para cada ciclo, são sorteados 9 
dígitos aleatórios que servem como base para o cálculo dos dois dígitos verificadores, 
seguindo rigorosamente a fórmula matemática oficial. Essa abordagem é extremamente 
útil para desenvolvedores que precisam de grandes volumes de dados realistas para 
testar sistemas de cadastro e bancos de dados sem utilizar informações reais de 
pessoas físicas, garantindo a conformidade com as regras de validação durante o 
desenvolvimento de software.
"""

import random

# Gera 100 CPFs válidos para testes
for _ in range(100):
    # Parte 1: Gera os 9 dígitos iniciais aleatoriamente
    nove_digitos = ''
    for i in range(9):
        nove_digitos += str(random.randint(0, 9))

    # Parte 2: Cálculo do primeiro dígito verificador
    contador_1 = 10
    resultado_1 = 0
    for digito in nove_digitos:
        resultado_1 += int(digito) * contador_1
        contador_1 -= 1
    
    digito_1 = (resultado_1 * 10) % 11
    digito_1 = digito_1 if digito_1 <= 9 else 0

    # Parte 3: Cálculo do segundo dígito verificador
    # Nota: No cálculo do segundo dígito, a base deve ser os 10 dígitos (9 + digito_1)
    dez_digitos = nove_digitos + str(digito_1)
    contador_2 = 11
    resultado_2 = 0
    
    # Percorrendo os 10 dígitos agora disponíveis
    for digito in dez_digitos:
        resultado_2 += int(digito) * contador_2
        contador_2 -= 1
        
    digito_2 = (resultado_2 * 10) % 11
    digito_2 = digito_2 if digito_2 <= 9 else 0

    # Parte 4: Montagem e exibição do CPF final
    cpf_gerado = f'{nove_digitos}{digito_1}{digito_2}'
    print(cpf_gerado)