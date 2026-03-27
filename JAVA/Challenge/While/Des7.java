package Challenge.while;

import java.util.Scanner;

public class Des7 {
    public static void main(String[] args) {

        Scanner entrada = new Scanner(System.in);
        String senha = "";

        while (!senha.equals("1234")) {
            System.out.print("Digite a senha: ");
            senha = entrada.nextLine();

            if (!senha.equals("1234")) {
                System.out.println("Senha incorreta");
            }
        }

        System.out.println("Senha correta.");
        entrada.close();
    }
}