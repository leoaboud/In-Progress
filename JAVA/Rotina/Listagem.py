import tkinter as tk
from tkinter import filedialog
import os

def listar_arquivos_da_pasta():
    # Inicializa o tkinter e esconde a janela principal
    root = tk.Tk()
    root.withdraw()

    # Abre o explorador para selecionar UMA pasta
    caminho = filedialog.askdirectory(title='Selecione a pasta desejada')

    if caminho:
        # Lista todos os arquivos e subpastas dentro do diretório selecionado
        itens = os.listdir(caminho)
        
        print(f"\nConteúdo de: {caminho}")
        print("-" * 50)
        
        for item in itens:
            # Verifica se é um arquivo ou uma pasta (opcional, para organizar)
            caminho = os.path.join(caminho, item)
            
            if os.path.isfile(caminho):
                print(f" {item}")
            else:
                print(f"[PASTA]   {item}")
                
        print("-" * 50)
        print(f"Total de itens: {len(itens)}")
    else:
        print("Nenhuma pasta foi selecionada.")

if __name__ == "__main__":
    listar_arquivos_da_pasta()