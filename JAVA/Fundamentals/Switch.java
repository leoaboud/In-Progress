import java.util.Scanner;

public class Switch {
    public static void main(String[] args){
        Scanner entrada = new Scanner(System.in);

        System.out.println("Escolha sua cor favorita:");
        System.out.println("1 - Verde");
        System.out.println("2 - Amarelo");
        System.out.println("3 - Vermelho");
        System.out.print("Digite o número da sua cor favorita: ");

        int opcao = entrada.nextInt();

        switch(opcao) {
            case 1:
                System.out.println("Você escolheu Verde");
                break;

            case 2:
                System.out.println("Você escolheu Amarelo");
                break;

            case 3:
                System.out.println("Você escolheu Vermelho");
                break;

            default:
                System.out.println("Opção inválida!");
        }

        entrada.close();
    }
}