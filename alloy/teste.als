/*1. Apenas 3 são rápidos, apenas 2 tem boa memória, apenas um é
compacto.
2. Todas quatro marcas possuem pelo menos uma das características
3. Lenovo e Dell têm a mesma capacidade de memória.
4. Dell e Apple são igualmente rápidos.
5. Apenas um entre Apple e Acer é considerado rápido.
*/

abstract sig Computador{}
sig Rapido,BoaMemoria,Compacto in Computador{}

one sig APPLE, DELL, LENOVO, ACER extends Computador{}

pred ideal[c:Computador]{
    (c in Rapido) && (c in BoaMemoria) && (c in Compacto)
}

fact "restricoes do problema"{
    one x:Computador | ideal[x]

    (#Rapido = 3) && (#BoaMemoria = 2) && (#Compacto = 1)

    all c:Computador | (c in Rapido) or (c in BoaMemoria) or (c in Compacto)

    LENOVO in BoaMemoria <=> DELL in BoaMemoria
    DELL in Rapido <=> APPLE in Rapido

    ((APPLE in Rapido) && (ACER not in Rapido)) or ((APPLE not in Rapido) && (ACER in Rapido))
}

run{}