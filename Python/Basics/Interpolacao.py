"""
RESUMO DIDÁTICO:
Este script demonstra o uso da Interpolação de Strings com o operador de porcentagem (%), 
um método herdado da linguagem C (estilo printf). O código utiliza placeholders 
específicos para diferentes tipos de dados: '%s' para strings, '%f' para números de 
ponto flutuante e '%d' para inteiros. Além da substituição, o script exemplifica o 
controle de formatação, limitando as casas decimais de um valor monetário (%.2f) e 
convertendo um número decimal para sua representação Hexadecimal (%X), incluindo o 
preenchimento com zeros à esquerda (%08X) para manter um tamanho fixo de caracteres.
"""

nome = 'Leonardo'
preco = 1000.15286

# Interpolação com string e float (limitado a 2 casas decimais)
variavel = '%s, o preço é de R$%.2f' % (nome, preco)
print(variavel)

# Interpolação com decimal e conversão para hexadecimal de 8 dígitos
print('O hexadecimal de %d é %08X' % (1500, 1500))