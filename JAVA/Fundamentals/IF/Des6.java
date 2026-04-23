import java.util.Scanner;

public class Des6 {
    public static void main(String[] args){
        Scanner entrada = new Scanner(System.in);

        System.out.print("Digite um número: ");
        int numero = entrada.nextInt();

        if(numero > 0){
            System.out.print("Número positivo!");
        }
        else if(numero == 0){
            System.out.print("Número é zero");
        }
        else{
            System.out.print("Número negativo");
        }

        entrada.close();
    }    
}
