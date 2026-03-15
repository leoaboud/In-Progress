/*
package Exemplos;
public // exemplo IF - 01
    public static void main(String[] args) {
        int idade = 27;
        if (idade >= 18) {
            System.out.println("Você é maior de idade? " + (idade >= 18));
        }



    // exemplo IF - 02
    public static void main(String[] args) {
        double nota = 7.1;

        if (nota >= 7) {
        System.out.println("Aluno aprovado");
        }

        else if (nota >= 5) {
        System.out.println("Aluno em recuperação");
        }

        else {
        System.out.println("Aluno retido!");
        }
    }



    // exemplo IF - 03 -- sempre import 1º > public 
import java.util.Scanner;
    public class Main{
        public static void main(String[] args) {
            Scanner entrada = new Scanner (System.in);
            System.out.print("Digite nota do aluno: ");

            double nota = entrada.nextDouble();

            if (nota >= 7) {
            System.out.println("Aluno aprovado");
            }

            else if (nota >= 5) {
            System.out.println("Aluno em recuperação");
            }

            else {
            System.out.println("Aluno retido!");
            }
            
            entrada.close();
        }
    }


    
    // exemplo IF - 04
import java.util.Scanner;
    public class Main{
        public static void main(String[] args) {
            Scanner entrada = new Scanner(System.in);

            System.out.print ("Digite sua idade: ");
            int idade = entrada.nextInt();

            entrada.nextLine();
            System.out.print("Você é brasileiro ou naturalizado? ");
            String nacionalidade = entrada.nextLine().toLowerCase();

            if (idade >= 16 && nacionalidade.equals("sim")) {
                System.out.println("Você pode votar");
            }
            else if (idade <= 16 && nacionalidade.equals("sim")) {
                System.out.println("Você não pode votar");
            }
            else{
                System.out.print("Não tinha nem que perguntar");
            }
            entrada.close();
        }
    }



    // exemplo IF - 05
import java.util.Scanner;
    public class Main{
        public static void main(String[] args) {
            Scanner entrada = new Scanner(System.in);
            
            System.out.print("Digite sua idade: ");
            int idade = entrada.nextInt();
            entrada.nextLine();

            System.out.print("Você é estudante? ");
            String estudante = entrada.nextLine().toLowerCase();
            
            if(idade < 18 || estudante.equals("sim")) { // 1 condição pelo menos
                System.out.println("Você tem direito a meia-entrada");
            }
            else {
                System.out.println("Você só é liso");
            }
            entrada.close();
        }
    }



// exemplo IF - 06
public class Main{
    public static void main(String[] args) {
        boolean tem_CNH = false;

        if (!tem_CNH) {
            System.out.println("Você não tem carteira");
        }
    }
    } IF {
    
}
*/