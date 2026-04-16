"""
RESUMO DIDÁTICO:
Este script gerencia um sistema simples de autenticação e navegação utilizando lógica 
booleana e operadores condicionais (if/elif/else). O código valida a escolha do usuário 
para entrar ou sair do sistema, verificando simultaneamente a senha cadastrada. 

Destaque para o uso do operador 'not' para inverter expressões lógicas: no primeiro bloco, 
ele confirma se a senha está correta negando uma desigualdade; no segundo, identifica a 
opção de saída negando a condição de que a entrada seja diferente de 'S'. É um exemplo 
prático de como controlar o fluxo de uma aplicação através de múltiplas validações.
"""

entrada = input('[E]ntrada [S]aír: ')
senha_digitada = input('Senha: ')

senha = '0000'

if (entrada == 'E' or entrada == 'e') and not (senha_digitada != senha):
    print('Entrar')
elif not (entrada != 'S' and entrada != 's'):
    print('Sair')
else:
    print('Opção inválida ou senha incorreta')