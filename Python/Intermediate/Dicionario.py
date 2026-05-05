"""
RESUMO DIDÁTICO:
Dicionários são estruturas de dados mapeadas. Cada elemento possui uma chave única 
que aponta para um valor. No seu exemplo, você criou um dicionário "aninhado", 
onde a chave 'endereço' contém uma LISTA de outros DICIONÁRIOS. 

Essa é a base para o formato JSON, amplamente utilizado em APIs e bancos de dados 
não-relacionais (NoSQL). O laço 'for' em um dicionário, por padrão, itera sobre 
as CHAVES, permitindo acessar os valores dinamicamente.
"""

pessoa = {
    'nome': 'Leonardo',
    'sobrenome': 'Aboud',
    'idade': 27,
    'altura': 1.7,
    # Aqui temos uma lista de dicionários (muito comum em cadastros)
    'endereço': [
        {'rua': 'tal tal ', 'numero': 123},
        {'rua': 'outra tal ', 'numero': 456}
    ],
}

# Acesso direto via chave
print(pessoa['nome'])
print(pessoa['sobrenome'])
print()

# Iteração dinâmica:
# 'chave' assume o nome da propriedade (ex: 'idade')
# 'pessoa[chave]' acessa o valor guardado naquela propriedade (ex: 27)
for chave in pessoa:
    print(chave, ":", pessoa[chave])