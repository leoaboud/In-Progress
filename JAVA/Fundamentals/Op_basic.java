public class Op_basic {
    public static void main(String[] args) {
        System.out.println("--------------------------------------");

        int a = 10;
        int b = 3;

        System.out.println("OPeradores aritméticos");
        System.out.println("Soma: "+(a+b));
        System.out.println("Subtração: "+(a-b));
        System.out.println("Multiplicação: "+(a*b));
        System.out.println("Divisão: "+(a/b));
        System.out.println("Resto: "+(a%b));

        System.out.println("--------------------------------------");

        int x = 10;
        int y = 20;

        System.out.println("OPeradores relacionais");
        System.out.println("X é igual a Y? : " + (x == y));
        System.out.println("X é diferente a Y? : " + (x != y));
        System.out.println("X é maior que Y? : " + (x > y));
        System.out.println("X é menor que Y? : " + (x < y));
        System.out.println("X é maior ou igual a Y? : " + (x >= y));
        System.out.println("X é menor ou igual a Y? : " + (x <= y));

        System.out.println("--------------------------------------");

        int idade = 27;
        boolean tem_carteira = true;
        boolean pode_dirigir = (idade >= 18) && tem_carteira; // E
        boolean pode_viajar =  (idade >= 18) || tem_carteira; // OU
        boolean não_tem_carteira = !tem_carteira;             // NÃO

        System.out.println("Operadores lógicos");
        System.out.println("Pode dirigir? " + pode_dirigir);
        System.out.println("Pode viajar sozinho? " + pode_viajar);
        System.out.println("Não tem carteira? " + não_tem_carteira);
    }
    
}
