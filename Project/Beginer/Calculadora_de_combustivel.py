"""
[01] Calculadora de Combustível de Voo 
Prazo Estimado: Semanal 
Nível Alvo: Iniciante 
Tecnologias: Python puro (variáveis, condicionais, funções) 
Objetivo de Negócio: Estimar consumo de combustível de uma aeronave dado distância, 
velocidade de cruzeiro e consumo/hora. Desafio Técnico: Estruturar lógica condicional limpa, 
evitar "spaghetti code", tratar entradas inválidas (distância negativa). 
Métrica de Sucesso: Litros necessários + margem de reserva (regra dos 30 min extra) 
decisão de "pode decolar com esse tanque?".

| Boeing 737 MAX 8 | ~20640 | ~25800 | Mach 0.79 (~850 km/h) | 20% - 25% | 2000 - 2300 |
| Airbus A320neo   | ~18636 | ~26730 | Mach 0.78 (~833 km/h) | 22% - 26% | 2200 - 2400 |
| Embraer E195-E2  | ~13690 | ~17100 | Mach 0.82 (~876 km/h) | 18% - 22% | 1600 - 1800 |
"""

# Importo a biblioteca random para gerar números aleatórios dentro dos intervalos de consumo
import random
# Importo a biblioteca os para conseguir mandar comandos para o sistema operativo
import os

# Crio uma função para limpar a tela do terminal e deixar o output mais organizado
def limpar_terminal():
    # Se o sistema operativo for Windows (nt), uso o comando cls
    if os.name == 'nt':
        os.system('cls')
    # Se for Linux ou Mac, uso o comando clear
    else:
        os.system('clear')

# Mostro o menu de opções de aeronaves para o utilizador
print("1 - Boeing 737 MAX 8")
print("2 - Airbus A320neo")
print("3 - Embraer E195-E2")

# Peço ao utilizador para digitar o número correspondente ao avião
opcao = input("Selecione seu modelo de aeronave, com respectivo número: ")

# Valido se a opção digitada é válida, caso não seja "1", "2" ou "3", fecho o programa
if opcao not in ["1", "2", "3"]:
    print("Opcao invalida")
    exit()

# Peço a distância do voo em quilómetros e transformo o input em número inteiro
distancia = int(input("Digite a distância dos aeroportos em KM: "))

# Valido se a distância é maior que zero para evitar números negativos ou voos sem distância
if distancia <= 0:
    print("Erro: A distância deve ser um número maior que zero!")
    exit()

# Chamo a função que criei lá em cima para limpar o terminal antes de exibir o relatório
limpar_terminal()

# Uso o match/case para carregar na memória os dados técnicos do avião escolhido
match opcao:
    case "1":
        modelo_nome = "Boeing 737 MAX 8"
        mach = 0.79
        # Sorteio o consumo horário dentro do intervalo técnico deste modelo
        consumo = random.randint(2000, 2300)      
        # Sorteia a percentagem gasta na descolagem dentro do intervalo técnico
        p_decolagem = random.uniform(0.20, 0.25)
        tankmax = 25800
    case "2":
        modelo_nome = "Airbus A320neo"
        mach = 0.78
        consumo = random.randint(2200, 2400)       
        p_decolagem = random.uniform(0.22, 0.26)
        tankmax = 26730
    case "3":
        modelo_nome = "Embraer E195-E2"
        mach = 0.82
        consumo = random.randint(1600, 1800)       
        p_decolagem = random.uniform(0.18, 0.22) 
        tankmax = 17100

# Calculo o tempo total de voo em minutos (multiplicando a velocidade Mach por 1060 para ter KM/H)
tempoemminutos = round((distancia / (mach * 1060)) * 60)
# Extraio a parte inteira das horas dividindo o total de minutos por 60
horasdevoo = tempoemminutos // 60
# Descubro os minutos restantes usando o resto da divisão por 60
minutosrestantes = tempoemminutos % 60

# Calculo o combustível gasto na rota com base nos minutos de voo e no consumo por minuto
consumofuel = round(tempoemminutos * (consumo / 60))
# Defino a reserva fixa de 30 minutos adicionais exigida pelo desafio (metade do consumo de 1 hora)
reserva_30min = round(consumo / 2)
# Somo o combustível da rota com a reserva para obter a massa mínima necessária em Kg
fuelordermin_kg = consumofuel + reserva_30min
# Calculo o peso gasto estimado especificamente para a fase de decolagem e subida
decolagem = consumofuel * p_decolagem

# Converto a massa total necessária (Kg) para volume (Litros) multiplicando por 1.24
fuelordermin_l = round(fuelordermin_kg * 1.24)

# Entro na condicional de decisão para verificar se o combustível necessário cabe no tanque do avião
if fuelordermin_l > tankmax:
    # Se o combustível necessário for maior que a capacidade, o voo é cancelado por segurança
    print(f"\nVOO CANCELADO: O {modelo_nome} não pode realizar este voo!")
    print(f"Motivo: O combustível necessário ({fuelordermin_l} L) excede a capacidade máxima do tanque ({tankmax} L).")
    print(f"Faltam {fuelordermin_l - tankmax} Litros de capacidade para cumprir esta rota com segurança.")

else:
    # Se o combustível couber no tanque, o voo é autorizado e exibo o relatório final formatado
    print(f"\nVOO AUTORIZADO! --- RELATÓRIO DE VOO ({modelo_nome}) ---")
    print(f"O tempo de voo é {horasdevoo:02d}:{minutosrestantes:02d}, consumindo {consumofuel} Kg de QAV na rota.")
    print(f"Reserva regulamentar (30 min): {reserva_30min} Kg.")
    print(f"Abastecimento mínimo necessário: {fuelordermin_kg} Kg (~{fuelordermin_l} Litros).")
    print(f"Capacidade máxima do tanque da aeronave: {tankmax} Litros.")
    print(f"Destes, cerca de {decolagem:.0f} Kg serão consumidos especificamente na decolagem/subida.")