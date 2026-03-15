import java.util.Scanner;
public class Des3{
    public static void main(String[] args){
        Scanner entrada = new Scanner(System.in);

        System.out.print("Digite um número: ");
        int num_A = entrada.nextInt();

        System.out.print("Digite um número: ");
        int num_B = entrada.nextInt();

        if(num_A > num_B){
            System.out.print("A maior que B");
        }
        else if(num_A < num_B){
            System.out.print("A menor que B");
        }
        else{
            System.out.print("A igual a B");
        }
        entrada.close();
    }
}