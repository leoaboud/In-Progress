package Desafios.Switch;

import java.util.Scanner;

public class Des3 {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        System.out.print("Digite uma letra: ");
        char letra = entrada.next().toLowerCase().charAt(0);

        switch(letra){
            case 'a':
            case 'e':
            case 'i':
            case 'o':
            case 'u':
                System.out.println("É uma vogal!");
                break;

            default:
                if(Character.isLetter(letra)){
                    System.out.println("É uma conosoante");
                }
                else{
                    System.out.println("Caractere inválido. Digite uma letra");
                }
        }
        entrada.close();
    }
    
}
