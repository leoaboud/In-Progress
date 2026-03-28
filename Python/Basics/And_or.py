
entrada = input('[E]ntrada [S]aír: ')

senha_digitada = input('Senha: ')

senha = '0000'

if (entrada == 'E' or entrada == 'e') and not (senha_digitada != senha):

    print('Entrar')

elif not (entrada != 'S' and entrada != 's'):

    print('Sair')

else:

    print('Opção inválida ou senha incorreta')