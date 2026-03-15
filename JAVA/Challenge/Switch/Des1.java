package Desafios.Switch;

import java.util.Scanner;

public class Des1 {
    public static void main (String[] args) {
        Scanner entrada = new Scanner (System.in);

        System.out.println("Qual seu dia favorito: ");
        System.out.println("1 - Domingo");
        System.out.println("2 - Segunda-feira");
        System.out.println("3 - Terça-feira");
        System.out.println("4 - Quarta-feira");
        System.out.println("5 - Quinta-feira");
        System.out.println("6 - Sexta-feira");
        System.out.println("7 - Sabádo");
        System.out.print("Digite o número do dia aqui:  ");

        int semana = entrada.nextInt(); 
        switch (semana){
            case 1:
                System.out.println("O seu dia da semana favorito é Domingo!!");
                break;
            case 2:
                System.out.println("O seu dia da semana favorito é Segunda-feira!!");
                break;
            case 3:
                System.out.println("O seu dia da semana favorito é Terça-feira!!");
                break;
            case 4:
                System.out.println("O seu dia da semana favorito é Quarta-feira!!");
                break;
            case 5:
                System.out.println("O seu dia da semana favorito é Quinta-feira!!");
                break;
            case 6:
                System.out.println("O seu dia da semana favorito é Sexta-feira!!");
                break;
            case 7:
                System.out.println("O seu dia da semana favorito é Sabádo!!");
                break;
        }
    entrada.close();
    }
    
}
