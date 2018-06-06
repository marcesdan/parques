package parques

class AreaProtegida {

    String parque,
           localidad,
           provincia,
           delegacion,
           ano_creacion,
           superficie,
           objetivo

    Double lat, lng
    PortadaArea imagen_principal
    Logo logo

    static hasMany = [objetivos: Objetivo, especies: Especie]

    static constraints = {
        localidad nullable: true
        provincia nullable: true
        delegacion nullable: true
        ano_creacion nullable: true
        superficie nullable: true
        objetivo nullable: true
        logo nullable: true
        imagen_principal nullable: true
    }
    static mapping = {
        objetivo sqlType: 'text'
    }
}
