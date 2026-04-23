package Challenge.While;

import java.util.Scanner;

public class Des4 {

    public static void main(String[] args) {

        Scanner entrada = new Scanner(System.in);
        int numero = 0;

        while (numero >= 0) {
            System.out.print("Digite um número (negativo para sair): ");
            numero = entrada.nextInt();
        }

        System.out.println("Número negativo digitado. Programa encerrado.");

        entrada.close();
    }
}