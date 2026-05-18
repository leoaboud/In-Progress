"""
RESUMO DIDÁTICO:
Este script demonstra o ciclo de vida de uma chave em um dicionário:
1. Criação Dinâmica: Usar uma variável ('chave') para definir o nome de um campo.
2. Mutabilidade: Alterar o valor de uma chave já existente ('nome').
3. Deleção: Remover permanentemente uma chave do mapa de dados usando 'del'.
4. Verificação Segura: O uso do método '.get()' para evitar que o programa 
   trave (KeyError) ao tentar acessar algo que foi deletado.
"""

pessoa = {}

# Definimos o nome da chave através de uma variável
chave = 'nome'

# Atribuição: Criamos a chave 'nome' e 'sobrenome'
pessoa[chave] = 'Leonardo'
pessoa['sobrenome'] = 'Aboud'

print(pessoa[chave]) # Exibe: Leonardo

# Alteração: O valor da chave 'nome' é sobrescrito
pessoa[chave] = 'Giulia'

# Deleção: Removemos a chave 'sobrenome' e seu valor do dicionário
del pessoa['sobrenome']

print(pessoa)        # Exibe apenas {'nome': 'Giulia'}
print(pessoa['nome']) # Exibe: Giulia

# Verificação de existência:
# Como 'sobrenome' foi deletado acima, .get() retornará None
if pessoa.get('sobrenome') is None:
    print('NÃO EXISTE')
else:
    print(pessoa['sobrenome'])