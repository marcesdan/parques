package parques

class AreaProtegida {

    String parque, localidad, provincia, delegacion, ano_creacion, objetivo
    Integer superficie
    Float lat, lng
    PortadaArea imagen_principal
    Logo logo

    static hasMany = [objetivos: Objetivo, especies: Especie]

    static constraints = {
        parque()
        provincia shared: "strNullable"
        delegacion shared: "strNullable", inList: ["CENTRO", "CENTRO ESTE", "NEA", "NOA", "PATA SUR", "PATA NORTE"]
        localidad shared: "strNullable"
        ano_creacion shared: "strNullable"
        superficie min: 8
        lat()
        lng()
        objetivo shared: "strNullable"
        logo nullable: true
        imagen_principal nullable: true
    }

    static mapping = {
        especies batchSize: 10
        objetivo sqlType: 'text'
        logo lazy: false
        imagen_principal lazy: false
    }
}
