"""
RESUMO DIDÁTICO:
Este script explora a versatilidade do laço 'while' para repetições baseadas em 
condições lógicas. O código demonstra desde contadores simples e acumulação de 
strings até estruturas complexas como laços aninhados (while dentro de while). 
São destacados dois comandos cruciais de controle: o 'break', que interrompe 
imediatamente a execução do laço, e o 'continue', que pula o restante do código 
no ciclo atual e volta para o teste da condição inicial. Essas ferramentas 
permitem criar fluxos dinâmicos, como menus de usuário que aguardam uma palavra-chave 
específica para fechar ou filtros que ignoram intervalos de números durante o processamento.
"""

# BLOCO 1: Laço Infinito com Saída Estruturada (Break)
# O laço roda até que a palavra 'sair' seja digitada.
condicao = True
while condicao:
    nome = input("Digite seu nome (ou 'sair'): ")
    if nome == 'sair':
        break
    print(f'seu nome é {nome}')

# ---------------------------------

# BLOCO 2: Contador Simples
contador = 0
while contador <= 10:
    print(f'Contagem: {contador}')
    contador += 1
print("Contagem acabou")

# ---------------------------------

# BLOCO 3: Controle de Fluxo com Continue e Break
# Pula números específicos e para antes do limite final.
contador = 0
while contador <= 100:
    contador += 1
    if contador == 6:
        print('Não vou mostrar o 6')
        continue
    if 10 <= contador <= 27:
        # Pula toda a execução entre 10 e 27
        continue 
    print(contador)
    if contador == 40:
        break
print("Fluxo interrompido no 40")

# ---------------------------------

# BLOCO 4: Laços Aninhados (Matriz/Coordenadas)
qtd_linhas = 5
qtd_colunas = 5
linha = 1 
while linha <= qtd_linhas:
    coluna = 1
    while coluna <= qtd_colunas:
        print(f'{linha=}, {coluna=}')
        coluna += 1
    linha += 1
print('Acabou as coordenadas')

# ---------------------------------

# BLOCO 5: Iteração em Strings com While
# Equivalente ao comportamento do 'for', mas controlado manualmente por índice.
nome_exemplo = 'Leonardo'
indice = 0 
novo_texto = ''
while indice < len(nome_exemplo):
    letra = nome_exemplo[indice]
    novo_texto += f'*{letra}'
    indice += 1
print(f'Texto transformado: {novo_texto}*')