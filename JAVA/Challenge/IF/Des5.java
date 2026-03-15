import java.util.Scanner;

public class Des5 {
    public static void main(String[]args){
        Scanner entrada = new Scanner(System.in);
        
        System.out.print("Digite seu número: ");
        int numero = entrada.nextInt();

        if(numero % 3 == 0 && numero % 5 == 0){
            System.out.print("Número dentro do padrão");
        }
        else{
            System.out.print("Número fora do padrão");
        }

        entrada.close();
    }
}
