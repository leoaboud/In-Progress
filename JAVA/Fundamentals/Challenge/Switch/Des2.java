package Challenge.switch;

import java.util.Scanner;

public class Des2 {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        System.out.print("Digite o primeiro número: "); 
        double num_1 = entrada.nextDouble();

        System.out.print("Digite o segundo número: ");
        double num_2 = entrada.nextDouble();

        System.out.print("Digite a operação: ");
        char operador = entrada.next().charAt(0);

        switch (operador) {
            case '+':
                System.out.print("Resultado: " + (num_1 + num_2));
                break;

            case '-':
                System.out.print("Resultado: " + (num_1 - num_2));
                break;

            case '*':
                System.out.print("Resultado: " + (num_1 * num_2));
                break;
 
                case '/':
                System.out.print("Resultado: " + (num_1 / num_2));
                break;

            default:
                System.out.print("Opção inválida");
                break;
        }
        entrada.close();
    }
}    

