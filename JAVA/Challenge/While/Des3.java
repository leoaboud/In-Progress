package Challenge.while;

import java.util.Scanner;

public class Des3 {
    public static void main(String[] args) {

        Scanner entrada = new Scanner(System.in);
        int num;

        do {
            System.out.print("Digite um número (0 para sair): ");
            num = entrada.nextInt();
        } while (num != 0);

        System.out.println("Programa encerrado!");
        entrada.close();
    }
}