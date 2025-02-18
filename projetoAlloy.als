sig Usuario {
    perfil: set Perfil,
    amigos: set Usuario,
    exAmigos: set Usuario,
    status: one Status
}

sig Perfil{
    publicacao: set Publicacao,
    status: one Status
}

abstract sig Status {}

one sig Ativo, Inativo extends Status {}

sig Publicacao {}

fact "Restrições"{

    // Um usuário deve ter pelo menos um perfil
    all u: Usuario | #u.perfil > 0

    // Um usuário não pode estar na sua lista de amigos nem de ex amigos (não tá funcionando)
    all u: Usuario | !(u in u.amigos) and !(u in u.exAmigos)

    // Uma publicação só pode pertencer a um perfil
    all publi: Publicacao | all p: Perfil | some p1: Perfil | (p1 != p) and (publi in p.publicacao) implies !(publi in p1.publicacao)

    // Cada perfil está ligado a um usuário
    all p: Perfil | one u: Usuario | p in u.perfil

    // Um usuário inativo possui perfis inativos
    all u: Usuario | all p: Perfil | (u.status = Inativo) and (p in u.perfil) implies p.status = Inativo

    // Cada publicação pertence a um perfil
    all publi: Publicacao | one p: Perfil | publi in p.publicacao
}

run{}
