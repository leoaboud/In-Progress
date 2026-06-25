"""
RESUMO DIDÁTICO: Gerenciamento de Listas Interativas e Tratamento de Exceções em Python

Este código ilustra a criação de uma aplicação de terminal interativa para gerenciar uma lista 
de compras ou tarefas, abordando manipulação de arrays, controle de fluxo e segurança de dados.

O código ilustra:
1. Interação com o Sistema Operacional ('os.system'): Utiliza o módulo nativo 'os' para executar 
   comandos do terminal do Windows. O 'os.system('cls')' limpa a tela, deixando o menu visualmente 
   mais limpo para o usuário após uma ação.
2. Mutabilidade de Listas ('.append()' e 'del'): Demonstra as operações básicas de listas: 
   '.append(valor)' adiciona um elemento ao final da estrutura, enquanto 'del lista[indice]' remove 
   um elemento baseado na sua posição numérica exata.
3. Tratamento Seguro de Erros ('try / except'): Um ponto crítico ao lidar com índices de listas. 
   Se o usuário digitar um texto em vez de número, ou tentar apagar um índice que não existe, o 
   bloco 'except' captura a falha e impede que o programa feche abruptamente (Crash).
4. Varredura com Índices ('enumerate()'): A função 'enumerate(lista)' permite percorrer a lista 
   em um laço 'for' extraindo, ao mesmo tempo, a posição numérica ('i') e o conteúdo ('valor') 
   de cada item armazenado.
"""

import os 

# Inicializa a lista vazia na memória
lista = []

# Inicia o laço principal da aplicação de terminal
while True:
    print('Selecione uma opção')
    opcao = input('[i]nserir, [a]pagar, [l]istar: ').lower() # Adicionado .lower() por segurança

    # Operação: Inserir
    if opcao == 'i':
        os.system('cls')
        valor = input('Valor: ')
        lista.append(valor)
        
    # Operação: Apagar
    elif opcao == 'a':
        indice_str = input('Escolha o índice para apagar: ')

        # Tenta converter e deletar para evitar quebras de execução
        try:
            indice = int(indice_str)
            del lista[indice]
            print(f'Índice {indice} apagado com sucesso!')
        except ValueError:
            print('Por favor, digite um número inteiro válido.')
        except IndexError:
            print('Esse índice não existe na lista.')
        except Exception:
            print('Não foi possível apagar esse índice.')
            
    # Operação: Listar
    elif opcao == 'l':
        os.system('cls')

        # Verifica se a lista está vazia através do seu comprimento (len)
        if len(lista) == 0:
            print('Nada para listar')

        # Percorre a lista gerando o índice e o valor simultaneamente
        for i, valor in enumerate(lista):
            print(i, valor)