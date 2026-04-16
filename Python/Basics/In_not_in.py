"""
RESUMO DIDÁTICO:
Este script utiliza os operadores de associação 'in' e 'not in' para verificar a 
existência de uma subconjunto de caracteres dentro de uma string maior. Através 
da função input(), o programa coleta o nome do usuário e o termo de busca. A 
estrutura condicional valida se a sequência digitada faz parte da variável 'nome', 
retornando um valor booleano que decide qual mensagem será exibida. É uma forma 
extremamente simples e poderosa do Python para realizar buscas em textos sem a 
necessidade de métodos complexos ou laços de repetição manuais.
"""

nome = input('Digite seu nome: ')
encontrar = input('Digite o que deseja encontrar: ')

if encontrar in nome:
    print(f'{encontrar} está em {nome}')
else:
    print(f'{encontrar} não está em {nome}')