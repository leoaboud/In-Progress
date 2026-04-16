"""
RESUMO DIDÁTICO:
Este script demonstra a estrutura fundamental de controle de fluxo utilizando as 
cláusulas 'if', 'elif' (else if) e 'else'. O programa direciona a execução para 
blocos de código distintos baseados na entrada do usuário: o 'if' trata a condição 
primária, o 'elif' oferece uma alternativa específica caso a primeira seja falsa, 
e o 'else' serve como um "capturador universal" para qualquer entrada que não 
corresponda às opções esperadas. A linha final exemplifica que, independentemente 
de qual bloco condicional foi executado, o programa sempre retoma o fluxo linear 
após a estrutura de decisão.
"""

entrada = input("Você quer entrar ou sair? ")

if entrada == 'entrar':
    print('Você entrou')

elif entrada == 'sair':
    print('Você saiu')

else:
    print('Anta')

print('Fora do bloco')