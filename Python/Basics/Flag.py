"""
RESUMO DIDÁTICO:
Este script ilustra o conceito de controle de estado e a utilização do valor nulo (None) 
para rastrear o fluxo de execução de um programa. Através de uma variável de controle 
inicializada como None, o código consegue identificar se um bloco específico do 'if' 
foi executado ou se o fluxo seguiu pelo caminho alternativo (else). O uso dos operadores 
de identidade 'is' e 'is not' é fundamental para verificar se a variável ainda mantém 
seu estado original de "vazio" (None) ou se foi modificada por uma ação do sistema, 
permitindo decisões lógicas baseadas no histórico de execução.
"""

condicao = False 
passou_no_if = None


if condicao:
    passou_no_if = True
    print("Faça algo")
else:
    print("Não faça algo")

print(passou_no_if, passou_no_if is None)
print(passou_no_if, passou_no_if is not None)

if passou_no_if is None:
    print("Não passou no if")

if passou_no_if is not None:
    print("Passou no if")