"""
RESUMO DIDÁTICO: Tipagem de Variáveis e Exibição de Dados em Python

Este código ilustra como criar variáveis utilizando os quatro tipos de dados primitivos 
mais importantes do Python, além de demonstrar como exibi-los no console.

O código ilustra:
1. Strings ('str'): Cadeias de caracteres utilizadas para textos (como 'nome' e 'sobrenome'). 
   Devem sempre estar envolvidas por aspas simples ou duplas.
2. Inteiros ('int'): Números numéricos inteiros, sem casas decimais (como 'idade' e 'ano_de_nascimento').
3. Ponto Flutuante ('float'): Números decimais (como 'altura'). No Python, a separação de 
   casas decimais deve ser feita obrigatoriamente usando ponto ('.') e nunca vírgula (',').
4. Booleanos ('bool'): Tipo lógico que armazena apenas dois estados: Verdadeiro ('True') ou 
   Falso ('False'). Criado dinamicamente através de uma expressão de comparação ('idade >= 18').
5. Saída de Dados Múltipla ('print()'): A função 'print' consegue receber múltiplos argumentos 
   separados por vírgula. Ao fazer isso, o Python adiciona automaticamente um espaço em branco 
   entre os textos na hora de exibir na tela.
"""

# Declaração de variáveis com diferentes tipos de dados
nome = "Leonardo"
sobrenome = "Aboud"
idade = 27
altura = 1.70
ano_de_nascimento = 1999

# Expressão lógica que resulta em um valor Booleano (True ou False)
maior_de_idade = idade >= 18

# Exibição dos dados no terminal
print('Nome: ', nome)
print('Sobrenome: ', sobrenome)
print('Idade: ', idade)
print('Ano de nascimento: ', ano_de_nascimento)
print('É maior de idade?', maior_de_idade)
print('Altura em metros: ', altura)