sig Fazendeiros{}
one sig A,B,C extends Fazendeiros{}
one sig DonoMula in Fazendeiros{}

pred A1{
    C in DonoMula
}

pred A2{
    A not in DonoMula
}

pred B1{
    C not in DonoMula
}

pred B2{
    A in DonoMula
}

pred C1{
    C in DonoMula
}

pred C2{
    A not in DonoMula
}

fact "mentiras"{
    #DonoMula = 1

    ((A1) and !(A2)) or (!(A1) and (A2))
    ((B1) and !(B2)) or (!(B1) and (B2))
    ((C1) and !(C2)) or (!(C1) and (C2))
}

run{}