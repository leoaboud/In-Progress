algoritmo "Operdores Relacionais"

var
    L1, L2, L3: real
    EQ, ES, TRI: logico

inicio

    escreva("Digite o primeiro lado: ")
    leia (L1)
    escreva("Digite o primeiro lado: ")
    leia (L2)
    escreva("Digite o primeiro lado: ")
    leia (L3)

    TRI <- (L1 < L2 + L3) e (L2 < L3 + L1) e (L3 < L2+ L1)
    EQ  <- (L1 = L2) e (L2 = L3)
    ES  <- (L1 <> L2) e (L2 <> L3) e (L3 <> L1)

    escreval ("Podeformarr um TRINAGULO? ", TRI)
    escreval ("O trinagulo é EQUILATERO? ", EQ)
    escreval ("O trinagulo é ESCALENO? ", ES)

fimalgoritmo