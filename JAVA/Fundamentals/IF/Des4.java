import java.util.Scanner;

public class Des4 {
    public static void main(String[]args){
        Scanner entrada = new Scanner(System.in);

        System.out.print("Digite um numero: ");
        int numero = entrada.nextInt();

        if(numero > 10 && numero < 100){
            System.out.print("número dentro do inervalo!");
        }
        else{
            System.out.print("Número fora do intervalo!");
        }
        entrada.close();
    }
}
