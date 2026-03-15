import java.util.Scanner;

public class Des8 {
    public static void main(String[] args){
        Scanner entrada = new Scanner(System.in);

        System.out.print("Digite sua nota 1: ");
        double nota1 = entrada.nextDouble();

        System.out.print("Digite sua nota 2: ");
        double nota2 = entrada.nextDouble();

        System.out.print("Digite sua nota 3: ");
        double nota3 = entrada.nextDouble();

        double media = (nota1 + nota2 + nota3) / 3;

        if (media >= 7.0){
            System.out.println("Aluno aprovado!");
        }
        else if (media >= 5.0){
            System.out.println("Aluno de recuperação");
        }
        else{
            System.out.println("Aluno reprovado!");
        }

        entrada.close();
    }
}