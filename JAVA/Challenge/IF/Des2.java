import java.util.Scanner;
public class Des2 {
    public static void main(String[] args){
        Scanner entrada = new Scanner(System.in);
        
        System.out.print("Digite um número: ");
        int numero =  entrada.nextInt();

        if(numero % 2 != 0){
            System.out.print("Número impar!");
        }
        else{
            System.out.print("Número par");
        }
        entrada.close();
    }
}
