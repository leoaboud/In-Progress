package Desafios.While;

import java.util.Scanner;

public class Des3 {
        public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);
        
            int num = -1;
            while(num != 0){
                System.out.print("Digite um número: ");
                num = entrada.nextInt();
            }
        System.out.println("Programa encerrado!");
        entrada.close();
        }
}
