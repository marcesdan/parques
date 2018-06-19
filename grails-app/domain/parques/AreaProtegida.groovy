package parques

class AreaProtegida {

    String slug, parque, localidad, provincia, delegacion, ano_creacion, objetivo
    Integer superficie
    Float lat, lng
    PortadaArea imagen_principal
    Logo logo
    Collection especies

    static hasMany = [objetivos: Objetivo, especies: Especie]

    static constraints = {
        slug unique: true
        delegacion inList: ["CENTRO", "CENTRO ESTE", "NEA", "NOA", "PATA SUR", "PATA NORTE"]
        localidad nullable: true
        ano_creacion nullable: true
        superficie min: 8
        objetivo nullable: true
        logo nullable: true
        imagen_principal nullable: true
    }

    static mapping = {
        slug index: "slug_idx"
        objetivo sqlType: 'text'
        logo lazy: false
        imagen_principal lazy: false
    }
}
