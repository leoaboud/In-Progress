import java.util.Scanner;

public class While {
    public static void main(String[] args) {
        Scanner entrada = new Scanner (System.in);

        System.out.println("\n1. Contando de 1 até 5\n");
        int crescente = 1;

        while (crescente <= 5) {
            System.out.println("Contador: " + crescente);
            crescente ++;
        }
        
        System.out.println("\n2. Contando de 1 até 5\n");
        int descrescente = 5;

        while (descrescente >= 1) {
            System.out.println("Contador: " + descrescente);
            descrescente --;
        }
        
        System.out.println("\n3. Somando total de 1 até 10\n");
        int soma = 0;
        int i = 1;

        while (i <= 10) {
                soma += i;
                i ++;
        }
        System.out.println("A soma toda dos números é: " + soma);
    }
}

