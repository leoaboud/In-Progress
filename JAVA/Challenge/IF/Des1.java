
import java.util.Scanner;

public class Des1 {

    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        System.out.print("Digite um número: ");
        int numero = entrada.nextInt();

        if (numero > 0) {
            System.out.print("Seu número é positivo");
        } else if (numero < 0) {
            System.out.print("Seu número é negativo");
        } else {
            System.out.print("Seu número é zero");
        }

        entrada.close();
    }
}
