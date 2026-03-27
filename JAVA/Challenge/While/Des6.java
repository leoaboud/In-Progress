package Challenge.while;

import java.util.Scanner;

public class Des6 {

    public static void main(String[] args) {

        Scanner entrada = new Scanner(System.in);

        int numero;
        int contador = 0;

        System.out.print("Digite um número (0 para encerrar): ");
        numero = entrada.nextInt();

        while (numero != 0) {
            if (numero > 0) {
                contador++;
            }

            System.out.print("Digite outro número: ");
            numero = entrada.nextInt();
        }

        System.out.println("Quantidade de números positivos: " + contador);

        entrada.close();
    }
}